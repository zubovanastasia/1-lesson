//
//  Friends.swift
//  Friends
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit
import RealmSwift
import FirebaseDatabase
import FirebaseAuth

class FriendsController: UITableViewController {

    private let friendsAPI = FriendsAPI()
    private let friendsDB = FriendsDB()
    private var friends: Results<FriendsModel>?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else { return }
            self.friendsDB.save(friends ?? [])
            self.friends = self.friendsDB.load()
            self.tableView.reloadData()
            self.token = self.friends?.observe { [weak self] changes in
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

/*    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .darkGray
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.lightGray.cgColor]
        gradient.locations = [0 as NSNumber, 1 as NSNumber]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 0)
        headerView.layer.addSublayer(gradient)
        gradient.frame = headerView.bounds
            
        return headerView
        }
        
      override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
        }  */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
  //      return sections.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard  let friends = friends else { return 0 }
        return friends.count
  
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as! FriendsCell
        let friend = friends![indexPath.row]
        cell.textLabel?.text = friend.fullName
        cell.textLabel?.textColor = .white
        if let url = URL(string: friend.photo100 ?? "") {
            cell.imageView?.loadImageURL(url: url)
        }
        return cell
        /*guard let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as? FriendsCell else { return UITableViewCell() }
            let friend = friends?[indexPath.row]
            cell.textLabel?.text = friend?.fullName
            return cell*/
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friends![indexPath.row]
        let storyboard = UIStoryboard(name: "PhotoCollection", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PhotoCollectionController") as! PhotoCollectionController
        let friendID = String(friend.id)
        vc.loadPhoto(friendID: friendID)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 /*   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let friend = friends?[indexPath.row]
            friend.ref?.removeValue()
        }*/
    }


/*final class NavigationPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let destination = transitionContext.viewController(forKey: .to) else {
            return
        }
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {UIView.addKeyframe(withRelativeStartTime: 0,
                                                                relativeDuration: 0.75,
                                                                animations: {
                                    let translation = CGAffineTransform(translationX: -200, y: 0)
                                    let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                    source.view.transform = translation.concatenating(scale)
                                })
            UIView.addKeyframe(withRelativeStartTime: 0.2,
                               relativeDuration: 0.4,
                               animations: {
                let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                destination.view.transform = translation.concatenating(scale)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6,
                               relativeDuration: 0.4,
                               animations: {
                destination.view.transform = .identity
            })
        }) { finished  in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
    
    
    
}
final class NavigationPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let destination = transitionContext.viewController(forKey: .to) else {
            return
        }
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        destination.view.frame = source.view.frame
        let translation = CGAffineTransform(translationX: -200, y: 0)
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        destination.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0,
                               relativeDuration: 0.4,
                               animations: {
                let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                source.view.transform = translation.concatenating(scale)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4,
                               relativeDuration: 0.4, animations: {
                source.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 0.75,
                               animations: {
                destination.view.transform = .identity
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
        
    }
    
    
}
class FriendsNavigationController: UINavigationController, UINavigationControllerDelegate {
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
}*/
