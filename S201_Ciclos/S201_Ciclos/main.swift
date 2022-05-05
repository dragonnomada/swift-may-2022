//
//  main.swift
//  S201_Ciclos
//
//  Created by Dragon on 03/05/22.
//

import Foundation

print("Hello, World! 2 + 2 = \(2 + 2)")

var s = 0
var n = 1

// Mientras la condición se cumpla repite el bloque

while s < 1000 {
    print("pre  i: \(n - 1) s: \(s)")
    s += n
    n += 1
    print("post n: \(n) s: \(s)")
}

print("--------------------------------------------")

// Repite el bloque y vuelve a repetir mientras la condición se cumpla

var opcion : Int

repeat {
    
    print("\u{033c}")
    
    print("Selecciona una opción:")
    print("1. Agregar un producto")
    print("2. Ver los productos")
    print("3. Salir")
    
    // readLine()  -> String?
    // readLine()! -> String!
    // Int(text)   -> Int?
    // Int(text)!  -> Int!
    opcion = Int(readLine()!)!
    
    switch opcion {
    case 1:
        // TODO: Capturar y agregar un producto
        print("Se agregó el producto")
        break
    case 2:
        // TODO: Recorrer e imprimir todos los productos
        print("Se mostraron los productos")
        break
    case 3:
        print("Adiós")
        break
    default:
        print("La opción no es válida")
        break
    }
    
    print("Pulsa ENTRER para continuar...")
    if let _ = readLine() {
        print("")
    }
    
} while opcion != 3
