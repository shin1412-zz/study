//
//  ObserverViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

class ObserverViewController: UIViewController {

    @IBOutlet weak var lightView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func turnRed(_ sender: Any) {
        VehicleSubject.subjectInstance.addObserver(observer: VehicleObserver.observerInstaance)
        VehicleSubject.subjectInstance.trafficLightColor = TrafficColor.red.rawValue
    }
    
    @IBAction func turnGreen(_ sender: Any) {
        VehicleSubject.subjectInstance.addObserver(observer: VehicleObserver.observerInstaance)
        VehicleSubject.subjectInstance.trafficLightColor = TrafficColor.green.rawValue
    }
    
    @IBAction func turnYellow(_ sender: Any) {
        VehicleSubject.subjectInstance.addObserver(observer: VehicleObserver.observerInstaance)
        VehicleSubject.subjectInstance.trafficLightColor = TrafficColor.yellow.rawValue
    }
    
}
