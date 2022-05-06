//
//  main.swift
//  S502_CommandLineApp
//
//  Created by Dragon on 06/05/22.
//

import Foundation

class CommandLineAppUI {
    
    func mostrarMenu(hacerA: ((Int) -> Bool), hacerB: ((Int) -> Bool)) {
        print("1. Hacer A")
        print("2. Hacer B")

        if let line = readLine() {
            if let opcion = Int(line) {
                switch opcion {
                case 1:
                    if hacerA(opcion) {
                        mostrarMenu(hacerA: hacerA, hacerB: hacerB)
                        return
                    } else {
                        return
                    }
                case 2:
                    if hacerB(opcion) {
                        mostrarMenu(hacerA: hacerA, hacerB: hacerB)
                        return
                    } else {
                        return
                    }
                default:
                    print("Opción no válida")
                    mostrarMenu(hacerA: hacerA, hacerB: hacerB)
                    break
                }
            }
        }
    }
    
}

let app : CommandLineAppUI = CommandLineAppUI()

func saludar(a: Int) -> Bool {
    print("Hola mundo \(a)")
    return true
}

func salir(a: Int) -> Bool {
    print("Adiós")
    return false
}

app.mostrarMenu(hacerA: saludar, hacerB: salir)

func mostrarPi(_: Int) -> Bool {
    print("3.14159265")
    return false
}

app.mostrarMenu(hacerA: mostrarPi, hacerB: salir)
