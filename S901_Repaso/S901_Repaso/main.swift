//
//  main.swift
//  S901_Repaso
//
//  Created by Dragon on 12/05/22.
//

import Foundation

enum TipoPaquete {
    
    case Personal
    case Empresarial
    case ExpressPersonal
    case ExpressEmpresarial
    
    // TipoPaquete.<caso>.costo -> Double
    var costo: Double { // self -> Double in
        // self: TipoPaquete ~ .Personal | .Empresarial | ...
        switch self {
        case .Personal:
            return 9.99
        case .Empresarial:
            return 14.99
        case .ExpressPersonal:
            return 12.99
        case .ExpressEmpresarial:
            return 17.99
        }
    }
    
    var costoMasIva: Double { // self -> Double in
        return self.costo * 1.16
    }
    
}

struct Paquete {
    
    var id: Int
    var guia: String
    
    // <paquete: Paquete>.zona -> (Double, Double)
    var zona: (lat: Double, lon: Double) { // self -> (Double, Double)
        // self: Paquete ~ Paquete(id: ..., guia: "...")
        switch self.guia {
        case let g where g.hasPrefix("84"): return (98, -116)
        case let g where g.hasPrefix("16"): return (99, 112)
        default: return (55, 99)
        }
    }
    
}

/*
 
 PROPIEDADES VIRTUALES ~ ACCESORES (Getters | Setters)
 
 Una propiedad virtual es similar a una propiedad computada
 salvo que la propiedad computada funciona como un único getter.
 
 La propiedad virtual se comporta como una doble definición computada
 para cuándo se requiere el valor de vuelta de la propiedad computada ´get´
 y cuando se desea un mecanismo de ajuste para los valores asociados a la
 propiedad computada.
 
 Entonces, podemos ver una propiedad virtual como una propiedad
 doblemente computada { get set }.
 
 SINTAXIS:
 
 // PROPIEDAD COMPUTADA
 var <propiedad>: <tipo> { self -> <tipo> }
 
 // PROPIEDAD VIRTUAL (ACCESOR)
 
 // GETTER (SOLO LECTURA) ~ PROPIEDAD COMPUTADA
 var <propiedad getter>: <tipo> { get { self -> <tipo> } }
 
 // GETTER+SETTER (LECTURA + ESCRITURA) ~ PROPIEDAD COMPUTADA
 var <propiedad accesor>: <tipo> {
    get { self -> <tipo> }
    set(<valor>) { self <- <valor> }
 }
 
 EJEMPLO:
 
 struct Producto {
 
    var nombre: String
    var precio: Double
 
    var precioMasIva: Double { get { return self.precio * 1.16 } }
    // ~~~ var precioMasIva: Double { return self.precio * 1.16 }
 
    var asTuple: (nombre: String, precio: Double) {
        get { return (self.nombre, self.precio) }
        set(nuevoProducto) { // nuevoProducto: (nombre: String, precio: Double)
            self.nombre = nuevoProducto.nombre
            self.precio = nuevoProducto.precio
        }
    }
 
 }
 
 let producto = Producto(nombre: "Coca Cola", precio: 18.5)
 
 let (nombre, precio) = producto.asTuple // (nombre: "Coca Cola", precio: 18.5)
 
 producto.asTuple = ("Gansito", 10.5)
 
 */

struct Producto {

   var nombre: String
   var precio: Double

   var precioMasIva: Double { get { return self.precio * 1.16 } }
   // ~~~ var precioMasIva: Double { return self.precio * 1.16 }

   var asTuple: (nombre: String, precio: Double) {
       get {
           return (self.nombre, self.precio)
       }
       set(nuevoProducto) { // nuevoProducto: (nombre: String, precio: Double)
           self.nombre = nuevoProducto.nombre
           self.precio = nuevoProducto.precio
       }
   }

}

var producto = Producto(nombre: "Coca Cola", precio: 18.5)

print(producto) // nombre: "Coca Cola", precio: 18.5

// get
let (nombre, precio) = producto.asTuple // (nombre: "Coca Cola", precio: 18.5)

// get
print(producto.asTuple.nombre) // "Coca Cola"

print("Nombre: \(nombre) Precio: $\(precio)")

producto.asTuple = ("Gansito", 10.5)

print(producto) // nombre: "Gansito", precio: 10.5

// set(get(producto.asTuple).nombre = "Galletas Marías")
// set(get(producto.asTuple).precio = get(producto.asTuple.precio))
producto.asTuple.nombre = "Galletas Marías" // set producto.asTuple.precio = get producto.asTuple.precio

print(producto)

class EnvioPaquete {
    
    var paquete: Paquete = Paquete(id: 0, guia: "000000000000")
    
    var id: Int {
        get { // self -> Int
            return self.paquete.id
        }
        set(id) {
            self.paquete.id = id
        }
    }
    // set ~ set(newValue)
    
}

class RegistroPaquete {
    
    var _paquete: Paquete?
    
    var paquete: Paquete? {
        get { // self -> Paquete?
            return self._paquete
        }
        set(paquete) {
            self._paquete = paquete
        }
    }
    
}

struct Libro {
    
    var id: Int
    var titulo: String
    var autor: String
    var año: Int
    
}

protocol PaqueteConvertible {
    
    // Propiedad Virtual { get }
    var asPaquete: Paquete { get }
    
}

extension Libro: PaqueteConvertible {
    
    var asPaquete: Paquete {
        get { return Paquete(id: self.id, guia: "\(abs(self.titulo.hashValue))-\(abs(self.autor.hashValue))-\(abs(self.año.hashValue))") }
    }
    
}

let libro = Libro(id: 1003, titulo: "¿Cómo ser millonario?", autor: "Riquillo", año: 2003)

print(libro.asPaquete)

let otroLibro = Libro(id: 1004, titulo: "¿Cómo ser millonario?", autor: "Riquillo", año: 2005)

print(otroLibro.asPaquete)

func enviarPaquete(paqueteConvertible: PaqueteConvertible, direccion: String) {
    let paquete: Paquete = paqueteConvertible.asPaquete
    print("Enviando el paquete \(paquete.zona) a \(direccion)")
}

enviarPaquete(paqueteConvertible: libro, direccion: "Av. Rojo Gómez 123")

enviarPaquete(paqueteConvertible: otroLibro, direccion: "Av. Rojo Gómez 456")
