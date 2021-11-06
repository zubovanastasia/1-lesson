//
//  SearchCommunities.swift
//  SearchCommunities
//
//  Created by Anastasiia Zubova on 12.09.2021.
//

import UIKit
import RealmSwift

class SearchCommunitiesController: UITableViewController, UISearchBarDelegate {
   
    private let searchGroupsAPI = SearchCommunitiesAPI()
    private var searchGroupsDB = SearchGroupsDB()
    private var searchGroups: Results<SearchGroupModel>?
    private var token: NotificationToken?
    
 //   @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchGroupsAPI.getSearchGroups { [weak self] searchGroups in
            guard let self = self else { return }
            self.searchGroupsDB.save(searchGroups)
            self.searchGroups = self.searchGroupsDB.load()
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let searchGroups = searchGroups else { return 0 }
        return searchGroups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCom", for: indexPath) as! SearchCommunitiesCell
        let searchGroup = searchGroups?[indexPath.row]
        cell.textLabel?.text = searchGroup?.name
        cell.textLabel?.textColor = .white
        if let url = URL(string: searchGroup?.photo50 ?? "") {
            cell.imageView?.loadImageURL(url: url)
        }
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
      
    }

