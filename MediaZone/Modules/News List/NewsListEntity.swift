//
//  NewsListEntity.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// NewsList Module Entity
struct FullNews{
    var isOnline: Bool
    var title: String
    var fullDescription: String
    var onlineSubject: [String]?
    var date: String
    var image: String?
}
