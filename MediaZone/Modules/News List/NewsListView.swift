//
//  NewsListView.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit

/// NewsList Module View
class NewsListView: UIViewController {
    
    private var presenter: NewsListPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    var refreshController: UIRefreshControl = UIRefreshControl()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = NewsListPresenter(view: self)
        registrationCells()
        self.presenter.loadNews()
        self.title = "Последние публикации"
    }
    
    private func registrationCells() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "News")
        self.refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.tableView.addSubview(self.refreshController)
    }
    
    @objc func refresh() {
        self.refreshController.beginRefreshing()
        self.presenter.loadNews()
    }
}

// MARK: - extending NewsListView to implement it's protocol
extension NewsListView: NewsListViewProtocol {
    func stopRefreshing() {
        DispatchQueue.main.async {
            self.refreshController.endRefreshing()
        }
    }
    
    func presentAlert(alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentModule(viewController: UIViewController) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// Table View Extensions
extension NewsListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "News") as? NewsTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = self.presenter.source[indexPath.row].title
        cell.publishDateLabel.text = self.presenter.source[indexPath.row].publishDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: self.presenter.source[indexPath.row].url!) else { return }
        self.presenter.makeNewsFullDescription(url: url, index: indexPath.row)
    }
}
