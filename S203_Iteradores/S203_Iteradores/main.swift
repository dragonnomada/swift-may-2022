//
//  main.swift
//  S203_Iteradores
//
//  Created by Dragon on 03/05/22.
//

import Foundation

/*
 ITERADORES
 
 Un iterador nos permitirá recorrer los valores de una secuencia.
 
 SINTAXIS: for <elemento> in <secuencia> { <bloque> }
 
 Si quisieramos recorrer valores en un rango, podríamos utilizar los rangos literales o explícitos:
 
 ´inicial´...´final´ - Rango absoluto (inclusive el final)
 ´inicial´..<´final´ - Rango parcial (excluye el final)
 */

for i in 1...5 {
    print(i)
}

let edades = [45, 17, 24, 33, 65]

var s = 0

for edad in edades {
    print("La edad es \(edad) años")
    s += edad
}

print("La suma de las edades es \(s)")

for x in stride(from: 2, to: 20, by: 2) { // Excluye a 20
    print("x: \(x)")
}

for x in stride(from: 2, through: 20, by: 2) { // Incluye a 20
    print("x: \(x)")
}
