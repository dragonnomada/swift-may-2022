//
//  main.swift
//  E201_PuedeVotar
//
//  Created by Dragon on 03/05/22.
//

import Foundation

// readLine()   -> String?
// Int(<texto>) -> Int?

print("Dame la edad: ", terminator: "")

if let linea = readLine() {
    if let edad = Int(linea) {
        // TODO: Determinar si puede o no votar
        if edad >= 18 {
            print("PUEDE VOTAR")
        } else {
            print("NO PUEDE VOTAR")
        }
    } else {
        print("La línea no es un entero")
    }
} else {
    print("No se pudo capturar la línea")
}

