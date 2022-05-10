//
//  main.swift
//  E703_ListaContactos
//
//  Created by Dragon on 10/05/22.
//

import Foundation

struct Contacto : CustomStringConvertible {
    
    var grupo: Int
    var nombre: String
    var correo: String
    var telefono: String
    
    public var description: String {
        return "[\(grupo)] \(nombre) <\(correo)> (\(telefono))"
    }
    
}

class ListaContactos {
    
    var contactos : [Contacto] = []
    
    func agregar(contacto: Contacto) {
        contactos.append(contacto)
    }
    
    func agregar(nombre: String, correo: String, telefono: String) {
        contactos.append(Contacto(grupo: 0, nombre: nombre, correo: correo, telefono: telefono))
    }
    
    subscript(indice: Int) -> Contacto? {
        if indice < 0 || indice >= contactos.count {
            return nil
        }
        
        return contactos[indice]
    }
    
    subscript(correo: String) -> Contacto? {
        for contacto in contactos {
            if contacto.correo == correo {
                return contacto
            }
        }
        return nil
    }
    
    subscript(grupo: Int, telefono: String) -> [Contacto] {
        var contactosEncontrados : [Contacto] = []
        
        for contacto in contactos {
            if contacto.grupo == grupo && contacto.telefono == telefono {
                contactosEncontrados.append(contacto)
            }
        }
        
        return contactosEncontrados
    }
    
}

let listaContactos = ListaContactos()

listaContactos.agregar(contacto: Contacto(grupo: 1, nombre: "Pepe", correo: "pepe@gmail.com", telefono: "5512345678"))

listaContactos.agregar(nombre: "Ana", correo: "ana@gmail.com", telefono: "5512345678")
listaContactos.agregar(nombre: "Fanny", correo: "fanny@gmail.com", telefono: "5512345678")

print(listaContactos[0]!)
print(listaContactos[1]!)
print(listaContactos["pepe@gmail.com"]!)
print(listaContactos["ana@gmail.com"]!)
print(listaContactos[1, "5512345678"])
print(listaContactos[0, "5512345678"])
