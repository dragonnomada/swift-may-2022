//
//  main.swift
//  S801_Clausuras
//
//  Created by Dragon on 11/05/22.
//

import Foundation

/*
 
 CLAUSURAS
 
 Las clausuras son bloques ejecutables que forman la idea de función portable/consumible.
 
 La naturaleza de una clausura es poder establecer de forma casual lo que debería ocurrir
 dentro de una función. Evitando formalizar dicho código ya que se considerará eventual
 o deshechable. Es decir, una clausura es usada para controlar lo que una función controlaría
 pero de forma inmediata, sin tener que definir la función en algún lado y luego tener que usarla.
 
 Sus aplicaciones más próximas son en el uso de arreglos mediante los mapeos y filtros.
 
 Sin embargo, hay un sin fin de funciones que requieren otras funciones para delegar comportamientos.
 
 Por ejemplo, una función que depende otra para continuar un proceso o determinar partes del proceso.
 
 SINTAXIS:
 
 { (<parámetros ...>) -> <tipo retorno> in <bloque> }
 
 Donde el <bloque> contiene el valor de retorno si no es Void
 
 EJEMPLO:
 
 { (x: Double, y: Double) -> Double in let z : Double = x * x + y * y; return z }
 
 ---
 
 {
    (x: Double, y: Double) -> Double in
 
    let z : Double = x * x + y * y
 
    return z
 }
 
 ---
 
 Las clausuras equivalen a definir funciones, sólo que las clausuras no tienen nombre,
 podemos verlas como funciones anónimas o expresiones lambda.
 
 func calcularZ(x: Double, y: Double) -> Double {
    let z : Double = x * x + y * y
 
    return z
 }
 
 Las clausuras pueden sustituir a funciones para realizar procesos en línea de código
 en lugar de separar los procesos en funciones formales.
 
 func afterDownload(status: Int, result: Result) -> Bool {
    print("Ya se descargó el archivo \(result) con estatus \(status)")
    return true
 }
 
 download(url: "http://...", done: afterDownload)
 
 ---
 
 download(url: "http://...", done: {
    (status: Int, result: Result) -> Bool in
    print("Ya se descargó el archivo \(result) con estatus \(status)")
    return true
 })
 
 Las clausuras pueden ser sintetizadas cada vez según la información que swift puede intuir.
 
 1. Omitir los tipos de datos en los parámetros
 
 download(url: "http://...", done: {
    (status, result) in
    print("Ya se descargó el archivo \(result) con estatus \(status)")
    return true
 })
 
 2. Omitir los paréntesis en los parámetros
 
 download(url: "http://...", done: {
    status, result in
    print("Ya se descargó el archivo \(result) con estatus \(status)")
    return true
 })
 
 3. Omitir el return cuándo el bloque sólo consta del return
 
 download(url: "http://...", done: {
    status, result in status == 200
 })
 
 ---
 
 download(url: "http://...", done: { status, result in status == 200 })
 
 4. Omitir los nombre de los parámetros y el ´in´
 
 // status -> $0
 // result -> $1
 
 download(url: "http://...", done: { $0 == 200 })
 
 ---
 
 task(api: "http://...", reject: { $0 > 25 })
 
 Las clauras pueden  externase de la función (estar fuera de los parámetros).
 Significa que si un parámetro es una clausura lo podemos externar (omitiendo el parámetro interno).
 
 // INTERNO
 download(url: "http://...", done: {
    status, result in status == 200
 })
 
 // EXTERNO
 download(url: "http://...") {
    status, result in status == 200
 }
 
 Nuestras funciones ahora parecen estructuras de control como un if, for, while, repeat, etc.
 
 task(api: "http://...") {
    // TODO: SUCCESS
 } error: {
    // TODO: FAIL
 } reject: { $0 != 200 }
 
 */

func filtrarArreglo(elementos: [Int], filtro: ((Int) -> Bool)) -> [Int] {
    var elementosFiltrados : [Int] = []
    
    for elemento in elementos {
        if filtro(elemento) {
            elementosFiltrados.append(elemento)
        }
    }
    
    return elementosFiltrados
}

func esPar(elemento: Int) -> Bool {
    if elemento % 2 == 0 {
        return true
    } else {
        return false
    }
}

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5], filtro: esPar))

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5], filtro: {
    (elemento: Int) -> Bool in
    if elemento % 2 == 0 {
        return true
    } else {
        return false
    }
}))

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5], filtro: {
    (elemento) in
    if elemento % 2 == 0 {
        return true
    } else {
        return false
    }
}))

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5], filtro: {
    elemento in
    if elemento % 2 == 0 {
        return true
    } else {
        return false
    }
}))

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5], filtro: { elemento in elemento % 2 == 0 }))

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5], filtro: { $0 % 2 == 0 }))

print(filtrarArreglo(elementos: [1, 2, 3, 4, 5]) { $0 % 2 == 0 })

print([1, 2, 3, 4, 5].min(by: { $0 < $1 })!)

print([("Pepe", 33), ("Paco", 17), ("Luis", 25)].min(by: { $0.1 < $1.1 })!)

/*
 
 {
    (elemento1: (String, Int), elemento2: (String, Int)) -> Bool in
    let (nombre1, edad1) = elemento1
    let (nombre2, edad2) = elemento2
    return edad1 < edad2
 }
 
 {
    (elemento1, elemento2) in
    let (nombre1, edad1) = elemento1
    let (nombre2, edad2) = elemento2
    return edad1 < edad2
 }
 
 {
    elemento1, elemento2 in
    let (nombre1, edad1) = elemento1
    let (nombre2, edad2) = elemento2
    return edad1 < edad2
 }
 
 {
    elemento1, elemento2 in
    return elemento1.1 < elemento2.1
 }
 
 { elemento1, elemento2 in elemento1.1 < elemento2.1 }
 
 { $0.1 < $1.1 }
 
 */
