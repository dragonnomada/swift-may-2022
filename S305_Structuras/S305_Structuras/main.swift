//
//  main.swift
//  S305_Structuras
//
//  Created by Dragon on 04/05/22.
//

import Foundation

/*
 
 ESTRUCTURAS
 
 Una estructura permite retener valores de distintos tipos
 y almacenar funciones para proveer mecanismos con acceso
 a los valores retenidos
 
 SINTAXIS: struct <nombre> { <atributos ...> <métodos ...> }
 
 <atributo> ~ var <atributo> : <tipo>
 
 INSTANCIACIÓN / ESTRUCTURACIÓN
 
 var/let <objeto> : <estructura> = <estructura>(<atributo 1>: <valor 1>, ..., <atributo n>: <valor n>
 
 NOTA:
 
 Una tupla será usada para transimisión de datos no-formales.
 
 Una estructura será usada para transmisión de datos formales.
 
 */

// Una tupla no tiene mecanismos internos sobre sus datos
let persona1 : (nombre: String, edad: Int) = ("Pepe", 45)

// Una estructura puede definir mecanismos internos sobre sus datos
struct Persona {
    var nombre: String
    var edad : Int
    
    func describir() {
        print("\(nombre), \(edad) años")
    }
    
    func esMayorEdad() -> Bool {
        return edad >= 18
    }
    
    func estaEdadEnRango(min: Int, max: Int) -> Bool {
        return edad >= min && edad <= max
    }
}

let persona2 : Persona = Persona(nombre: "Pepe", edad: 45)

persona2.describir()

let persona3 : Persona = Persona(nombre: "Lucho", edad: 15)

persona3.describir()

print("Lucho es mayor de edad? \(persona3.esMayorEdad())")

let persona4 = Persona(nombre: "Marta", edad: 34)

persona4.describir()

print("Marta es mayor de edad? \(persona4.esMayorEdad())")

