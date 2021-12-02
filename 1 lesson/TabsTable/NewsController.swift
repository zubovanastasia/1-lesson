//
//  NewsController.swift
//  NewsController
//
//  Created by Anastasiia Zubova on 24.09.2021.
//

import UIKit

class NewsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let newsAPI = NewsAPI()
    var news: [NewsModel] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsAPI.getNewsUser { [weak self] news in
            guard let self = self else { return }
            self.news = news
            self.table.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
             super.didReceiveMemoryWarning()
         }

 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! NewsCell
        let news = news[indexPath.row]
        cell1.lebelDate.text = String(news.date)
        return cell1
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! NewsCell2
        cell2.textPost.text = news.text
        return cell2
    }


    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
