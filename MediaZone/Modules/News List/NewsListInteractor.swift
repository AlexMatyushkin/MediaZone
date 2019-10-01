//
//  NewsListInteractor.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit
import FeedKit
import SwiftSoup

/// NewsList Module Interactor
class NewsListInteractor: NewsListInteractorProtocol {
    var rssFeed: RSSFeed = RSSFeed()
    var newListRecived: (([RSSnewsList]) -> Void)?
    var errorRecived: ((Error?) -> Void)?
    var fullNewsDescriptionRecived: ((String?, [String]?) -> Void)?
    
    func getNewsList() {
        rssFeed.getRSS(complation: { newsList, error in
            
            guard let listNews = newsList else {
                self.errorRecived?(error)
                return
            }
            
            self.newListRecived?(listNews)
        })
    }
    
    func getFullNewsDescription(url: URL) {
        // This part of code can parse news and get full description
        do {
           let html = try String(contentsOf: url)
           let doc = try SwiftSoup.parse(html).body()
           let fullDescription = try doc?.getElementsByClass("mz-publish__text")
           let text = try fullDescription?.text()
            
            if (try doc?.getElementsByClass("event-container-root")) != nil {
                guard let items = try doc?.getElementsByClass("mz-publish__text__item") else { return }
                var onlineNews = [String]()
                
                for item in items {
                    let text = try item.text()
                    onlineNews.append(text)
                }
                self.fullNewsDescriptionRecived?(text, onlineNews)
            }
            
        } catch {
            print("Error")
        }
    }
}
