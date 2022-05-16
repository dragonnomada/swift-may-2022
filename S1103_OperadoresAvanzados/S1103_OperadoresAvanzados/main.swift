//
//  main.swift
//  S1103_OperadoresAvanzados
//
//  Created by Dragon on 16/05/22.
//

import Foundation

let a: Int = 1
let b: Int = 2

let c: Int = a + b // Int (<a>+<b>)

struct Producto {
    
    var id: Int
    var nombre: String
    var precio: Double
    
}

let p1 = Producto(id: 123, nombre: "Coca Cola", precio: 18.5)
let p2 = Producto(id: 456, nombre: "Gansito", precio: 10.5)

extension Producto {
    
    static var gid: Int = 1000
    
    static func + (producto1: Producto, producto2: Producto) -> Producto {
        let producto = Producto(
            id: gid,
            nombre: "Paquete: \(producto1.nombre) + \(producto2.nombre)",
            precio: (producto1.precio + producto2.precio) * 0.90)
        gid += 1
        return producto
    }
    
}

print(p1)
print(p2)

let p3 = p1 + p2 // <operando 1> + <operando 2>

print(p3)

let p4 = p3 + p2 // <operando 1> + <operando 2>

print(p4)

extension Producto {
    
    static func == (producto1: Producto, producto2: Producto) -> Bool {
        return producto1.id == producto2.id
    }
    
}

let pA = Producto(id: 1, nombre: "A", precio: 1)
let pB = Producto(id: 1, nombre: "B", precio: 2)

if pA == pB {
    print("Los productos tienen el mismo id")
} else {
    print("Los productos son diferentes")
}

// Operador Prefix -

extension Producto {
    
    static prefix func - (producto: Producto) -> Producto {
        return Producto(id: producto.id, nombre: producto.nombre, precio: -producto.precio)
    }
    
}

let pX = Producto(id: 3333, nombre: "X", precio: 3333)

print(-pX)

prefix operator ++ // ++<operando>

extension Producto {
    static prefix func ++ (producto: Producto) -> Producto {
        return Producto(id: producto.id, nombre: producto.nombre, precio: producto.precio * 1.16)
    }
}

print(p1)
print(++p1)

prefix operator **

extension Producto {
    static prefix func ** (producto: Producto) -> Double {
        return producto.precio
    }
}

print(**p1)

let total = **p1 + **p2 + **pA

print(total)

prefix operator <<

extension Producto {
    static prefix func << (producto: Producto) -> (id: Int, nombre: String, precio: Double) {
        return (producto.id, producto.nombre, producto.precio)
    }
}

let (id1, nombre1, precio1) = <<p1

print(id1, nombre1, precio1)

infix operator <<

extension Producto {
    static func << (producto: Producto, precio: Double) -> Producto {
        return Producto(id: producto.id, nombre: producto.nombre, precio: producto.precio + precio)
    }
}

print(p1 << 100)

extension Producto {
    static func < (producto: Producto, precio: Double) -> Bool {
        return producto.precio < precio
    }
    static func <= (producto: Producto, precio: Double) -> Bool {
        return producto.precio <= precio
    }
}

if p1 < 20 {
    print("El producto \(p1.nombre) cuesta menos de $20")
} else {
    print("El producto \(p1.nombre) cuesta $20 o más")
}
