//
//  main.swift
//  S806_TiendaProtocolos
//
//  Created by Dragon on 11/05/22.
//

import Foundation

protocol Producto {
    
    var id: Int { get }
    var descripcion: String { get }
    var total: Double { get }
    var hayExistencias: Bool { get }
    
}

protocol Tienda {
    
    var listaProductos: [Producto] { get }
    
    func agregar(producto: Producto) -> Bool
    
    func quitar(producto: Producto) -> Bool
    
    func buscarProducto(id: Int) -> Producto?
    
    func productosEnRangoTotal(min: Double, max: Double) -> [Producto]
    
}

struct Libro: Producto {
    
    var id: Int
    var titulo: String
    var autor: String
    var año: Int
    
    var descripcion: String { return "Libro \(titulo) - \(autor) [\(año)]" }
    
    var total: Double { return 9.99 }
    
    var hayExistencias: Bool { return true }
    
}

enum TipoPlayera {
    case Hombre
    case Mujer
    case Unisex
    
    var factor: Double {
        switch self {
        case .Hombre:
            return 1
        case .Mujer:
            return 1
        case .Unisex:
            return 1.5
        }
    }
}

enum ColorPlayera {
    case Blanca
    case Negra
    case Roja
    case Azul
    
    var costo: Double {
        switch self {
        case .Blanca:
            return 9.99
        case .Negra:
            return 8.99
        case .Roja:
            return 12.99
        case .Azul:
            return 11.99
        }
    }
}

struct Playera: Producto {
    
    var id: Int
    var tipo: TipoPlayera
    var color: ColorPlayera
    
    var descripcion: String { return "Playera \(tipo) color: \(color)" }
    
    var total: Double { return tipo.factor * color.costo }
    
    var hayExistencias: Bool {
    
        switch color {
        case .Blanca:
            return true
        case .Negra:
            return true
        case .Roja:
            return false
        case .Azul:
            return false
        }
        
    }
    
}

class TiendaLibrosPlayeras: Tienda {
    
    var listaProductos: [Producto] = []
    
    func agregar(producto: Producto) -> Bool {
        listaProductos.append(producto)
        return true
    }
    
    func quitar(producto: Producto) -> Bool {
        if let index = listaProductos.firstIndex(where: { $0.id == producto.id }) {
            listaProductos.remove(at: index)
            return true
        }
        return false
    }
    
    func buscarProducto(id: Int) -> Producto? {
        for producto in listaProductos {
            if producto.id == id {
                return producto
            }
        }
        return nil
    }
    
    func productosEnRangoTotal(min: Double, max: Double) -> [Producto] {
        var productosEncontrados : [Producto] = []
        for producto in listaProductos {
            if producto.total >= min && producto.total <= max {
                productosEncontrados.append(producto)
            }
        }
        return productosEncontrados
    }
    
}

func vender(tienda: Tienda, ids: [Int]) {
    
    var total: Double = 0.0
    
    for id in ids {
        if let producto = tienda.buscarProducto(id: id) {
            if producto.hayExistencias {
                print("Se vendrá el producto [\(producto.descripcion)] $\(producto.total)")
                total += producto.total
            } else {
                print("No hay existencias del producto \(producto.descripcion)")
            }
        } else {
            print("No se encuentra el producto con id=\(id) en la tienda")
        }
    }
    
    print("Subtotal: $\(total)")
    print("IVA: $\(total * 0.16)")
    print("Total: $\(total * 1.16)")
    
}

let tienda = TiendaLibrosPlayeras()

if !tienda.agregar(producto: Libro(id: 1001, titulo: "Un mundo feliz", autor: "A. Huxley", año: 1924)) {
    print("no se puede agregrar 1001")
}
if !tienda.agregar(producto: Libro(id: 1002, titulo: "Las aventuras de Tom Sayer", autor: "Desconocido", año: 1975)) {
    print("no se puede agregrar 1002")
}
if !tienda.agregar(producto: Playera(id: 2001, tipo: .Unisex, color: .Roja)) {
    print("no se puede agregrar 2001")
}
if !tienda.agregar(producto: Playera(id: 2002, tipo: .Unisex, color: .Blanca)) {
    print("no se puede agregrar 2002")
}
if !tienda.agregar(producto: Playera(id: 2003, tipo: .Hombre, color: .Negra)) {
    print("no se puede agregrar 2003")
}
if !tienda.agregar(producto: Playera(id: 2004, tipo: .Mujer, color: .Azul)) {
    print("no se puede agregrar 2004")
}

vender(tienda: tienda, ids: [1001, 1002, 1002, 2001, 2004, 2004])
