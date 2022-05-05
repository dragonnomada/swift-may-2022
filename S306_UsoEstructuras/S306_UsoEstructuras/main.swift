//
//  main.swift
//  S306_UsoEstructuras
//
//  Created by Dragon on 04/05/22.
//

import Foundation

/*
 
 FUNCIONES ESTÁTICAS
 
 Una función estática dentro de una estructura
 representa una función independiente de cualquier instancia,
 es decir, son funciones que podemos consumir sin tener
 ningún objeto asociado.
 
 NO-ESTÁTICO:
 
 let obj = Foo(a: 1, b: 2)
 obj.bar() // bar tiene acceso a ´a´ y ´b´
 
 ESTÁTICO
 
 Foo.zip() // zip tiene acceso a ´a´ o ´b´
 
 */

struct Producto {
    
    var nombre : String
    var descripcion : String
    var precio : Double
    var existencias : Int
    
    func tieneExistencas() -> Bool {
        return existencias > 0
    }
    
    func sinExistencias() -> Bool {
        return !tieneExistencas()
    }
    
    func describir() {
        print("\(nombre) $\(precio) (\(existencias))")
    }
    
    static func capturar() -> Producto? {
        print("Nombre: ", terminator: "")
        if let nombre = readLine() {
            print("Descripción: ", terminator: "")
            if let descripcion = readLine() {
                print("Precio: ", terminator: "")
                if let line = readLine() {
                    if let precio = Double(line) {
                        print("Existencias: ", terminator: "")
                        if let line = readLine() {
                            if let existencias = Int(line) {
                                return Producto(nombre: nombre, descripcion: descripcion, precio: precio, existencias: existencias)
                            }
                        }
                    }
                }
            }
        }
        
        return nil
    }
    
}

let p1 = Producto(nombre: "Coca Cola", descripcion: "Refresco de cola", precio: 18.59, existencias: 100)

p1.describir()

let producto1 = Producto.capturar()

print(type(of: producto1))

// producto1?.precio // -> Double?

producto1?.describir() // Sólo ejecuta describir() si producto1 no es nil

// Código seguro
if let producto2 = Producto.capturar() {
    // Sólo ejecuta este bloque si producto2 no era nil
    print(type(of: producto2))
    
    // producto2.precio // -> Double
    
    producto2.describir()
}
