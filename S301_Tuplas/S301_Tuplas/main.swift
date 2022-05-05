//
//  main.swift
//  S301_Tuplas
//
//  Created by Dragon on 04/05/22.
//

import Foundation

/*
 
 TUPLAS
 
 Se utilizan para retener distintos datos en una misma variable.
 
 Posee un mecanismo de acoplamiento mediante los paréntesis
 y un mecanismo de desacoplamiento mediante los paréntesis.
 
 ACOPLAR: <k-tupla> = (<valor 1>, <valor 2>, ..., <valor k>)
 
 DESACOPLAR: (<variable 1>, <variable 2>, ..., <variable k>) = <k-tupla>
 
 TUPLAS NOMBRADAS
 
 Cada valor en la tupla puede poseer un nombre externo
 para poder acceder  al valor a través de ese nombre.
 
 SINTAXIS: var/let <nombre> : (<nombre 1>: <tipo 1>, ..., <nombre k>: <tipo k>) =
 
 */

// Acoplamiento
let t = (123, 15, 45.98) // : (Int, Int, Double)

print(type(of: t))

print(t)

print(t.0) // 123
print(t.1) // 15
print(t.2) // 45.98

// Desacoplamiento
let (id, existencias, precio) = t //(123, 15, 45.98)

print("ID: \(id) E: \(existencias) P: $\(precio)")

let s : (String, Int, Double, Double) = ("Ana", 19, 1.58, 54.6)

print(s)

let (nombre, edad, estatura, peso) = s
print("\(nombre), \(edad) años [\(estatura) m / \(peso) kg]")

let tp = (id: 123, existencias: 15, precio: 45.98)

print(type(of: tp))

print(tp)

print(tp.id) // 123
print(tp.existencias) // 15
print(tp.precio) // 45.98
