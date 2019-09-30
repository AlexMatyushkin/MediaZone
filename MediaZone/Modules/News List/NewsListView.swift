//
//  NewsListView.swift
//  MediaZone
//
//  Created Алексей Матюшкин on 30/09/2019.
//  Copyright © 2019 Алексей Матюшкин. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftSoup

/// NewsList Module View
class NewsListView: UIViewController {
    
    private var presenter: NewsListPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    
    let rssFeed = RSSFeed()
    var source = [RSSnewsList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationCells()
        rssFeed.getRSS(complation: { newsList in
            self.source = newsList
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }
    
    private func registrationCells() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "News")
    }
}

extension NewsListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "News") as? NewsTableViewCell else { return UITableViewCell()}
        cell.titleLabel.text = self.source[indexPath.row].title
        cell.descriptionLabel.text = self.source[indexPath.row].description
        cell.loadImage(link: self.source[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: self.source[indexPath.row].url!) else { return }
         // This part of code can parse news and get full description
        do {
           let html = try String(contentsOf: url)
           let doc = try SwiftSoup.parse(html).body()
           let test = try doc?.getElementsByClass("mz-publish__text")
           let text = try test?.text()
            print(text)
        } catch {
            print("Error")
        }
    }
}

// MARK: - extending NewsListView to implement it's protocol
extension NewsListView: NewsListViewProtocol {
    
}

