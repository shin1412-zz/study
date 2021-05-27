//
//  ViewController.swift
//  KeychainDemo
//
//  Created by Huong Nguyen on 27/05/2021.
//

import UIKit
import KeychainAccess

class AccountsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var itemsGroupedByServer: [String:[[String: Any]]]?

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initComponent()
    }

    fileprivate func initData() {
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
        tableView.reloadData()
    }
    
    fileprivate func initComponent() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension AccountsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let item = itemsGroupedByServer {
            let servieces = Array(item.keys)
            return servieces.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let services = Array(itemsGroupedByServer!.keys)
        let service = services[section]
        
        let items = Keychain(service: service).allItems()
        return items.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 25, width: headerView.frame.width - 10, height: headerView.frame.height - 10)
        
        let services = Array(itemsGroupedByServer!.keys)
        label.text = services[section]
        
        headerView.addSubview(label)
        
        return headerView
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "reuseIdentifier")
        }
        
        let services = Array(itemsGroupedByServer!.keys)
        let service = services[indexPath.section]
        
        let items = Keychain(service: service).allItems()
        let item = items[indexPath.row]
        
        cell?.textLabel?.text = item["key"] as? String
        cell?.detailTextLabel?.text = item["value"] as? String
        
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let services = Array(itemsGroupedByServer!.keys)
        let service = services[indexPath.section]
        
        let keychain = Keychain(service: service)
        let items = keychain.allItems()
        
        let item = items[indexPath.row]
        let key = item["key"] as! String
        
        keychain[key] = nil
        
        if items.count == 1 {
            reloadData()
            tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
        } else {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

    func reloadData() {
        let items = Keychain.allItems(.genericPassword)
        itemsGroupedByServer = groupBy(items) { item -> String in
            if let service = item["service"] as? String {
                return service
            } else {
                return ""
            }
        }
    }
}

private func groupBy<C: Collection, K: Hashable>(_ xs: C, key: (C.Iterator.Element) -> K) -> [K:[C.Iterator.Element]] {
    var gs: [K:[C.Iterator.Element]] = [:]
    for x in xs {
        let k = key(x)
        var ys = gs[k] ?? []
        ys.append(x)
        gs.updateValue(ys, forKey: k)
    }
    return gs
}
