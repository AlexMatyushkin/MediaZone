//
//  RSSFeed.swift
//  MediaZone
//
//  Created by Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import Foundation
import FeedKit

struct RSSnews {
    let title: String?
    let url: String?
    let image: String?
    let description: String?
    let publishDate: String
}

class RSSFeed {
   
    func getRSS(complation: @escaping ([RSSnews]?, Error?) -> Void) {
        let feedURL = URL.init(string: "https://zona.media/rss")!
        
        let parser = FeedParser(URL: feedURL)
        
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { (result) in
            if result.isSuccess {
                guard let rssFeed = result.rssFeed else { return }
                guard let items = rssFeed.items else { return }
                var rssNewsList = [RSSnews]()
                
                for item in items {
                    guard let date = item.pubDate else { return }
                    let formatter = DateFormatter()
                    formatter.dateFormat = "MM-dd-yyyy HH:mm"
                    let correctDate = formatter.string(from: date)
                    let news = RSSnews(title: item.title, url: item.link, image: item.enclosure?.attributes?.url, description: item.description, publishDate: correctDate)
                    rssNewsList.append(news)
                }
                complation(rssNewsList, nil)
        }
            if result.isFailure {
                complation(nil, result.error)
            }
    }
    }
}
