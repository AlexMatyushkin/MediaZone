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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationCells()
    }
    
    private func registrationCells() {
          self.tableView.delegate = self
          self.tableView.dataSource = self
          self.tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "Text")
          self.tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "Image")
         // self.refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
         // self.tableView.addSubview(self.refreshController)
          self.tableView.backgroundColor = #colorLiteral(red: 0.3334586322, green: 0.3390970528, blue: 0.4115427136, alpha: 1)
      }
}

// MARK: - extending PresentView to implement it's protocol
extension PresentView: PresentViewProtocol {
    
}

extension PresentView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let online = self.presenter.news.onlineSubject {
            if !online.isEmpty {
                return 2
            } else {
                return 1
            }
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.presenter.cellType.count
        default:
            guard let onlineCount = self.presenter.news.onlineSubject?.count else { return 0}
            return onlineCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch self.presenter.cellType[indexPath.row] {
                   case .title:
                       guard let cell = tableView.dequeueReusableCell(withIdentifier: "Text") as? TitleTableViewCell else { return UITableViewCell()}
                       cell.stringLabel.font = UIFont (name: "HelveticaNeue-Light", size: 30)
                       cell.stringLabel.textAlignment = .center
                       cell.stringLabel.text = self.presenter.news.title
                       return cell
                   case .image:
                       guard let cell  = tableView.dequeueReusableCell(withIdentifier: "Image") as? ImageTableViewCell else { return UITableViewCell() }
                       cell.setImage(link: self.presenter.news.image)
                       return cell
                   case .fullDescription:
                       guard let cell = tableView.dequeueReusableCell(withIdentifier: "Text") as? TitleTableViewCell else { return UITableViewCell()}
                       cell.stringLabel.text = self.presenter.news.fullDescription
                       cell.stringLabel.textAlignment = .justified
                       return cell
                   case .online:
                       return UITableViewCell()
                   }
        } else {
             guard let cell = tableView.dequeueReusableCell(withIdentifier: "Text") as? TitleTableViewCell else { return UITableViewCell()}
             cell.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
             cell.layer.borderWidth = 1
             cell.stringLabel.text = self.presenter.news.onlineSubject?[indexPath.row]
             cell.stringLabel.textAlignment = .left
             cell.stringLabel.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.bold)
             return cell
        }
        
        
        return UITableViewCell()
    }
    
}
