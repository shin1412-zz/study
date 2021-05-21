//
//  Observable.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import Foundation

enum TrafficColor: String {
    case red = "red"
    case green = "green"
    case yellow = "yellow"
}

class VehicleObserver {
    static let observerInstaance = VehicleObserver()
    func onTrafficLightColorChange(color: String) {
        switch color {
        case TrafficColor.red.rawValue:
            debugPrint("stop your vehicle")
        case TrafficColor.green.rawValue:
            debugPrint("start your vehicle")
        default:
            debugPrint("slow down the speed of your vehicle")
        }
    }
}

class VehicleSubject {
    static let subjectInstance = VehicleSubject()
    private var color = String()
    var trafficLightColor: String {
        get {
            return color
        }
        set {
            color = newValue
        }
    }
    private var trafficVehicleObserver = [VehicleObserver]()
    func addObserver(observer: VehicleObserver) {
        trafficVehicleObserver.append(observer)
    }

    func notiObserver() {
        trafficVehicleObserver.forEach({$0.onTrafficLightColorChange(color: color)})
    }

    deinit {
        trafficVehicleObserver.removeAll()
    }
}
