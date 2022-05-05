//
//  main.swift
//  E404_CoordenadasPolares
//
//  Created by Dragon on 05/05/22.
//

import Foundation

func coordenadasPolares(x: Double, y: Double) -> (r: Double, theta: Double) {
    let r = sqrt(x * x + pow(y, 2))
    let theta = atan2(y, x)
    return (r, theta)
}

print(coordenadasPolares(x: 1, y: 1))
print(coordenadasPolares(x: -1, y: 1))
print(coordenadasPolares(x: -1, y: -1))
print(coordenadasPolares(x: 1, y: -1))
