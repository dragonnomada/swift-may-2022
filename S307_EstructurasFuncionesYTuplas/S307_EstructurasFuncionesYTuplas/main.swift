//
//  main.swift
//  S307_EstructurasFuncionesYTuplas
//
//  Created by Dragon on 04/05/22.
//

import Foundation

func capturarEntero(mensaje: String = "Entero: ") -> Int? {
    print(mensaje, terminator: "")
    if let line = readLine() {
        if let entero = Int(line) {
            return entero
        }
    }
    return nil
}

/*
if let edad = capturarEntero() {
    print("Tu edad es: \(edad) años")
}
 */

/*
if let existencias = capturarEntero(mensaje: "Existencias: ") {
    print("Tienes \(existencias) existencias")
}
*/

func capturaDosEnteros(mensaje1: String = "Entero 1: ", mensaje2: String = "Entero 2") -> (Int?, Int?) {
    return (capturarEntero(mensaje: mensaje1), capturarEntero(mensaje: mensaje2))
}

/*
let (a, b) = capturaDosEnteros(mensaje1: "A: ", mensaje2: "B: ")

// Operador opcional de línea: <opcional> ?? <valor>
print("a: \(a ?? 0) b: \(b ?? 0)")
*/

struct Par {
    
    var a : Int
    var b : Int
    
    func getMin() -> Int {
        if a < b {
            return a
        } else {
            return b
        }
    }
    
    func getMax() -> Int {
        if a < b {
            return b
        } else {
            return a
        }
    }
    
    func isSymetric() -> Bool {
        return a == b
    }
    
    func sorted() -> (Int, Int) {
        return (getMin(), getMax())
    }
}

let par1 = Par(a: 4, b: 2)

print(par1.sorted())

