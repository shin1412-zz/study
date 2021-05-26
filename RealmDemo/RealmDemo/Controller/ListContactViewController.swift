//
//  ViewController.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import UIKit

class ListContactViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAddContact: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initComponent()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    fileprivate func initData() {
        
    }

    fileprivate func initComponent() {
        btnAddContact.makeRouned()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ContactTableViewCell.registerCellByNib(tableView)
    }

    @IBAction func addContact(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewContactViewController") as? NewContactViewController else {return}
        vc.isState = .create
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension ListContactViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ManagerRealm.sharedInstance.getDataFromDB().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = ContactTableViewCell.loadCell(tableView) as? ContactTableViewCell else {return UITableViewCell()}
        let item = ManagerRealm.sharedInstance.getDataFromDB()[indexPath.row]
        cell.setUpCell(object: item)
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = ManagerRealm.sharedInstance.getDataFromDB()[indexPath.row]
        // delete
        let delete = UIContextualAction(style: .normal, title: "Delete") { (_, _, nil) in
            ManagerRealm.sharedInstance.deleleData(object: item)
            self.tableView.reloadData()
        }
        delete.backgroundColor = .red
        
        // edit
        let edit = UIContextualAction(style: .normal, title: "Edit") { (_, _, nil) in
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewContactViewController") as? NewContactViewController else {return}
            vc.isState = .update
            vc.item = item
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            self.tableView.reloadData()
        }
        edit.backgroundColor = .lightGray
        
        let configuration = UISwipeActionsConfiguration(actions: [delete, edit])
        
        return configuration
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = ManagerRealm.sharedInstance.getDataFromDB()[indexPath.row]
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewContactViewController") as? NewContactViewController else {return}
        vc.isState = .view
        vc.item = item
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
