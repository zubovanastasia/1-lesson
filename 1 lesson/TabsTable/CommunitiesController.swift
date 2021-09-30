//
//  Communities.swift
//  Communities
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit

class CommunitiesController: UITableViewController {
    
    var nameCom = ["Искусство", "Программирование", "Музыка", "Технологии", "Наука"]
    var image = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Мои Сообщества"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameCom.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "community", for: indexPath) as! CommunitiesCell
        let name = nameCom[indexPath.row]
        let name2 = image[indexPath.row]
        cell.imageCommunity.image = UIImage(named: name2)
        cell.nameCommunity.text = name
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            nameCom.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
      
    }
}
