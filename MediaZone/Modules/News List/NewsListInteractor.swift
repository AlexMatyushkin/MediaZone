//
//  NewsListInteractor.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit
import FeedKit
/// NewsList Module Interactor
class NewsListInteractor: NewsListInteractorProtocol {
    var rssFeed: RSSFeed = RSSFeed()
    
    func getNewsList(complation: @escaping ([RSSnewsList]) -> Void) {
        rssFeed.getRSS(complation: { newsList in
            complation(newsList)
        })
    }

}
