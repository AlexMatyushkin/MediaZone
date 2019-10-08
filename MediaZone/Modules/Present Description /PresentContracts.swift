//
//  PresentContracts.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 01/10/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// Present Module View Protocol
protocol PresentViewProtocol: class {

}

//MARK: Interactor -
/// Present Module Interactor Protocol
protocol PresentInteractorProtocol {

}

//MARK: Presenter -
/// Present Module Presenter Protocol
protocol PresentPresenterProtocol {
    var news: FullNews { get set }
    var cellType: [PresentCellType] { get set }
    var onlineText: [String] { get set }
}

//MARK: Router (aka: Wireframe) -
/// Present Module Router Protocol
protocol PresentRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: PresentEntity, parentViewController viewController: UIViewController)
}
