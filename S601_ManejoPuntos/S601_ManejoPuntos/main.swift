//
//  main.swift
//  S601_ManejoPuntos
//
//  Created by Dragon on 09/05/22.
//

import Foundation

func distancia(puntoA: (String, Double, Double), puntoB: (String, Double, Double)) -> Double {
    let (_, x1, y1) : (String, Double, Double) = puntoA
    let (_, x2, y2) : (String, Double, Double) = puntoB
    
    let d = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    
    return d
}

func distancia(origen: (nombre: String, x: Double, y: Double), puntos: [(nombre: String, x: Double, y: Double)]) -> [Double] {
    var distancias : [Double] = []
    
    for punto in puntos {
        let d = distancia(puntoA: origen, puntoB: punto)
        distancias.append(d)
    }
    
    return distancias
}

let puntos : [(nombre: String, x: Double, y: Double)] = [
    ("Starbucks", 20, 32),
    ("CityExpress", 58, 60),
    ("Sanborns", -42, 53),
    ("Walmart", 17, 29),
    ("Gandhi", -22, 44),
    ("Zócalo", 19, 34)
]

print(distancia(puntoA: puntos[1], puntoB: puntos[4])) // distancia(~CityExpress, ~Gandhi)

let origen : (nombre: String, x: Double, y: Double) = ("Yo", 10, 12)

let distancias = distancia(origen: origen, puntos: puntos)

print(distancias)

for i in 0..<puntos.count {
    let p = puntos[i]
    let d = distancias[i]
    
    print("Del Origen [\(origen.nombre)]: (\(origen.x), \(origen.y)) al Punto [\(p.nombre)] (\(p.x), \(p.y)) la distancia es: \(d)")
}
