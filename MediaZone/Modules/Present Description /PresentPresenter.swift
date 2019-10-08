//
//  PresentPresenter.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 01/10/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// Present Module Presenter
class PresentPresenter {
    
    weak var view: PresentViewProtocol?
    private var interactor: PresentInteractorProtocol
    private var router: PresentRouterProtocol
    
    var news: FullNews
    var cellType = [PresentCellType]()
    var onlineText = [String]()
    
    init(view: PresentViewProtocol, news: FullNews) {
        self.view = view
        self.news = news
        self.interactor = PresentInteractor()
        self.router = PresentRouter()
        
        self.cellType.append(.title)
        
        if let image = news.image {
                  self.cellType.append(.image)
        }
        
        self.cellType.append(.fullDescription)
        
        if let onlineSubject = news.onlineSubject {
            if !onlineSubject.isEmpty{
              self.cellType.removeLast()
              self.cellType.append(.online)
                guard let onlineTextArray = news.onlineSubject else { return }
                self.onlineText = onlineTextArray.reversed()
            }
        }
    
    }
}

// MARK: - extending PresentPresenter to implement it's protocol
extension PresentPresenter: PresentPresenterProtocol {
    
}
