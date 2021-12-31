//
//  Graphic.swift
//  Currency Today
//
//  Created by Garnik on 12/25/21.
//

import UIKit
import CoreGraphics

@IBDesignable
class Graphic: UIView{
    override func draw(_ rect: CGRect) {
        UIColor(red: 103/255, green: 146/255, blue: 195/255, alpha: 1).set()
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 10, y:5))
        line.addLine(to: CGPoint(x: 120, y:5))
        line.lineWidth = 4
        line.stroke()

        UIColor(red: 163/255, green: 189/255, blue: 218/255, alpha: 1).setFill()

        let origins = [CGPoint(x: 10, y: 24),
                       CGPoint(x: 50, y: 78),
                       CGPoint(x: 90, y: 150)]

        let size = CGSize(width: 10, height: 10)

        for origin in origins {
            let quad = UIBezierPath.init(roundedRect: CGRect(origin: origin, size: size), cornerRadius: 2)
            quad.fill()
            quad.stroke()
        }
    }
}

let viewRect = CGRect(x: 0, y: 0, width: 100, height: 10)
let myEmptyView = Graphic(frame: viewRect)
