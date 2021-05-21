//
//  Decorator.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import Foundation
import UIKit

// component
protocol Shape {
    func draw() -> CAShapeLayer
}

// concrete component
class Rectangle: Shape {
    var frame: CGRect
    
    init(frame: CGRect) {
        self.frame = frame
    }
    
    func draw() -> CAShapeLayer {
        let drect = CGRect(x: frame.width * 0.25, y: frame.height * 0.25, width: frame.width * 0.5, height: frame.height * 0.25)
        let bpath: UIBezierPath = UIBezierPath(rect: drect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bpath.cgPath
        shapeLayer.fillColor = #colorLiteral(red: 1, green: 0.6878499143, blue: 0.7690741296, alpha: 1).cgColor
        return shapeLayer
    }
}

class Circle: Shape {
    var arcCenter: CGPoint
    var radius: CGFloat
    
    init(arcCenter: CGPoint, radius: CGFloat) {
        self.arcCenter = arcCenter
        self.radius = radius
    }
    
    func draw() -> CAShapeLayer {
        let circlePath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = #colorLiteral(red: 0.1143044308, green: 0.6255466938, blue: 0.934060812, alpha: 1).cgColor
        return shapeLayer
    }
}

// decorator
protocol ShapeDecorator: Shape {
    var shape: Shape {get set}
    
    func draw() -> CAShapeLayer
}

// concrete decorator
class AddBorderDecorator: ShapeDecorator {
    var shape: Shape
    
    init(shape: Shape) {
        self.shape = shape
    }
    
    func draw() -> CAShapeLayer {
        let view = shape.draw()
        view.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        view.lineWidth = 0.5
        return view
    }
}

class AddShadowDecorator: ShapeDecorator {
    var shape: Shape
    var radius: CGFloat
    
    init(shape: Shape, radius: CGFloat) {
        self.shape = shape
        self.radius = radius
    }
    
    func draw() -> CAShapeLayer {
        let view = shape.draw()
        view.shadowRadius = radius
        view.opacity = 5
        view.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        view.shadowOffset = CGSize(width: 0, height: radius / 2)
        view.masksToBounds = false
        return view
    }
}

class AddConnerRadiusDecorator: ShapeDecorator {
    var shape: Shape
    var radius: CGFloat
    
    init(shape: Shape, radius: CGFloat) {
        self.shape = shape
        self.radius = radius
    }
    
    func draw() -> CAShapeLayer {
        let view = shape.draw()
        view.cornerRadius = radius
        return view
    }
}
