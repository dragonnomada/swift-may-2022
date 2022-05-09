//
//  main.swift
//  S605_Enumeraciones
//
//  Created by Dragon on 09/05/22.
//

import Foundation

/*
 
 ENUMERACIONES
 
 Cuándo nosotros creamos una variable de algún tipo de dato
 esta puede tomar algún valor posible en todos los posibles valores del tipo de dato.
 
 Si deseamos que los valores sean exactamente los que nosotros esperamos, entonces
 podemos crear una restricción de valores numerados llamados la Enumeración.
 
 Una enumeración nos permite definir los casos posibles que tomará un valor asociado
 a la enumeración.
 
 SINTAXIS:
 
 enum <nombre> {
    case <definición 1>
    case <definición 2>
    ...
    case <definición n>
 }
 
 EJEMPLO:
 
 enum SimboloPoquer {
    case Pica
    case Trebol
    case Corazon
    case Diamante
 }
 
 enum ValorPoquer {
    case As
    case 2
    case 3
    case 4
    case 5
    case 6
    case 7
    case 8
    case 9
    case Joquer
    case Dama
    case Rey
 }
 
 enum ColorPoquer {
    case Rojo
    case Negro
 }
 
 // Enumeración Tupla
 enum CartaPoquer {
    case carta(SimboloPoquer, ValorPoquer, ColorPoquer)
 }
 
 SINTAXIS: Enumeraciones con Valor Asociado
 
 enum <nombre> : <tipo> {
 
    case <definición k> = <valor k>
 
 }
 
 */

enum HTTPStatus : Int {
    case Ok = 200
    case NotModfied = 304
    case BadRequest = 400
    case Unathorized = 401
    case Forbidden = 403
    case NotFound = 404
    case InternalServerError = 500
    case NotImplemented = 501
}

print(HTTPStatus.InternalServerError) // .InternalServerError (500)
print(HTTPStatus.InternalServerError.rawValue) // 500

let status1 : HTTPStatus = HTTPStatus.Ok

let status2 : HTTPStatus = .BadRequest

if let status3 = HTTPStatus(rawValue: 404) {
    print("Estatus encontrado \(status3) (\(status3.rawValue))")
} else {
    print("No existe el estatus 404")
}

if let status4 = HTTPStatus(rawValue: 123) {
    print("Estatus encontrado \(status4) (\(status4.rawValue))")
} else {
    print("No existe el estatus 123")
}

enum DireccionCardinal : Character {
    case Norte = "N"
    case Sur = "S"
    case Este = "E"
    case Oeste = "O"
}

let d1 = DireccionCardinal.Norte
let d2 : DireccionCardinal = .Sur
let d3 = DireccionCardinal(rawValue: "E")! // forzado

print("Ingresa una dirección cardinal [N, S, E, O]: ", terminator: "")
if let respuesta = readLine() {
    if let d = DireccionCardinal(rawValue: respuesta[respuesta.index(respuesta.startIndex, offsetBy: 0)]) {
        print("\(d) (\(d.rawValue))")
        switch d {
        case .Norte:
            print("Mover arriba")
            break
        case .Sur:
            print("Mover abajo")
            break
        case .Este:
            print("Mover Derecha")
            break
        case .Oeste:
            print("Mover izquierda")
            break
        }
    } else {
        print("La dirección cardinal no es válida")
    }
}

/*
 
 ENUMERACIONES TUPLA
 
 Cuándo queramos crear un prototipo que nos enumere tuplas distintas
 podemos crear una enumeración de tuplas para retener distintos valores.
 
 SINTAXIS:
 
 enum <nombre> {
    case <definición k>(<tipo 1>, <tipo 2>, ..., <tipo m>)
 }
 
 EJEMPLO:
 
 enum Mensaje {
    
    case correcto(String)
    case fallo(String, String, Int)
    case info(String, String)
 
 }
 
 let mensaje1 = Mensaje.correcto("Todo bien")
 let mensaje2 = Mensaje.fallo("Hubio un error", "Falló la petición", 2001)
 let mensaje3 = Mensaje.info("Casi bien", "Sin embargo, un dato podría estar corrupto")
 
 */

struct Empresa {
    
    var nombre: String
    var direccion : String
    
}

struct Cliente {
    
    var nombre: String
    var direccion : String
    var correo : String
    
}

enum Paquete {
    
    case Tradicional(String, String)
    case Empresarial(String, Empresa)
    case Delivery(String, Int, Cliente)
    
}

let p1 : Paquete = .Tradicional("1234", "712345")
let p2 : Paquete = .Empresarial("2345", Empresa(nombre: "Pepe's y Asociados", direccion: "Av. Churubusco 123"))
let p3 : Paquete = .Delivery("4567", 21, Cliente(nombre: "Pepe", direccion: "Av. Rio Bravo 456", correo: "pepe@gmail.com"))

print("Selecciona el tipo de paquete:")
print("1. Paquete tradicional")
print("2. Paquete empresarial")
print("3. Paquete delivery")

print("Opción: ", terminator: "")

var paquete : Paquete? = nil

if let respuesta = readLine() {
    if let opcion = Int(respuesta) {
        
        switch opcion {
        case 1:
            paquete = .Tradicional("GUIA FAKE", "CÓDIGO FAKE")
            break
        case 2:
            paquete = .Empresarial("GUIA FAKE", Empresa(nombre: "NOMBRE FAKE", direccion: "DIRECCIÓN FAKE"))
            break
        case 3:
            paquete = .Delivery("GUIA FAKE", 123, Cliente(nombre: "NOMBRE FAKE", direccion: "DIRECCIÓN FAKE", correo: "CORREO FAKE"))
            break
        default:
            paquete = nil
        }
        
    }
}

if let paquetePorEnviar = paquete {
    
    switch paquetePorEnviar {
    case .Tradicional(let guia, let codigoBarras):
        print("Se enviará un paquete tradiacional con guia \(guia) y código de barras: \(codigoBarras)")
    case .Empresarial(let guia, let empresa):
        print("Se enviará un paquete empresarial con guia \(guia) a la empresa \(empresa.nombre)")
    case .Delivery(let guia, let pedido, let cliente):
        print("Se enviará un paquete delivery con guia \(guia) y pedido \(pedido) al cliente \(cliente.correo)")
    }
    
}
