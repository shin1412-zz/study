//
//  FirstViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var lbNoti: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(doStAfterNotified), name: Notification.Name(rawValue: myNotificaionKey), object: nil)
    }
    
    @objc func doStAfterNotified() {
        lbNoti.text = "Damn, I feel your spark 🥳"
    }

    @IBAction func nextTOView(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
