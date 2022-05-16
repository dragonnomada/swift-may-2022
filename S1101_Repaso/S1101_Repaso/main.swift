//
//  main.swift
//  S1101_Repaso
//
//  Created by Dragon on 16/05/22.
//

import Foundation

protocol Producto {
    
    var id: Int { get }
    var nombre: String { get }
    var precio: Double { get }
    
}

class Paquete: CustomStringConvertible {
    
    var id: Int
    var guia: String
    var contenido: Producto
    
    var costo: Double {
        
        let total: Double = contenido.precio * 1.16 + 20.99
        
        return total
        
    }
    
    var description: String {
        
        var text = ""
        
        text += "ID: \(id) GUIA: \(guia)\n"
        text += "-------------------------\n"
        text += "[\(contenido.id)] \(contenido.nombre)\n"
        text += "VALOR: $\(contenido.precio)\n"
        text += "TOTAL: $\(costo)"
        
        return text
        
    }
    
    init(id: Int, guia: String, contenido: Producto) {
        self.id = id
        self.guia = guia
        self.contenido = contenido
    }
    
}

struct Libro: Producto {
    
    var id: Int
    
    var titulo: String
    var autor: String
    
    var nombre: String { return "\(titulo) - \(autor)" }
    
    var precio: Double { return 9.99 }
    
    
}

let l1 = Libro(id: 456, titulo: "Sín título", autor: "Anónimo")

let p1 = Paquete(id: 123, guia: "ABC", contenido: l1)

print(p1)

struct Playera: Producto {
    
    var id: Int
    
    var tipo: String
    
    var color: String
    
    var nombre: String { return "Playera Tipo \(tipo) Color \(color)" }
    
    var precio: Double { return 5.99 }
    
}

let playera1 = Playera(id: 2001, tipo: "Polo H/M", color: "Gis")

let p2 = Paquete(id: 124, guia: "DEF", contenido: playera1)

print(p2)

class PaqueteAlmacenable: Paquete {
    
    var dimensiones: (ancho: Double, alto: Double, largo: Double)?
    
    override var description: String {
        
        var text = super.description + "\n"
        
        if let (ancho, alto, largo) = dimensiones {
            text += "---------------------------\n"
            text += "DIMENSIONES: \(ancho)x\(alto)x\(largo)"
        } else {
            text += "---------------------------\n"
            text += "SIN DIMENSIONES"
        }
        
        return text
        
    }
    
    override init(id: Int, guia: String, contenido: Producto) {
        super.init(id: id, guia: guia, contenido: contenido)
    }
    
    init(id: Int, guia: String, contenido: Producto, ancho: Double, alto: Double, largo: Double) {
        dimensiones = (ancho, alto, largo)
        
        super.init(id: id, guia: guia, contenido: contenido)
    }
    
}

let pa1 = PaqueteAlmacenable(id: 4001, guia: "4001-ROX", contenido: l1)
let pa2 = PaqueteAlmacenable(id: 4002, guia: "4002-JWR", contenido: playera1, ancho: 34, alto: 55, largo: 21)

print(pa1)
print(pa2)
