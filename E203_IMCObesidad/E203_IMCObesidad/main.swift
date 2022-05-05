//
//  main.swift
//  E203_IMCObesidad
//
//  Created by Dragon on 03/05/22.
//

import Foundation

/*
 SWITCH CONDICIONAL
 
 switch <valor> {
 case let x where x < 18.5:
    // TODO: Hacer el caso dónde x < 18.5
    break
 case let x where 18.5 < x < 24.5:
    // TODO: Hacer el caso dónde 18.5 <= x < 24.5
    break
 ...
 }
 */

print("Dame la estatura: ", terminator: "")

if let line1 = readLine() {
    if let estatura = Double(line1) {
        print("Dame el peso: ", terminator: "")
        if let line2 = readLine() {
            if let peso = Double(line2) {
                let imc = peso / (estatura * estatura)
                
                switch imc {
                case let x where x < 18.5:
                    print("BAJO DE PESO")
                    break
                case let x where 18.5 <= x && x < 24.5:
                    print("PESO NORMAL")
                    break
                case let x where 24.5 <= x && x < 30:
                    print("SOBREPESO")
                    break
                case let x where 30 <= x:
                    print("SOBREPESO")
                    break
                default:
                    print("DESCONOCIDO")
                    break
                }
                
            }
        }
    }
}

