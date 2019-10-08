//
//  PresentRouter.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 01/10/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// Present Module Router (aka: Wireframe)
class PresentRouter: PresentRouterProtocol {
       
    func buildModule(rssNews: FullNews) -> UIViewController {

        let mainStoryboard = UIStoryboard(name: "Present", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "Present")
        
        if let viewController = viewController as? PresentView {
            let presenter = PresentPresenter(view: viewController, news: rssNews)
            viewController.presenter = presenter
        }
        
        return viewController
    }
}
