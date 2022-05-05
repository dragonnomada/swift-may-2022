//
//  main.swift
//  E205_MenuOpciones
//
//  Created by Dragon on 03/05/22.
//

import Foundation

var opcion : Int = 0

repeat {
    
    print("1. Imprimir Hola")
    print("2. Imprimir x^2")
    print("3. Imprimir la línea dada por el usuario")
    print("4. Salir")
    
    if let line = readLine() {
        if let o = Int(line) {
            opcion = o
            switch opcion {
            case 1:
                print("Hola mundo")
                break
            case 2:
                print("Dame x: ", terminator: "")
                if let line2 = readLine() {
                    if let x = Double(line2) {
                        print("x^2 = \(pow(x, 2))")
                    }
                }
                break
            case 3:
                print("Dame un línea: ", terminator: "")
                if let line3 = readLine() {
                    print("Línea: \(line3)")
                }
                break
            case 4:
                print("Adiós")
                break
            default:
                print("Opción no válida")
            }
        } else {
            opcion = 0
        }
    } else {
        opcion = 0
    }
    
} while opcion != 4

