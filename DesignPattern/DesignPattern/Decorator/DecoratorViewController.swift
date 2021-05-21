//
//  ViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

class DecoratorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        view.backgroundColor = .white
        
        let rectangle = Rectangle(frame: CGRect(x: 200, y: 100, width: 200, height: 200))
        let addBorderDecoratorRactangle = AddBorderDecorator(shape: rectangle)
        let addShadowDecoratorRectangle = AddShadowDecorator(shape: addBorderDecoratorRactangle, radius: 10)
        
        let circle = Circle(arcCenter: CGPoint(x: 200, y: 300), radius: 100)
        let addShadowDecoratorCircle = AddShadowDecorator(shape: circle, radius: 10)
        
        view.layer.addSublayer(addShadowDecoratorRectangle.draw())
        view.layer.addSublayer(addShadowDecoratorCircle.draw())
        
        self.view = view
        
    }
}
