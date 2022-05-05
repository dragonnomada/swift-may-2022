//
//  main.swift
//  S302_UsoTuplas
//
//  Created by Dragon on 04/05/22.
//

import Foundation

var personas : [(nombre: String, edad: Int)] = []

var continuar : Bool

repeat {
    
    continuar = false
    
    print("Nombre: ", terminator: "")
    if let nombre = readLine() {
        print("Edad: ", terminator: "")
        if let line = readLine() {
            if let edad = Int(line) {
                let persona = (nombre, edad) // (String, Int)
                // let persona : (nombre: String, edad: Int) = (nombre: nombre, edad: edad)
                personas.append(persona)
            } else {
                print("La edad no es válida")
                continuar = true
                continue // Evaluar nuevamente la condición
            }
        }
    }
    
    print("¿Desea capturar otra persona? S/N", terminator: "")
    
    if let line = readLine() {
        continuar = line == "S" || line == "s"
    }
    
} while continuar

print(personas)

// Sin desacoplar
for persona in personas {
    // persona : (nombre: String, edad: Int)
    print("Nombre: \(persona.nombre) Edad: \(persona.edad)")
}

// Desacoplando
for (nombre, edad) in personas {
    // nombre : String
    // edad : Int
    print("Nombre: \(nombre) Edad: \(edad)")
}
