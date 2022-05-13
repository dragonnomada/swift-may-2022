//
//  main.swift
//  E903_ProtocoloCoordenada
//
//  Created by Dragon on 12/05/22.
//

import Foundation

protocol Coordenada {
    
    var lat: Double { get set }
    var lon: Double { get set }
    
    func distancia(coordenada: Coordenada) -> Double
    
}

struct Tienda: Coordenada {
    
    var titulo: String
    
    // let lat: Double // automáticamente sería { get }
    
    var lat: Double // automáticamente sería { get set }
    var lon: Double // automáticamente sería { get set }
    
    func distancia(coordenada: Coordenada) -> Double {
        return sqrt((self.lat - coordenada.lat) * (self.lat - coordenada.lat) + (self.lat - coordenada.lon) * (self.lon - coordenada.lon))
    }
    
}

func calcularDistanciaMaxima(coordenas: [Coordenada]) -> Double {
    var distanciaMaxima: Double = 0
    for coordena1 in coordenas {
        for coordena2 in coordenas {
            let distancia = coordena1.distancia(coordenada: coordena2)
            if distanciaMaxima < distancia {
                distanciaMaxima = distancia
            }
        }
    }
    return distanciaMaxima
}

let tienda1 = Tienda(titulo: "Starbucks", lat: 99.7, lon: 113.5)
let tienda2 = Tienda(titulo: "Farmacia Guadalajara", lat: 98, lon: 117)
let tienda3 = Tienda(titulo: "Sanborns", lat: 94, lon: 102)
let tienda4 = Tienda(titulo: "Steren", lat: 101, lon: 87)

print(calcularDistanciaMaxima(coordenas: [
    tienda1,
    tienda2,
    tienda3,
    tienda4
]))
