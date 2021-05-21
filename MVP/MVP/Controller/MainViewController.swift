//
//  MainViewController.swift
//  MVP
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ViewPresenter?
    var requestModel: PhotoParam = PhotoParam(method: nil, api_key: nil, user_id: nil, extras: nil, per_page: nil, page: nil, format: nil, nojsoncallback: nil)
    var model: Flick?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initcomponent()
        
    }

    fileprivate func initData() {
        self.presenter?.requestData(requestModel: requestModel)
    }

    fileprivate func initcomponent() {
        tableView.delegate = self
        tableView.dataSource = self
        PhotoTableViewCell.registerCellByNib(tableView)
    }

    func setUp(presenter: ViewPresenter) {
        self.presenter = presenter
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.photos?.photo.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = PhotoTableViewCell.loadCell(tableView) as? PhotoTableViewCell else {return UITableViewCell()}
        cell.setUpCell(data: self.model?.photos?.photo[indexPath.row] ?? PhotoAttribute())
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension MainViewController: ViewPresenterDelegate {
    func fetchData(data: Flick) {
        DispatchQueue.main.async {
            self.model = data
            self.tableView.reloadData()
        }
    }
}

