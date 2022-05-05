//
//  main.swift
//  S304_UsoFunciones
//
//  Created by Dragon on 04/05/22.
//

import Foundation

func sumaEnteros(_ numeros: [Int]) -> Int {
    var s = 0
    for entero in numeros {
        s += entero
    }
    return s
}

let edades = [23, 45, 17, 19, 66]

print(edades) // [23, 45, 17, 19, 66]
print(sumaEnteros(edades)) // 170

func sumaEnterosPares(_ numeros: [Int]) -> Int {
    var s = 0
    for entero in numeros {
        if entero % 2 == 0 {
            s += entero
        }
    }
    return s
}

print(edades) // [23, 45, 17, 19, 66]
print(sumaEnterosPares(edades)) // 66

func sumaEnterosParOImpar(_ numeros: [Int], conPares esPar: Bool) -> Int {
    var s = 0
    for entero in numeros {
        if esPar {
            if entero % 2 == 0 {
                s += entero
            }
        } else {
            if entero % 2 == 1 {
                s += entero
            }
        }
    }
    return s
}

print(edades) // [23, 45, 17, 19, 66]
print(sumaEnterosParOImpar(edades, conPares: false)) // 104

func sumaEnterosConRestriccion(_ numeros: [Int], soloMenores20 menores20: Bool = true) -> Int {
    var s = 0
    for entero in numeros {
        if menores20 {
            if (entero <= 20) {
                s += entero
            }
        } else {
            s += entero
        }
    }
    return s
}

print(edades) // [23, 45, 17, 19, 66]
print(sumaEnterosConRestriccion(edades)) // menores20 = true (36)

print(edades) // [23, 45, 17, 19, 66]
print(sumaEnterosConRestriccion(edades, soloMenores20: false)) // menores20 = false (170)
