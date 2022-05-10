//
//  main.swift
//  S703_ConsultasEnumeracionsSubscript
//
//  Created by Dragon on 10/05/22.
//

import Foundation

enum ConsultaProductos {
    
    case porNombre(String)
    case porPrecio(Double)
    case enRangoPrecio(Double, Double)
    case porPrecioMaximo(Double)
    case porPrecioMinimo(Double)
    
}

struct Producto: CustomStringConvertible {
    
    var nombre: String
    var precio: Double
    
    public var description: String { return "\(nombre) $\(precio)"}
    
}

class Tienda {
    
    var productos : [Producto] = []
    
    func agregar(nombre: String, precio: Double) {
        productos.append(Producto(nombre: nombre, precio: precio))
    }
    
    subscript(consulta: ConsultaProductos) -> [Producto] {
        var productosEncontrados: [Producto] = []
        for producto in productos  {
            switch consulta {
            case .porNombre(let nombre):
                if producto.nombre == nombre {
                    productosEncontrados.append(producto)
                }
                break
            case .porPrecio(let precio):
                if producto.precio == precio {
                    productosEncontrados.append(producto)
                }
                break
            case .enRangoPrecio(let min, let max):
                if producto.precio >= min && producto.precio <= max {
                    productosEncontrados.append(producto)
                }
                break
            case .porPrecioMaximo(let max):
                if producto.precio <= max {
                    productosEncontrados.append(producto)
                }
                break
            case .porPrecioMinimo(let min):
                if producto.precio >= min {
                    productosEncontrados.append(producto)
                }
                break
            }
        }
        return productosEncontrados
    }
    
}

let tienda = Tienda()

tienda.agregar(nombre: "Coca Cola", precio: 18.5)
tienda.agregar(nombre: "Pepsi", precio: 18.5)
tienda.agregar(nombre: "Gansito", precio: 15.5)
tienda.agregar(nombre: "Galletas", precio: 10.5)
tienda.agregar(nombre: "Choco Roll", precio: 8.5)

print(tienda[.porNombre("Coca Cola")])
print(tienda[.porPrecio(18.5)])
print(tienda[.enRangoPrecio(12, 20)])
print(tienda[.porPrecioMaximo(11)])
print(tienda[.porPrecioMinimo(16)])
