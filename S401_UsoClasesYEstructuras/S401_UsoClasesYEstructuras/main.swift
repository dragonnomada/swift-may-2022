//
//  main.swift
//  S401_UsoClasesYEstructuras
//
//  Created by Dragon on 05/05/22.
//

import Foundation

struct Fruta {
    
    var nombre: String
    var precio: Double
    
    func describir() {
        print("\(nombre) $\(precio)")
    }
    
}

class FrutaUI {
    
    var frutas : [Fruta] = []
    
    func mostrarMenu() -> Int? {
        print("1. Agregar Fruta")
        print("2. Modificar Fruta")
        print("3. Eliminar Fruta")
        print("4. Salir")
        
        print("Opción: ", terminator: "")
        if let line = readLine() {
            if let opcion = Int(line) {
                return opcion
            }
        }
        
        return nil
    }
    
    func mostrarFrutas() {
        if frutas.count == 0 {
            print("No hay frutas")
        } else {
            print("Frutas: \(frutas.count)")
            for fruta in frutas {
                fruta.describir()
            }
        }
        print("--------------------------")
    }
    
    func agregarFruta() {
        print("Nombre: ", terminator: "")
        if let nombre = readLine() {
            print("Precio: ", terminator: "")
            if let line = readLine() {
                if let precio = Double(line) {
                    let fruta = Fruta(nombre: nombre, precio: precio)
                    frutas.append(fruta)
                    print("Fruta agregada:")
                    fruta.describir()
                } else {
                    print("El precio de la fruta no es válido")
                    agregarFruta() // Recursividad
                }
            } else {
                print("Error al leer el precio")
                agregarFruta() // Recursividad
            }
        } else {
            print("Error al leer el nombre")
            agregarFruta() // Recursividad
        }
    }
    
    func repetirMenu() {
        
        mostrarFrutas()
        
        if let opcion = mostrarMenu() {
            switch opcion {
            case 1:
                agregarFruta()
                break
            case 4:
                print("Fin del programa")
                return
            default:
                print("Opción no válida (\(opcion))")
                break
            }
        } else {
            print("No se pudo leer la opción")
        }
        
        print("Pulsa Enter para continuar...")
        if let _ = readLine() {}
        
        repetirMenu() // Recursividad
        
    }
    
}

let frutaUI = FrutaUI()

frutaUI.repetirMenu()
