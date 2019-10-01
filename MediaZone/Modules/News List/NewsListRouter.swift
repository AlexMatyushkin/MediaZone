//
//  NewsListRouter.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// NewsList Module Router (aka: Wireframe)
class NewsListRouter: NewsListRouterProtocol {
    func createPresentModule(description: String?, onlineText: [String]?, rssNews: RSSnewsList) -> UIViewController {
       let presentModule = PresentRouter().buildModule(description: description, onlineText: onlineText, rssNews: rssNews)
       return presentModule
    }
}
