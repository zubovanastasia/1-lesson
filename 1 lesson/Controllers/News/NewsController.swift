//
//  NewsController.swift
//  NewsController
//
//  Created by Anastasiia Zubova on 24.09.2021.
//

import UIKit

class NewsController: UITableViewController {
    
    let newsAPI = NewsAPI()
    var newsItem: [NewsItem] = []
    var newsProfiles: [Profile] = []
    var newsGroups: [Group] = []
    var newsPhotosSize: [NewsSize] = []
    
    var nextFrom = ""
    var isLoading = false
    var expandedIndexSet: IndexSet = []
    
    fileprivate func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "Загрузка...")
        refreshControl?.tintColor = .white
        refreshControl?.addTarget(self, action: #selector(refreshNews), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.prefetchDataSource = self
        
        setupRefreshControl()
        
        newsAPI.getNewsUser { [weak self] news in
            
            guard let self = self else { return }
            
            self.newsItem = news!.response.items
            self.newsProfiles = news!.response.profiles
            self.newsGroups = news!.response.groups
            self.nextFrom = news?.response.nextFrom ?? ""
            
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return newsItem.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentNewsItem = newsItem[section]
        var count = 1
        
        if currentNewsItem.hasText { count += 1 }
        if currentNewsItem.hasPhoto { count += 1 }
        if currentNewsItem.hasLink { count += 1 }
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentNewsItem = newsItem[indexPath.section]

        switch indexPath.row {
        case 0: return newsInfoCell(indexPath: indexPath)
        case 1: return currentNewsItem.hasText ? newsTextCell(indexPath: indexPath) : newsPhotoCell(indexPath: indexPath)
       // case 2: currentNewsItem.hasLink
        default:
            debugPrint("No cell")
            return UITableViewCell()
        }
    }
    
   /* override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            let tableWidth = tableView.bounds.width
            let news = self.newsPhotosSize[indexPath.section]
            let cellHeight = tableWidth * news.aspectRatio
            return cellHeight
        default:
            return UITableView.automaticDimension
        }
    }*/
    
    @objc func refreshNews(sender: AnyObject) {
        self.refreshControl?.beginRefreshing()
        
        let freshNewsDate = self.newsItem.first?.date ?? Date().timeIntervalSince1970.exponent
        
        newsAPI.getNewsUser(startTime: Double(freshNewsDate) + 1) { [weak self] news in
            guard let self = self else { return }
            self.refreshControl?.endRefreshing()
        
            guard let items = news?.response.items else { return }
            guard let profiles = news?.response.profiles else { return }
            guard let groups = news?.response.groups else { return }
            guard items.count > 0 else { return }
            
            self.newsItem = items + self.newsItem
            self.newsProfiles = profiles + self.newsProfiles
            self.newsGroups = groups + self.newsGroups
            
            let indexSet = IndexSet(integersIn: 0..<items.count)
            self.tableView.insertSections(indexSet, with: .fade)
        }
    }
    func newsInfoCell(indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! NewsCell
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        let currentNewsItem = newsItem[indexPath.section]
        switch newsItem[indexPath.section].sourceID.signum() {
        case 1:
            let currentNewsItemProfile = newsProfiles.filter{ $0.id == currentNewsItem.sourceID }[0]
            cell.configure(profile: currentNewsItemProfile, postDate: currentNewsItem.date)
        case -1:
            let currentNewsItemGroup = newsGroups.filter{ $0.id == abs(currentNewsItem.sourceID) }[0]
            cell.configure(group: currentNewsItemGroup, postDate: currentNewsItem.date)
            
        default: break
        }
        
        return cell
    }
    
    func newsTextCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "сell2", for: indexPath) as! NewsCell2
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        let currentNewsItem = newsItem[indexPath.section]
        if currentNewsItem.hasText {
        cell.configure(newsText: currentNewsItem.text )
        return cell
         } else { return UITableViewCell() }
    }
    
    func newsPhotoCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! NewsCell3
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        let currentNewsItem = newsItem[indexPath.section]
        if currentNewsItem.hasPhoto {
            let url = String(currentNewsItem.attachments[0].photo!.photoAvailable!.url)
            cell.configure(url: url)
            return cell
        } else {
            return UITableViewCell()
            
        }
    }
    
  /*  func newsLinkCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! NewsCell4
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        let currentNewsItem = newsItem[indexPath.section]
       // if currentNewsItem.hasLink {
        //    cell.configure(link: currentNewsItem.attachments![0].link!)
        cell.likeValueLebel = currentNewsItem.likes
        }
            return cell
            
     //   } else { return UITableViewCell() }
    } */
}
extension NewsController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        guard let maxSection = indexPaths.map({ $0.section }).max() else { return }
        
        if maxSection > newsItem.count - 3, !isLoading {
            
            isLoading = true
            
            newsAPI.getNewsUser(startFrom: nextFrom) { [weak self] news in
                
                guard let self = self else { return }
                
                guard let newItems = news?.response.items else { return }
                guard let newProfiles = news?.response.profiles else { return }
                guard let newGroups = news?.response.groups else { return }
                
                let indexSet = IndexSet(integersIn: self.newsItem.count..<self.newsItem.count + newItems.count)
                
                self.newsItem.append(contentsOf: newItems)
                self.newsProfiles.append(contentsOf: newProfiles)
                self.newsGroups.append(contentsOf: newGroups)
                
                self.nextFrom = news?.response.nextFrom ?? ""
                
                self.tableView.insertSections(indexSet, with: .automatic)
                
                self.isLoading = false
            }
        }
    }
}
