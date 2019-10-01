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
    private var router: NewsListRouterProtocol
    
    var source = [RSSnewsList]()
    
    init(view: NewsListViewProtocol) {
        self._view = view
        self.interactor = NewsListInteractor()
        self.router = NewsListRouter()
    }
}

// MARK: - extending NewsListPresenter to implement it's protocol
extension NewsListPresenter: NewsListPresenterProtocol {
    func loadNews() {
       
        self.interactor.getNewsList()
        
        self.interactor.newListRecived = {[weak self] newsList in
            self?.source = newsList
            self?._view?.stopRefreshing()
            self?._view?.reloadTableView()
        }
        
        self.interactor.errorRecived = { [weak self] error in
            let errorAlert = UIAlertController(title: "Внимание - ошибка", message: error?.localizedDescription, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            errorAlert.addAction(okAction)
            self?._view?.presentAlert(alert: errorAlert)
            self?._view?.stopRefreshing()
        }
    }
    
    func makeNewsFullDescription(url: URL, index: Int) {
        self.interactor.getFullNewsDescription(url: url)
        
        self.interactor.fullNewsDescriptionRecived = {[weak self] fullDescription, onlineText in
            if let news = self?.source[index] {
                guard let controller = self?.router.createPresentModule(description: fullDescription, onlineText: onlineText, rssNews: news) else { return }
                self?._view?.presentModule(viewController: controller)
            }
        }
    }
}
