//
//  main.swift
//  S1105_MemoriaSegura
//
//  Created by Dragon on 16/05/22.
//

import Foundation

func incrementa(a: Int, b: Int) -> Int {
    // a += b // ERROR: ´a´ no es modificable
    return a + b
}

print(incrementa(a: 12, b: 4)) // 16

let x: Int = 12

print(incrementa(a: x, b: 8)) // x -> a = 12 + 4 -> 20

func agrega(a: inout Int, b: Int) {
    a += b
}

// agrega(a: 12, b: 4) // ERROR: 12 no es modificable

let y: Int = 0

// agrega(a: y, b: 100) // ERROR: ´y´ no pasa como inout (se requiere su referencia)

// agrega(a: &y, b: 100) // ERROR: ´y´ es inmutable

var z: Int = -1

var z_copia = z

agrega(a: &z_copia, b: 2) // CORRECTO: &z la referencia de z, pasa como inout

print(z)

print(z_copia)
