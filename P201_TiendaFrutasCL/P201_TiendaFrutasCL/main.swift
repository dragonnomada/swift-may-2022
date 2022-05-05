//
//  main.swift
//  P201_TiendaFrutasCL
//
//  Created by Dragon on 03/05/22.
//

import Foundation

/*
 DICCIONARIOS
 
 Permiten retener valores asociados a una clave, y ambos pueden ser de distinto tipo.
 
 EJEMPLO: [Int:String] [String:Double] [String:String] [String:[Int]] ...
 
 var d = ["a": 1, "b": 2, "c": 8]
 
 print(d["a"])
 
 d["a"] = 20
 
 */

var frutas : [String:Double] = ["manzana":45.87, "mango":34.5, "pera":19.99] // [:]

var continuar = true

while continuar {
    print("Frutas")
    print("------------------------------")
    // for (<key>, <value>) in <dictionary>
    for (nombre, precio) in frutas {
        print("\(nombre) $\(precio)")
    }
    print("------------------------------")
    print("1. Agregar fruta")
    print("2. Cambiar precio fruta")
    print("3. Eliminar fruta")
    print("4. Salir")
    
    print("Opción: ", terminator: "")
    
    if let line = readLine() {
        if let opcion = Int(line) {
            switch opcion {
            case 1:
                print("Nombre: ", terminator: "")
                if let nombre = readLine() {
                    if frutas.keys.contains(nombre) {
                        print("La fruta \(nombre) ya existe")
                    } else {
                        print("Precio: ", terminator: "")
                        if let line = readLine() {
                            if let precio = Double(line) {
                                frutas[nombre] = precio
                                print("Se agregó la fruta \(nombre)")
                            }
                        }
                    }
                }
                break
            case 2:
                print("Nombre: ", terminator: "")
                if let nombre = readLine() {
                    if frutas.keys.contains(nombre) {
                        print("Precio: ", terminator: "")
                        if let line = readLine() {
                            if let precio = Double(line) {
                                frutas[nombre] = precio
                                print("Se actualizó el precio de la fruta \(nombre) a $\(precio)")
                            }
                        }
                    } else {
                        print("La fruta \(nombre) no existe")
                    }
                }
                break
            case 3:
                print("Nombre: ", terminator: "")
                if let nombre = readLine() {
                    if frutas.keys.contains(nombre) {
                        //frutas.removeValue(forKey: nombre)
                        frutas[nombre] = nil
                        print("Se eliminó la fruta \(nombre)")
                    } else {
                        print("La fruta \(nombre) no existe")
                    }
                }
                break
            case 4:
                print("Fin del programa")
                continuar = false
                break
            default:
                print("La opción no es válida")
                break
            }
            
            if opcion != 4 {
                print("Pulsa ENTER para continuar...")
                if let _ = readLine() {}
            }
        }
    }
}

