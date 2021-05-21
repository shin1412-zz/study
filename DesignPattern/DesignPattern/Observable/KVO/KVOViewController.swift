//
//  KVOViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

class KVOViewController: UIViewController {

    @IBOutlet weak var lbTime: UILabel!
    @objc var kvoMAnager: KVOManager?
    
//    var dateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
//        return dateFormatter
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.lbTime.text = dateFormatter.string(from: Date())
        self.kvoMAnager = KVOManager.init(withKVO: KVO())
        self.addObserver(self, forKeyPath: #keyPath(kvoMAnager.kvo.updateAt), options: [.old, .new, .initial], context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObserver(self, forKeyPath: #keyPath(kvoMAnager.kvo.updateAt), context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(kvoMAnager.kvo.updateAt) {
            self.lbTime.text = String.init(describing: kvoMAnager?.upDateAt ?? "")
        }
    }
    
    @IBAction func updateDate(_ sender: Any) {
//        self.lbTime.text = dateFormatter.string(from: Date())
        self.kvoMAnager?.update()
    }
    
}
