//
//  Communities.swift
//  Communities
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit

class CommunitiesController: UITableViewController {
    
    let communitiesService = CommunitiesAPI()
    var groups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       self.navigationItem.title = "Мои Сообщества"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        communitiesService.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "community", for: indexPath) as! CommunitiesCell
        let groups = groups[indexPath.row]
        cell.textLabel?.text = groups.name
        cell.textLabel?.textColor = .white
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
  //  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 //       if editingStyle == .delete {
 //           groups.remove(at: indexPath.row)
 //           tableView.deleteRows(at: [indexPath], with: .automatic)
  //      }
      
  //  }
//}
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
    }
}
}
