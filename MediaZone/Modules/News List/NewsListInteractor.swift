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
    var errorRecived: ((Error?) -> Void)?
    var fullNewsDescriptionRecived: ((FullNews) -> Void)?
    var listOfNewsRecived: (([RSSnews]) -> Void)?
    
    func getNewsList() {
        rssFeed.getRSS(complation: { [weak self] newsList, error in
            
            guard let listNews = newsList else {
                self?.errorRecived?(error)
                return
            }
            
            self?.listOfNewsRecived?(listNews)
        })
    }
    
   func getFullNewsDescription(url: URL, news: RSSnews){
        // This part of code can parse news and get full description
        do {
           let html = try String(contentsOf: url)
           let doc = try SwiftSoup.parse(html).body()
           let fullDescription = try doc?.getElementsByClass("mz-publish__text")
           guard let title = news.title else { return }
           guard let text = try fullDescription?.text() else { return }
           var isHideOnline = false
            
            if (try doc?.getElementsByClass("event-container-root")) != nil {
                guard let items = try doc?.getElementsByClass("mz-publish__text__item") else { return }
                var onlineNews = [String]()
                
                for item in items {
                    let text = try item.text()
                    onlineNews.append(text)
                }
                
                if onlineNews.isEmpty {
                    isHideOnline = true
                } else {
                    isHideOnline = false
                }
                
                DispatchQueue.main.async {
                  self.fullNewsDescriptionRecived?(FullNews(isOnline: isHideOnline, title: title, fullDescription: text, onlineSubject: onlineNews, date: news.publishDate, image: news.image))
                }
                
            }
            
        } catch {
            print("Error")
        }
    }
}
