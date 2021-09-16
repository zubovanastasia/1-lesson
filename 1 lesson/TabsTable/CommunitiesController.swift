//
//  Communities.swift
//  Communities
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit

class CommunitiesController: UITableViewController {
    
    var nameCom = ["Искусство", "Программирование", "Музыка", "Технологии", "Наука"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.nameCommunity.text = name
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CommunitiesCell
        cell.imageCommunity.image = UIImage()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            nameCom.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
      
    }
}
