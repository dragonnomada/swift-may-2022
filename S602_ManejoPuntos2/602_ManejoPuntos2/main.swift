//
//  main.swift
//  602_ManejoPuntos2
//
//  Created by Dragon on 09/05/22.
//

import Foundation

struct Punto {
    
    var nombre: String
    var x : Double
    var y : Double
    
    func distancia(punto : Punto) -> Double {
        
        let d = sqrt((x - punto.x) * (x - punto.x) + (y - punto.y) * (y - punto.y))
        
        return d;
        
    }
    
    func distancia(puntos : [Punto]) -> [Double] {
        
        var distancias : [Double] = []
        
        for punto in puntos {
            let d = self.distancia(punto: punto)
            distancias.append(d)
        }
        
        return distancias
        
    }
    
    func describir() {
        print("[\(nombre)] (\(x), \(y))")
    }
    
}

let puntos : [Punto] = [
    Punto(nombre: "Starbuks", x: 45, y: 31),
    Punto(nombre: "CityExpress", x: 32, y: -12),
    Punto(nombre: "Walmart", x: 26, y: 18),
    Punto(nombre: "Chedraui", x: -19, y: 25),
    Punto(nombre: "Gandhi", x: -12, y: 98),
    Punto(nombre: "Zócolo", x: 45, y: 116),
]

puntos[1].describir()
puntos[4].describir()
print(puntos[1].distancia(punto: puntos[4]))

let origen = Punto(nombre: "Yo", x: 10, y: 12)

origen.describir()
puntos[3].describir()
print(origen.distancia(punto: puntos[3]))

origen.describir()
print(origen.distancia(puntos: puntos))

for punto in puntos {
    print("---------------")
    origen.describir()
    punto.describir()
    let d = origen.distancia(punto: punto)
    print("La distancia es: \(d)")
}
