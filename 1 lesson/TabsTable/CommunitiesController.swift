//
//  Communities.swift
//  Communities
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit
import  RealmSwift

class CommunitiesController: UITableViewController {
    
    private let groupsAPI = GroupsAPI()
    private var groupsDB = GroupsDB()
    private var groups: Results<GroupModel>?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsAPI.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groupsDB.save(groups)
            self.groups = self.groupsDB.load()
            self.tableView.reloadData()
            self.token = self.groups?.observe { [weak self] changes in
                guard let self = self else { return }
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.endUpdates()
                case .error(let error):
                    fatalError("\(error)")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let groups = groups else { return 0 }
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "community", for: indexPath) as! CommunitiesCell
        let groups = groups?[indexPath.row]
        cell.textLabel?.text = groups?.name
        cell.textLabel?.textColor = .white
        if let url = URL(string: groups?.photo50 ?? "") {
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

