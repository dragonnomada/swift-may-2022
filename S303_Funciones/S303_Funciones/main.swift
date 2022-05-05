//
//  main.swift
//  S303_Funciones
//
//  Created by Dragon on 04/05/22.
//

import Foundation

/*
 
 FUNCIONES
 
 Una función es un mecanismo para ejecutar un bloque
 usando parámetros en la llamada a la ejecución
 y extrayendo del bloque un retorno para devolverlo
 como resultado de la ejecución.
 
 Esto nos permite abstraer código, hacerlo reutilizable
 y poder resolver tareas de forma más eficiente y natural.
 
 SINTAXIS: func <nombre>(<parámetros ...>) -> <tipo retorno> { <bloque> }
 
 <parámetro> ~ <nombre>: <tipo>
 
 En el parámetro normal, el nombre externo equivale al interno
 
 PARÁMETROS NOMBRADOS
 
 <parámetro> ~ <nombre externo> <nombre interno>: <tipo>
 
 En el parámetro nombrado, el nombre externo difiere al interno
 
 PARÁMETROS IMPLÍCITOS (NO-NOMBRADOS)
 
 <parámetro> ~ _ <nombre interno>: <tipo>
 
 En el parámetro implícito (no-nombrado), el nombre externo es suprimido
 
 */

func suma(a: Int, b: Int) -> Int {
    return a + b
}

let c : Int = suma(a: 4, b: 5)

print("4 + 5 = \(c)")

func suma2(valor1 a: Int, valor2 b: Int) -> Int {
    return (a + b) * (a + b)
}

let d : Int = suma2(valor1: 4, valor2: 5)

print("(4 + 5)^2 = \(d)")

func suma3(_ a: Int, _ b: Int) -> Int {
    return (a + b) * (a + b) * (a + b)
}

let e : Int = suma3(4, 5)

print("(4 + 5)^3 = \(e)")
