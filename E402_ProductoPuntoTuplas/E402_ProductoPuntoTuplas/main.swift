//
//  main.swift
//  E402_ProductoPuntoTuplas
//
//  Created by Dragon on 05/05/22.
//

import Foundation

let p1 : (Double, Double, Double) = (1, 1, 1)
let p2 : (Double, Double, Double) = (3, 1, -4)

let (x1, y1, z1) = p1 // (1, 1, 1)
let (x2, y2, z2) = p2 // (3, 1, -4)

let dot : Double = x1 * x2 + y1 * y2 + z1 * z2

print("<1, 1, 1> * <3, 1, -4> = \(dot)") // 1 * 3 + 1 * 1 + 1 * (-4) = 0.0

