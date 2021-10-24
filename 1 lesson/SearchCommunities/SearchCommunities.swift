//
//  SearchCommunities.swift
//  SearchCommunities
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit

class SearchCommunitiesController: UITableViewController, UISearchBarDelegate {
   
    let searchCommunities = SearchCommunitiesAPI()
    
    var nameSearchCom = ["Кинематограф", "Политика", "Дизайн", "Эстетика" ]
    var image = ["6","7","8","9"]
    var filterCom = [String]()
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterCom = nameSearchCom
        
        searchCommunities.getSearchGroups { searchGroups in
            
            print("Получили результаты поиска по группам")
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = searchBar
        searchBar.barTintColor = .black
        return headerView
        }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterCom.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCom", for: indexPath) as! SearchCommunitiesCell
        let name = filterCom[indexPath.row]
        let name2 = image[indexPath.row]
        cell.imageSearchComm?.image = UIImage(named: name2)
        cell.nameCommunities?.text = name
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
    
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterCom = searchText.isEmpty ? nameSearchCom : nameSearchCom.filter({(dataString: String) -> Bool in
            return dataString.range(of: searchText, options: .caseInsensitive) != nil})
        tableView.reloadData()
    }
      
    }

