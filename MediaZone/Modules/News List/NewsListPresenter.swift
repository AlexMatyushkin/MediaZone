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
    
    var source = [RSSnews]()
    
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
        
        self.interactor.listOfNewsRecived = {[weak self] newsList in
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
    
    func makeNewsFullDescription(index: Int) {
        self._view?.startShowHud()
        
        guard let newsLink = self.source[index].url else {
            self._view?.dissmissHud()
            return
        }
        
        guard let newsURL = URL(string: newsLink) else {
            self._view?.dissmissHud()
            return
        }
        
        self.interactor.getFullNewsDescription(url: newsURL, news: self.source[index])
        
        self.interactor.fullNewsDescriptionRecived = { [weak self] news in
            guard let presentViewController = self?.router.createPresentModule(rssNews: news) else {
                self?._view?.dissmissHud()
                return
            }
            self?._view?.dissmissHud()
            self?._view?.presentModule(viewController: presentViewController)
        }
        
    }

}
