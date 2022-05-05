//
//  main.swift
//  S202_Arreglos
//
//  Created by Dragon on 03/05/22.
//

import Foundation

/*
 
 ARREGLOS
 
 Los arreglos son valores repetidos que pueden ser accedidos
 por una misma variable.
 
 Todos los valores deben ser del mismo tipo y el tipo pude ser inferenciado
 en la primera asignación.
 
 SINTAXIS: <variable> : [<tipo>] = [<valores> ...]
 
 Los arreglos tipo ´let´no se pueden modificar.
 
 Los arreglos tipo ´var´ pueden cambiar:
 
 append(<nuevo elemento>)
 insert(<valor>, at: <index>)
 remove(at: <index>)
 
 */

var numeros : [Double] = []

let edades = [23, 45, 65, 12, 17] // edades : [Int]

var frutas = ["manzana", "mango", "pera", "kiwi"] // frutas : [String]

// <array>.append(<valor>) - Agrega un valor al final

print(numeros) // []

numeros.append(1.7)
numeros.append(2.4)

print(numeros) // [1.7, 2.4]

print(edades) // [23, 45, 65, 12, 17]

// edades.append(89) // ERROR: Las edades son inmutables (constante/let)

print(frutas) // ["manzana", "mango", "pera", "kiwi"]

frutas.append("melón")

print(frutas) // ["manzana", "mango", "pera", "kiwi", "melón"]

// <array>.insert(<valor>, at: <index>)

numeros.insert(123.456, at: 1)

print(numeros) // [1.7, 123.456, 2.4]

// <array>.remove(at: <index>)

frutas.remove(at: 2)

print(frutas) // ["manzana", "mango", "kiwi", "melón"]
