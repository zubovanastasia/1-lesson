//
//  SearchCommunities.swift
//  SearchCommunities
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit

class SearchCommunitiesController: UITableViewController, UISearchBarDelegate {
   
    let searchCommunities = SearchCommunitiesAPI()
    var searchGroup: [SearchGroupDB] = []
    
 //   @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchCommunities.getSearchGroups { [weak self] searchGroup in
            guard let self = self else { return }
            self.searchGroup = searchGroup
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchGroup.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCom", for: indexPath) as! SearchCommunitiesCell
        let searchGroup = searchGroup[indexPath.row]
        cell.textLabel?.text = searchGroup.name
        cell.textLabel?.textColor = .white
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
      
    }

