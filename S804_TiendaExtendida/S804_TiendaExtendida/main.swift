//
//  main.swift
//  S804_TiendaExtendida
//
//  Created by Dragon on 11/05/22.
//

import Foundation

struct Producto {
    
    var nombre: String
    var precio: Double
    
}

class Tienda {
    
    var productos: [Producto] = []
    
    func agregar(nombre: String, precio: Double) {
        productos.append(Producto(nombre: nombre, precio: precio))
    }
    
}

let tienda = Tienda()

tienda.agregar(nombre: "Coca Cola", precio: 18.5)
tienda.agregar(nombre: "Gansito", precio: 10.5)

extension Tienda {
    
    var total : Double {
        var total : Double = 0
        for producto in productos {
            total = total + producto.precio
        }
        return total
    }
    
    func calcularTotal() -> Double {
        var total : Double = 0
        for producto in productos {
            total = total + producto.precio
        }
        return total
    }
    
}

print(tienda.total)
print(tienda.calcularTotal())
