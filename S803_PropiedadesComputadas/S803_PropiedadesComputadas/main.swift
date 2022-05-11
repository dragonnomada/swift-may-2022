//
//  main.swift
//  S803_PropiedadesComputadas
//
//  Created by Dragon on 11/05/22.
//

import Foundation

/*
 
 PROPIEDADES COMPUTADAS
 
 Dentro una estructura, clase o enumeración podemos definir propiedades.
 
 EJEMPLO
 
 struct Producto {
    
    var nombre: String
    var precio: Double
    var existencias: Int
 
 }
 
 Sin embargo, también podemos definir propiedades derivadas de las otras
 mediante las propiedades computadas.
 
 Se llamas propiedades computadas, porque se definen como propiedades simples
 asociando una clausura de cómputo sobre el tipo actual.
 
 Esa clausura tiene acceso al ´self´ y a partir de él puede computar
 el resultado esperado por la propiedad asociada a la clausura.
 
 struct Producto {
    
    var nombre: String
    var precio: Double
    var existencias: Int
 
    var valor: Double {
        let resultado = self.precio * self.existencia
        return resultado
    }
 
 }
 
 SINTAXIS:
 
 <TIPO> <nombre> {
 
    var <propiedad> : <tipo> { <clausura ´self´> }
 
 }
 
 */

enum ZonasTuristicas {
    
    case Piriamides
    case Mazatlan
    case Tajin
    case Popocatepetl
    
    var latLon : (lat: Double, lon: Double) {
        
        switch self {
        case .Piriamides:
            return (98, 112)
        case .Mazatlan:
            return (102, -94)
        case .Tajin:
            return (55, 78)
        case .Popocatepetl:
            return (64, 72)
        }
        
    }
    
}

print("\(ZonasTuristicas.Piriamides) \(ZonasTuristicas.Piriamides.latLon)")

let zona = ZonasTuristicas.Tajin

print("\(zona): \(zona.latLon)")

struct Persona {
    
    var nombre: String
    var peso : Double
    var estatura : Double
    
    var imc : Double { return self.peso / (self.estatura * self.estatura) }
    
    var nivelObesidad : String {
        
        switch self.imc {
        case let x where x <= 18.5:
            return "BAJO DE PESO"
        case let x where x > 18.5 && x < 24.5:
            return "PESO NORMAL"
        case let x where x >= 24.5 && x < 30:
            return "SOBRE PESO"
        case let x where x >= 30:
            return "OBESIDAD"
        default:
            return "DESCONOCIDO"
        }
        
    }
    
}

let p = Persona(nombre: "Pepe", peso: 65.2, estatura: 1.68)

print(p.imc)
print(p.nivelObesidad)

struct Fruta {
    
    var nombre: String
    var precio: Double
    var cantidad: Double
    
}

extension Fruta {
    
    var valorMercancia : Double { return self.precio * self.cantidad }
    
    var hayExistenciasMercancia : Bool { return cantidad > 0 }
    
    var porAgortasrseMercancia : Bool { return cantidad <= 1 }
    
}

let f1 = Fruta(nombre: "Manzana", precio: 18.5, cantidad: 10.6)

print(f1.valorMercancia)
print(f1.hayExistenciasMercancia)
print(f1.porAgortasrseMercancia)
