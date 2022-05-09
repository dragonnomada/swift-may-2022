//
//  main.swift
//  S606_Subscripts
//
//  Created by Dragon on 09/05/22.
//

import Foundation

/*
 
 SUBSCRIPTS
 
 Los subscripts o accesores nos permiten definir una función de acceso
 a valores de una clase o estructura, mediante los corchetes [...]
 
 Es decir, podemos hacer que una clase o estructura accedan a sus valores
 mediante los corchetes y un tipo de datos. Y se comporten como si fueran
 un arreglo.
 
 SINTAXIS:
 
 class <nombre> {
 
    subscript(<índice 1>: <tipo 1>, ...) -> <tipo> {
        // TODO: generar el <tipo> devuelto para los índices
    }
 
 }
 
 EJEMPLO:
 
 class AlmacenProductos {
 
    var productos : [Producto] = []
 
    subscript(index: Int) -> Producto {
 
        return producto.index(index)
 
    }
 
 }
 
 let almacen = AlmacenProductos()
 
 almacen[4] // -> productos.index(4)
 
 */

class Personas {
    
    var nombres : [String] = []
    var edades : [Int] = []
    
    func agregar(nombre: String, edad: Int) {
        nombres.append(nombre)
        edades.append(edad)
    }
    
    subscript(indice: Int) -> (nombre: String, edad: Int) {
        let nombre = nombres[indice]
        let edad = edades[indice]
        return (nombre, edad)
    }
    
    subscript(indiceA: Int, indiceB: Int) -> (nombreA: String, nombreB: String, min: Int, max: Int) {
        let (nombreA, edadA) = self[indiceA]
        let (nombreB, edadB) = self[indiceB]
        if edadA < edadB {
            return (nombreA, nombreB, edadA, edadB)
        } else {
            return (nombreA, nombreB, edadB, edadA)
        }
    }
    
    subscript(nombre: String) -> Int? {
        for i in 0..<nombres.count {
            if nombres[i] == nombre {
                return edades[i]
            }
        }
        return nil
    }
    
}

let asistentes = Personas()

asistentes.agregar(nombre: "Pepe", edad: 28)
asistentes.agregar(nombre: "Luis", edad: 17)
asistentes.agregar(nombre: "Ana", edad: 32)
asistentes.agregar(nombre: "Bety", edad: 44)

print(asistentes[0])
print(asistentes[1])
print(asistentes[2])
print(asistentes[3])

print(asistentes[3, 0])

if let edad = asistentes["Pepe"] {
    print(edad)
}

class Matrix {
    
    var valores : [Double] = []
    var tamaño : Int
    var filas : Int
    var columnas : Int
    
    init(rows: Int, columns: Int) {
        filas = rows
        columnas = columns
        tamaño = filas * columnas
        for _ in 0..<tamaño {
            valores.append(0)
        }
    }
    
    func get(i : Int, j : Int) -> Double {
        return valores[i * columnas + j]
    }
    
    func set(i : Int, j : Int, valor: Double) {
        valores[i * columnas + j] = valor
    }
    
    func describir() {
        print("Matrix: \(filas)x\(columnas)")
        for i in 0..<filas {
            for j in 0..<columnas {
                let valor = valores[i * columnas + j]
                print("\(valor) ", terminator: "")
            }
            print()
        }
        print()
    }
    
}

let m1 = Matrix(rows: 4, columns: 4)

m1.describir()

m1.set(i: 2, j: 2, valor: 1)

m1.describir()

print(m1.get(i: 2, j: 2))

class Matriz {
    
    var valores : [Double] = []
    var tamaño : Int
    var filas : Int
    var columnas : Int
    
    init(rows: Int, columns: Int) {
        filas = rows
        columnas = columns
        tamaño = filas * columnas
        for _ in 0..<tamaño {
            valores.append(0)
        }
    }
    
    subscript(i : Int, j : Int) -> Double {
        get {
            return valores[i * columnas + j]
        }
        set(valor) {
            valores[i * columnas + j] = valor
        }
    }
    
    func describir() {
        print("Matriz: \(filas)x\(columnas)")
        for i in 0..<filas {
            for j in 0..<columnas {
                let valor = self[i, j]
                print("\(valor) ", terminator: "")
            }
            print()
        }
        print()
    }
    
}

let m2 = Matriz(rows: 6, columns: 8)

m2.describir()

m2[2, 2] = 1
m2[5, 3] = 2

m2.describir()

print(m2[1, 1])
print(m2[2, 2])
print(m2[5, 3])
