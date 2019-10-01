//
//  PresentView.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 01/10/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// Present Module View
class PresentView: UIViewController {
    
    var presenter: PresentPresenterProtocol! 
    
    @IBOutlet weak var presentTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentTextView.text = presenter.fullDescription
        self.titleLabel.text = self.presenter.title
    }
    
}

// MARK: - extending PresentView to implement it's protocol
extension PresentView: PresentViewProtocol {
    
}
