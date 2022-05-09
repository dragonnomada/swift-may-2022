//
//  main.swift
//  603_AlmacenProductos
//
//  Created by Dragon on 09/05/22.
//

import Foundation

struct Producto {
    
    var nombre : String
    var precio : Double
    var existencias : Int
    
    func describir() {
        print("\(nombre) $\(precio) [\(existencias)]")
    }
    
}

class AlmacenProductos {
    
    var productos : [Producto] // No-Opcional
    
    init() { // Inicializador
        productos = []
        print("# Inicializando AlmacenProductos")
    }
    
    init(productosIniciales: [Producto]) {
        
        productos = []
        
        for producto in productosIniciales {
            productos.append(producto)
        }
        
        print("# Inicializando AlmacenProductos con productos iniciales")
    }
    
    init(conProductosNumerados: Int) {
        productos = []
        
        for i in 1...conProductosNumerados {
            productos.append(
                Producto(nombre: "Producto \(i)", precio: (10.0 * Double(i) / 5.0), existencias: 2 * i + 20)
            )
        }
        
        print("# Inicializando AlmacenProductos con productos numerados")
    }
    
    deinit {
        print("# Deinicializando: \(productos.count) [\(productos.capacity)]")
        
        productos.removeAll()
    }
    
}

var almacen1 : AlmacenProductos? = AlmacenProductos() // Llama al inicializador
var almacen2 : AlmacenProductos? = AlmacenProductos() // Llama al inicializador

var almacen3 : AlmacenProductos? = AlmacenProductos(productosIniciales: [
    Producto(nombre: "Coca Cola", precio: 18.5, existencias: 23),
    Producto(nombre: "Gansito", precio: 15.5, existencias: 43),
    Producto(nombre: "Choco Roll", precio: 10.5, existencias: 21),
]) // Llama al inicializador con productos iniciales

var almacen4 : AlmacenProductos? = AlmacenProductos(conProductosNumerados: 100) // Llama al inicializador con productos numerados

print(almacen4!.productos)

almacen1 = nil
almacen2 = nil
almacen3 = nil
almacen4 = nil

let a = {
    print("Dentro de la clausura")
    let almacen5 = AlmacenProductos(conProductosNumerados: 500)
    print(almacen5)
}

a()

print("Después de la clausura")
