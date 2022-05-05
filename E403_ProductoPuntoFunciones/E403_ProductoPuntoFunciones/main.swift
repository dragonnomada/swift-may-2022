//
//  main.swift
//  E403_ProductoPuntoFunciones
//
//  Created by Dragon on 05/05/22.
//

import Foundation

func productoPunto(u a: (Double, Double, Double), v b: (Double, Double, Double)) -> Double {
    let (x1, y1, z1) = a
    let (x2, y2, z2) = b
    
    return x1 * x2 + y1 * y2 + z1 * z2
}

print(productoPunto(u: (1, 1, 1), v: (1, 3, -4)))

print(productoPunto(u: (1, 2, 3), v: (4, 5, 6)))
