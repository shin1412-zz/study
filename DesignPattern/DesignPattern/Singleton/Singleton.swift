//
//  Singleton.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

class Singleton: UIView {
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    static let instance = Singleton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("Singleton", owner: self, options: nil)

        initComponent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func initComponent() {
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showAlert() {
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func onclickNo(_ sender: Any) {
        parentView.removeFromSuperview()
    }
    
    @IBAction func onclickYes(_ sender: Any) {
        parentView.removeFromSuperview()
    }
}
