//
//  main.swift
//  S501_FuncionesEnFunciones
//
//  Created by Dragon on 06/05/22.
//

import Foundation

// Cómo hace la pregunta (reutilizable)
func hacerUnaPregunta(pregunta: String) -> String? {
    print("\(pregunta) ", terminator: "")
    
    if let respuesta = readLine() {
        return respuesta
    }
    
    return nil
}

// Cómo controla la respuesta (no-reutilizable)
if let nombre = hacerUnaPregunta(pregunta: "¿Cómo te llamas?") { // nombre : String <- String?
    print("Tú te llamas \(nombre), tienes \(nombre.count) caracteres")
} else {
    print("No pude obtener la respuesta :(")
}

// if <condición> { <bloque> }

// if let <no-opcional> = <opcional> { <bloque> } // Desengrapar

func manejarRespuestaComoTeLlamas() {
    if let nombre = hacerUnaPregunta(pregunta: "¿Cómo te llamas?") { // nombre : String <- String?
        print("Tú te llamas \(nombre), tienes \(nombre.count) caracteres")
    } else {
        print("No pude obtener la respuesta :(")
    }
}

// Delegamiento de Código -> función depende de otra función para procesar los resultados

func manejarRespuesta(pregunta: String, queHacerConLaRespuesta: ((String) -> Void)) {
    if let respuesta = hacerUnaPregunta(pregunta: pregunta) {
        // Delegamiento de Código
        queHacerConLaRespuesta(respuesta) // Delegamos la funcionalidad
    } else {
        print("No pude obtener una respuesta a esa pregunta :(")
    }
}

func saludar(mensaje: String) { // (String) -> Void
    print("Hola \(mensaje)")
}

func despedirse(mensajeDespedida: String) { // (String) -> Void
    print("Adiós \(mensajeDespedida)")
}

manejarRespuesta(pregunta: "¿Cómo te llamas?", queHacerConLaRespuesta: saludar)

manejarRespuesta(pregunta: "Me puedes recordar, ¿Cómo te llamabas?", queHacerConLaRespuesta: despedirse)


