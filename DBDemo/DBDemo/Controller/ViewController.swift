//
//  ViewController.swift
//  DBDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let cellReuIfentifier = "cell"
    let database: Database = Database()
    
    var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initComponent()
    }

    fileprivate func initComponent() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuIfentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        database.insert(id: 0, name: "Naruto", age: 14)
        database.insert(id: 0, name: "Hinata", age: 13)
        database.insert(id: 0, name: "Sasuke", age: 14)
        database.insert(id: 0, name: "Sakura", age: 13)
        
        persons = database.read()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuIfentifier)!
        cell.textLabel?.text = "\(persons[indexPath.row].id ?? 0). Name:  \(persons[indexPath.row].name ?? "") - Age: \(persons[indexPath.row].age ?? 0)"
        return cell
    }
}

