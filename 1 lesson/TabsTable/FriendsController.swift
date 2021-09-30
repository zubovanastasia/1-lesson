//
//  Friends.swift
//  Friends
//
//  Created by Anastasiia Zubova on 11.09.2021.
//

import UIKit

class FriendsController: UITableViewController {

    var names = ["Веселова Евгения","Ермолин Артем","Ухова Ольга","Краснова Анна", "Антонов Петр","Бочкин Алексей","Воронин Дмитрий","Галочкина Мария","Новикова Ксения"]
    var image = ["168724", "168723", "168726", "168727", "168730" ]
    var sections = ["А","Б","В","Г","Д","Е","Ж","З","И","Й","К","Л","М","Н","О","П","Р","С","Т","У","Ф","Х","Ч","Ш","Щ","Э","Ю","Я"]
    var mutableArray: NSMutableArray = []
    
    private func mutable() {
        for i in sections {
            let mutableArray2:NSMutableArray = []
            for n in names {
                if  i.first!  == n.first! {
                    mutableArray2.add(n)
                }
            }
            mutableArray.add(mutableArray2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Мои Друзья"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.mutable()
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .darkGray
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.lightGray.cgColor]
        gradient.locations = [0 as NSNumber, 1 as NSNumber]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 1, y: 0)
        headerView.layer.addSublayer(gradient)
        gradient.frame = headerView.bounds
        let label = UILabel()
        label.frame = CGRect.init(x: 25, y: 5, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        label.text = sections[section]
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        headerView.addSubview(label)
            
        return headerView
        }
        
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (mutableArray[section] as! NSMutableArray).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend", for: indexPath) as! FriendsCell
        let mutableArray2 = mutableArray[indexPath.section] as! NSMutableArray
        cell.nameLabel?.text = mutableArray2[indexPath.row] as? String
        cell.imageAva.image = UIImage(named: image[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
}
}


