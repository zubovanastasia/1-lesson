//
//  NewsController.swift
//  NewsController
//
//  Created by Anastasiia Zubova on 24.09.2021.
//

import UIKit

class NewsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let newsAPI = NewsAPI()
    var news: [NewsItem] = []
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsAPI.getNewsUser { [weak self] news in
            guard let self = self else { return }
            self.news = news ?? []
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! NewsCell
        let news = news[indexPath.row]
        cell.lebelDate?.text = String(news.date)
        cell.lebelDate.textColor = .white
        cell.textText.text = news.text
        cell.textText.textColor = .white
        cell.lebelName.text = String(news.postID)
        cell.lebelName.textColor = .white
        return cell
    }


    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
