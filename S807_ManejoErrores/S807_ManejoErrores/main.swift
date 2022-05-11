//
//  main.swift
//  S807_ManejoErrores
//
//  Created by Dragon on 11/05/22.
//

import Foundation

/*
 
 MENEJO DE ERRORES
 
 En una ejecución, por ejemplo, en un método o función es posible que detectemos
 partes del código que son propensas a fallar y no están advertidas.
 
 Por ejemplo, al socitarle un dato al usuario y suponer que nos devuelve correcto.
 
 let edad : Int = Int(readLine()!)!
 
 Para controlar el código propenso a fallar, podemos usar dos estrategias:
 
 1. PROPAGACIÓN: Consiste en propagar el error advirtiendo que nuestro código puede fallar
 
    func solicitarEdad() throws -> Int {
        print("Dame la edad: ", terminator: "")
        return Int(readLine()!)!
    }
 
 2. CONTROL: Consiste en utilizar do-catch, try?
 
    var edad: Int?
 
    do {
        edad = try solicitarEdad()
    } catch {
        edad = nil
    }
 
    // TODO: Continua sin error
 
    ---
 
    if let edad = try? solicitarEdad() {
        // TODO: Continua sin error
    } else {
        // TODO: Controlar el error
    }
 
 */

enum Accesorio: String {
    
    case Gorra = "GORRA"
    case Collar = "COLLAR"
    case Guante = "GUANTE"
    
}

func solitarAccesorioInseguro() -> Accesorio {
    
    print("Dame el accesorio: ", terminator: "")
    let accesorio = Accesorio(rawValue: readLine()!)!
    
    return accesorio
    
}

// print(solitarAccesorioInseguro())

enum AccesorioError: Error {
    case NoExiste
    case NoPuedeLeer
}

func solitarAccesorioSemiseguro() throws -> Accesorio {
    
    print("Dame el accesorio: ", terminator: "")
    
    if let line = readLine() {
        if let accesorio = Accesorio(rawValue: line) {
            return accesorio
        } else {
            throw AccesorioError.NoExiste
        }
    } else {
        throw AccesorioError.NoPuedeLeer
    }
    
}

do {
    print(try solitarAccesorioSemiseguro())
} catch {
    print("\(error)")
}

do {
    print(try solitarAccesorioSemiseguro())
} catch AccesorioError.NoExiste {
    print("El accesorio no existe")
} catch AccesorioError.NoPuedeLeer {
    print("No se puede leer el accesorio desde el usuario")
} catch {
    print("Error desconocido")
}

func test() {
    guard let accesorio = try? solitarAccesorioSemiseguro() else {
        return
    }

    print("El accesio si existe y es \(accesorio)")
}

test()
