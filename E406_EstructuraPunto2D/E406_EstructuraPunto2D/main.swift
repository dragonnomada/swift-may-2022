//
//  main.swift
//  E406_EstructuraPunto2D
//
//  Created by Dragon on 05/05/22.
//

import Foundation

struct Punto2D {
    
    var x : Double
    var y : Double
    
    func radio() -> Double {
        return sqrt(x * x + y * y)
    }
    
    func angulo() -> Double {
        return atan2(y, x)
    }
    
    func distancia(punto: Punto2D) -> Double {
        return sqrt(pow(x - punto.x, 2) + pow(y - punto.y, 2))
    }
    
    func describir() {
        print("(\(x), \(y))")
    }
    
}

let p1 = Punto2D(x: 1, y: 1)
let p2 = Punto2D(x: 4.5, y: 3.2)

p1.describir() // (1.0, 1.0)
p2.describir() // (4.5, 3.2)

print(p1.distancia(punto: p2)) // 4.13...
print(p2.distancia(punto: p1)) // 4.13...

print(p1.radio())  // 1.4142...
print(p1.angulo()) // 0.785...

print(p2.radio())  // 5.521...
print(p2.angulo()) // 0.6181...
