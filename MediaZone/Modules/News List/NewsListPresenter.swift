//
//  NewsListPresenter.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// NewsList Module Presenter
class NewsListPresenter {
    
    weak private var _view: NewsListViewProtocol?
    private var interactor: NewsListInteractorProtocol
    private var wireframe: NewsListRouterProtocol
    
    init(view: NewsListViewProtocol) {
        self._view = view
        self.interactor = NewsListInteractor()
        self.wireframe = NewsListRouter()
    }
}

// MARK: - extending NewsListPresenter to implement it's protocol
extension NewsListPresenter: NewsListPresenterProtocol {
    
}
