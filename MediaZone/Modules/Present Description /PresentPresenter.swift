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
    
    var fullDescription: String?
    
    init(view: PresentViewProtocol, fullDescription: String?) {
        self.view = view
        self.fullDescription = fullDescription
        self.interactor = PresentInteractor()
        self.router = PresentRouter()
    }
}

// MARK: - extending PresentPresenter to implement it's protocol
extension PresentPresenter: PresentPresenterProtocol {
    
}
