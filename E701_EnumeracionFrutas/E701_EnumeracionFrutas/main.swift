//
//  main.swift
//  E701_EnumeracionFrutas
//
//  Created by Dragon on 10/05/22.
//

import Foundation

enum Frutas: Int {
    
    case Manzana = 101
    case Mango = 304
    case Pera = 102
    case Kiwi = 301
    case Fresa = 302
    case Melon = 201
    case Papaya = 202
    case Guayaba = 103
    case Sandia = 303
    
}

func precioFruta(fruta: Frutas) -> Double {
    switch fruta {
    case .Manzana:
        return 45.5
    case .Mango:
        return 62.99
    case .Pera:
        return 31.23
    case .Kiwi:
        return 78.91
    case .Fresa:
        return 27.55
    case .Melon:
        return 32.44
    case .Papaya:
        return 17.88
    case .Guayaba:
        return 21.13
    case .Sandia:
        return 16.89
    }
}

func solicitarFruta() {
    print("Ingresa el código: ", terminator: "")
    if let respuesta = readLine() {
        if let codigo = Int(respuesta) {
            if let fruta = Frutas(rawValue: codigo) {
                let precio = precioFruta(fruta: fruta)
                print("\(fruta) cuesta $\(precio)")
            }
        }
    }
}

solicitarFruta()
