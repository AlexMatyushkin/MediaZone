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
}

//MARK: Interactor -
/// NewsList Module Interactor Protocol
protocol NewsListInteractorProtocol {
    // Fetch Object from Data Layer
   
}

//MARK: Presenter -
/// NewsList Module Presenter Protocol
protocol NewsListPresenterProtocol {
   
}

//MARK: Router (aka: Wireframe) -
/// NewsList Module Router Protocol
protocol NewsListRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: NewsListEntity, parentViewController viewController: UIViewController)
}
