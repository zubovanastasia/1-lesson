//
//  SearchCommunities.swift
//  SearchCommunities
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit

class SearchCommunitiesController: UITableViewController {
    var nameSearchCom = ["Кинематограф", "Политика", "Дизайн", "Эстетика" ]
    var image = ["6","7","8","9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameSearchCom.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCom", for: indexPath) as! SearchCommunitiesCell
        let name = nameSearchCom[indexPath.row]
        cell.nameCommunities.text = name
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! SearchCommunitiesCell
        let name = image[indexPath.row]
        cell.imageSearchComm.image = UIImage(named: name)
        }
      
    }

