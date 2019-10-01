//
//  NewsListContracts.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// NewsList Module View Protocol
protocol NewsListViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type NewsListEntity
    func stopRefreshing()
    func presentAlert(alert: UIAlertController) 
    func reloadTableView()
    func presentModule(viewController: UIViewController) 
}

//MARK: Interactor -
/// NewsList Module Interactor Protocol
protocol NewsListInteractorProtocol {
    var rssFeed: RSSFeed { get }
    var newListRecived: (([RSSnewsList]) -> Void)? { get set }
    var errorRecived: ((Error?) -> Void)? { get set }
    var fullNewsDescriptionRecived: ((String?, [String]?) -> Void)? { get set }
    
    func getNewsList()
    func getFullNewsDescription(url: URL)
}

//MARK: Presenter -
/// NewsList Module Presenter Protocol
protocol NewsListPresenterProtocol {
    var source: [RSSnewsList] { get set }
    
    func makeNewsFullDescription(url: URL, index: Int)
    func loadNews() 
}

//MARK: Router (aka: Wireframe) -
/// NewsList Module Router Protocol
protocol NewsListRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: NewsListEntity, parentViewController viewController: UIViewController)
    func createPresentModule(description: String?, onlineText: [String]?, rssNews: RSSnewsList) -> UIViewController
    
}
