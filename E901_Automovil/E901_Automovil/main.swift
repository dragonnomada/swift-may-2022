//
//  main.swift
//  E901_Automovil
//
//  Created by Dragon on 12/05/22.
//

import Foundation

enum ColorAutomovil {
    
    case Blanco
    case Negro
    case Rojo
    case Azul
    
}

enum TipoAutomovil {
    
    case Sedan
    case Subuvan
    case Camioneta
    case Deportivo
    
}

struct Automovil {
    
    var marca: String
    var modelo: String
    var placas: String
    var año: Int
    var color: ColorAutomovil
    var tipo: TipoAutomovil
    
    var descripcion: String {
        return "\(descripcionCorta) \(color) tipo \(tipo) <\(placas)>"
    }
    
    var descripcionCorta: String {
        get { return "[\(año)] \(marca) \(modelo)" }
    }
    
    var placasAsInt: Int? {
        get { return Int(placas) }
        set {
            if let placas = newValue {
                self.placas = "\(placas)"
            }
        }
    }
    
}

var automovil = Automovil(marca: "Chevrolet", modelo: "Aveo", placas: "123455", año: 2017, color: .Blanco, tipo: .Sedan)

print(automovil.descripcionCorta)
print(automovil.descripcion)

if let placas = automovil.placasAsInt {
    print("Placas: \(placas)")
} else {
    print("Las placas no son dígitos")
}

automovil.placasAsInt = 65432

print(automovil.descripcion)

extension Automovil {
    
    var placasSerie: (letras: String, numero: Int)? {
        get {
            let partes = placas.split(separator: "-")
            // print(partes)
            if partes.count == 2 {
                let letras = partes[0]
                if let numero = Int(partes[1]) {
                    return (String(letras), numero)
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if let (letras, numero) = newValue {
                placas = "\(letras)-\(numero)"
            }
        }
    }
    
}

automovil.placas = "ABC-1234"

print(automovil.descripcion)

if let (letras, numero) = automovil.placasSerie {
    print("Placas: LETRAS(\(letras)) NÚMERO(\(numero))")
}

automovil.placasSerie = ("XYZ", 45678)

print(automovil.descripcion)

if let (letras, numero) = automovil.placasSerie {
    print("Placas: LETRAS(\(letras)) NÚMERO(\(numero))")
}

enum SeriesAutomivil: String {
    
    case Sedan = "SDN"
    case Taxi = "TXX"
    case Gob = "GOB"
    case Patrulla = "PTT"
    
    var placaSerieAleatoria: (letras: String, numero: Int) {
        return (self.rawValue, abs(Date().hashValue) % 10000)
    }
    
}

automovil.placasSerie = (SeriesAutomivil.Sedan.rawValue, 1234)

print(automovil.descripcion)

if let (letras, numero) = automovil.placasSerie {
    print("Placas: LETRAS(\(letras)) NÚMERO(\(numero))")
}

automovil.placasSerie = SeriesAutomivil.Taxi.placaSerieAleatoria

print(automovil.descripcion)

if let (letras, numero) = automovil.placasSerie {
    print("Placas: LETRAS(\(letras)) NÚMERO(\(numero))")
}
