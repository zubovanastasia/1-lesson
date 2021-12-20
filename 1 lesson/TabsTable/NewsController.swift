//
//  NewsController.swift
//  NewsController
//
//  Created by Anastasiia Zubova on 24.09.2021.
//

import UIKit

class NewsController: UIViewController {
    
    let newsAPI = NewsAPI()
    var news: [NewsModel]? = []
    
    @IBOutlet weak var table: UITableView!
    
    private enum NewsFeedContents {
        case text
        case photo
        case name
        case likes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* self.table.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "cell1")
        self.table.register(UINib(nibName: "NewsCell2", bundle: nil), forCellReuseIdentifier: "cell2")
        self.table.register(UINib(nibName: "NewsCell3", bundle: nil), forCellReuseIdentifier: "cell3")
        self.table.register(UINib(nibName: "NewsCell4", bundle: nil), forCellReuseIdentifier: "cell4")
        self.table.register(UINib(nibName: "NewsCell5", bundle: nil), forCellReuseIdentifier: "cell5")
        */
        self.getData()
        self.table.reloadData()
    }
    
    func getData() {
    self.newsAPI.getNewsUser(complition: { [weak self] news in
    guard let self = self else { return }
        self.news = news
  //      if news!.count > 0 {
  //  }
    self.table.reloadData()
    })
}

    override func didReceiveMemoryWarning() {
             super.didReceiveMemoryWarning()
    }
}

extension NewsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
}
}
    
extension NewsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: return self.table.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! NewsCell
        case 1: return self.table.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! NewsCell2
        case 2: return self.table.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! NewsCell3
        case 3: return self.table.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! NewsCell4
        default:
            debugPrint("No cell")
            
            return self.table.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        }
    }
}


