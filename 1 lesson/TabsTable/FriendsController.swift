//
//  Friends.swift
//  Friends
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit

class FriendsController: UITableViewController {

    var names = ["Антонов Петр","Бочкин Алексей","Воронин Дмитрий","Галочкина Мария","Новикова Ксения"]
    var image = ["168724", "168723", "168726", "168727", "168730" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as! FriendsCell
        let name = names[indexPath.row]
        cell.nameLabel.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FriendsCell
        let name = image[indexPath.row]
        cell.imageAva.image = UIImage(named: name)
        
}
}
