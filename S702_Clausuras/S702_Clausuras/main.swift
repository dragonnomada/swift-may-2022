//
//  main.swift
//  S702_Clausuras
//
//  Created by Dragon on 10/05/22.
//

import Foundation

func suma(_ a: Int, _ b: Int) -> Int { // Signatura: (Int, Int) -> Int
    let c = a + b
    return c
}

print(suma(1, 2))

let s : ((Int, Int) -> Int) = { // Signatura: (Int, Int) -> Int
    (a: Int, b: Int) -> Int in
    let c = a + b
    return c
}

func calculadora(_ a: Int, _ b: Int, operador: ((Int, Int) -> Int)) {
    
    let resultado = operador(a, b)
    
    print("Resultado(\(a), \(b)): \(resultado)")
    
}

calculadora(1, 3, operador: suma)

calculadora(5, 6, operador: s)

calculadora(10, 20, operador: {
    (a: Int, b: Int) -> Int in
    let r = a * b
    return r
})

calculadora(34, 17, operador: {(a: Int, b: Int) -> Int in return a - b})

calculadora(4, 9, operador: {(a: Int, b: Int) -> Int in (a + b) * (a - b)})

calculadora(5, 5, operador: {a, b in a / b})

calculadora(13, 4, operador: { $0 * $1 })

calculadora(13, 4) { a, b in a % b }

func hacerTarea(url: String, done: ((Int) -> Void)) {
    print("Descargando el archivo desde \(url)")
    print("...")
    
    let resultado = Date().hashValue % 10
    
    done(resultado)
}

hacerTarea(url: "http://google.com/fake") { code in
    print("La tarea ha finalizado con el código: \(code)")
    
    hacerTarea(url: "http://myserver.com/fake/2") { status in
        print("Se completó la segunda tarea con estatus: \(status)")
        
        // TODO: Continuar haciendo tareas si salen bien
    }
}

func descargarImagen(url: String, done: (() -> Void), error: ((String) -> Void)) {
    print("Descargando la imagen desde \(url)")

    let fallo = Date().hashValue % 2
    
    if fallo == 0{
        done()
    } else {
        let status = Date().hashValue % 10
        error("Falló la descarga con codigo: \(status)")
    }
}

descargarImagen(url: "http://placehold.it/200x200") {
    print("CORRECTO")
} error: { mensaje in
    print("ERROR: \(mensaje)")
}
