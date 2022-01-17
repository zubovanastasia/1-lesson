//
//  Communities.swift
//  Communities
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit
import RealmSwift
import PromiseKit

class CommunitiesController: UITableViewController {
    
  //  private let groupsAPI = GroupsAPI()
    private var groupsAPI = GroupsAPIAdapter()
    private var groupsDB = GroupsDB()
  //  private var groups: Results<GroupModel>?
    private var groups: [GroupModelAdapter] = []
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsAPI.getGroupsAdapter(inId: id) { [weak self] groups in
                self?.groups = groups
                self?.tableView.reloadData()
            }
        }

       /* firstly {
            groupsAPI.getGroups()
        }.done { groups in
         self.groupsAPI.getGroups()
    //    }
    //    .ensure {
        }.done { groups in
            print(groups)
        }.catch { error in
            print(error)
        }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    guard  let groups = groups else { return 0 }
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "community", for: indexPath) as! CommunitiesCell
        let groups = groups[indexPath.row]
        cell.textLabel?.text = groups.name
        cell.textLabel?.textColor = .white
        if let url = URL(string: groups.photo50 ?? "") {
            cell.imageView?.loadImageURL(url: url)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    
}
    
class CommunitiesNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return NavigationPushAnimator()
        } else if operation == .pop {
            return NavigationPopAnimator()
        }
        return nil
    }*/
}


