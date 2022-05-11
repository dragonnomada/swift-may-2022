//
//  main.swift
//  S802_Extesiones
//
//  Created by Dragon on 11/05/22.
//

import Foundation

/*
 
 EXTENSIONES
 
 Una extensión se aplica sobre una estructura existente, puede ser una clase, una estructura,
 una enumeración o un protocolo.
 
 Las extensiones modifican estructuras existentes para mejorarlas dentro de nuestro proyecto
 y tener utilería mejorada, por ejemplo, si a un entero le queremos dar mas capacidades,
 a un String aplicarle nuevos métodos, o a una clase ya definida agregarle nuevas cosas.

 - Agregar propiedades computadas
 - Definir métodos
 - Proveer nuevos inicializadores
 - Definir subscripts
 - Agregar definiciones en protocolos
 
 SINXTASIS:
 
 extension <TIPO> [: <protocolos ...>] {
 
    <definiciones...>
 
 }
 
 */

struct Producto {
    
    var nombre: String
    var precio: Double
    
}

let p1 = Producto(nombre: "Coca Cola", precio: 18.5)

print(p1)

extension Producto : CustomStringConvertible {
    public var description: String { return "\(nombre) $\(precio)" }
}

extension Producto {
    var isPrecioValido : Bool { return precio > 0 }
    
    func precioMasIva() -> Double {
        return precio * 1.16
    }
}

print(p1.isPrecioValido)

print(p1.precioMasIva())

extension Int {
    
    var triple : Int { return self * 3 }
    
    func doble() -> Int {
        return self * 2
    }
    
    func multiplicado(_ b: Int) -> Int {
        return self * b
    }
    
}

print(23.doble())

print(23.triple)

print(23.multiplicado(10))

enum Frutas: String {
    case Mazana = "MANZANA"
    case Pera = "Pera"
}

extension Frutas {
    
    var precio : Double {
        switch self {
        case .Mazana:
            return 45.5
        case .Pera:
            return 28.9
        }
    }
    
}

let fruta : Frutas = .Mazana

print(fruta)

print(fruta.precio)
