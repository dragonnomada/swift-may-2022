//
//  main.swift
//  308_ClasesYObjetos
//
//  Created by Dragon on 04/05/22.
//

import Foundation

/*
 
 CLASES
 
 Una clase es similar a una estructura y representa un conjunto de atributos
 y métodos que podremos retener en objetos, a estos les llamaremos instancias,
 y el propósito general de clases será resolver conjuntos de tareas
 para construir una solición que quede retenida en atributos
 y pueda ser replicada mediante métodos.
 
 SINTAXIS:
 
 class <nombre {
 
    <atributo n> ~ var <nombre> : <tipo>
    <atributo n> ~ var <nombre> : <tipo> = <valor inicial>
 
    <método> ~ func <nombre>(<parámetros ...>) -> <tipo retorno> {
        <bloque>
    }
 
 }
 
 */

// Entidad Física / Registro
// No resuelve tareas -> Retención de Datos
struct Producto {
    
    var nombre : String
    var precio : Double
    var existencias : Int
    
    func describir() {
        print("\(nombre) $\(precio) [\(existencias)]")
    }
    
}

// Entidad Virtual / Operación
// Resuelve tareas -> Transacción de Datos
class TicketCompra {
    
    var productos : [Producto] = [] // Los atributos no opcionales deben inicializarse
    var total : Double? // Los atributos opcionales pueden no inicializarse
    
    func agregarProducto(producto: Producto) {
        productos.append(producto)
    }
    
    func buscarProducto(nombre: String) -> Producto? {
        for producto in productos {
            if producto.nombre == nombre {
                return producto
            }
        }
        return nil
    }
    
    func calcularTotal() -> Double {
        var s : Double = 0
        
        for producto in productos {
            s += producto.precio
        }
        
        total = s
        
        return s
    }
    
    func describir() {
        print("#Productos: \(productos.count)")
        print("------------------------------")
        for producto in productos {
            producto.describir()
        }
        print("------------------------------")
        print("Total: $\(calcularTotal())")
    }
    
}

let ticket1 = TicketCompra()

ticket1.agregarProducto(producto: Producto(nombre: "Coca Cola", precio: 18.5, existencias: 12))
ticket1.agregarProducto(producto: Producto(nombre: "Galletas Marías", precio: 16.99, existencias: 6))

ticket1.describir()
