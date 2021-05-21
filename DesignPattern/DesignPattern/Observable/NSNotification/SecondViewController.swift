//
//  SecondViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

// tạo secret key để kết nối, ccó thể tạo nhiều key
let myNotificaionKey = "notificationKey"
class SecondViewController: UIViewController {

    @IBOutlet weak var lbNoti: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(doThisWhenNotify), name: NSNotification.Name(rawValue: myNotificaionKey), object: nil)
    }
    
    @objc func doThisWhenNotify() {
        print("I've sent a spark🤪!")
    }
    @IBAction func sentNoti(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: myNotificaionKey), object: nil)
        lbNoti.text = "Notification Completed 😍"
    }
}
