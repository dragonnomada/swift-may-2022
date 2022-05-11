//
//  main.swift
//  S805_Protocolos
//
//  Created by Dragon on 11/05/22.
//

import Foundation

/*
 
 PROTOCOLOS
 
 Los protocolos son definiciones de requerimientos a nivel clase o estructura
 que permiten definir propiedades computadas requeridas, inicializadores o métodos
 que deben satisfacerse.
 
 Si una estructura o clase poseerá en general ciertos atributos y métodos
 podemos separarlos de una implementación y manipular sólo los resultados
 del protipo generado. Es decir, si definimos un protocolo que satisfaga ciertos
 requerimientos, podemos implementar dichas definiciones en código fino (implementación real)
 para poder crear estereotipos que funcionen de manera coherente, sin perder detalle en las definiciones.
 
 Podemos pensar un protocolo como el esqueleto que tendrán las clases o estructuras similares
 pero cada una con diferente implementación.
 
 Por ejemplo, si un protocolo define un método para guardar o recuperar información
 entonces una clase podría determinar la mejor manera para guardar o recuperar la información
 y otra clase podría determinar otra implementación para hacer algo similar. Sin embargo,
 podríamos garantizar que ambas clases aunque tengan distintas implementaciones, tendrán
 el mismo método (el guardar o el de recuperar).
 
 EJEMPLO:
 
 protocol Vendible {
 
    var descripcion : String { get set }
    var precio: Double { get }
 
    func vender() -> Bool
 
 }
 
 struct Libro : Vendible {
 
    var titulo: String
    var autor: String
    var año: Int
    var categoria: Int
 
    var descripcion: String {
        get { return "\(titulo) - \(autor) [\(año)]" }
        set(descripcion) {
            // TODO: Recuperar el título, autor y año desde la descripcion
            // TODO: Ajustar el título autor y año
        }
    }
 
    var precio : Double {
        switch categoria {
            case 1:
                return 9.99
             case 2:
                 return 15.99
             case 3:
                 return 4.99
            default:
                return 20.99
        }
    }
 
    func vender() -> Bool {
        // TODO: Implementar la venta
        return true
    }
 
 }
 
 Los protocolos pueden ser implementados por cualquier tipo de estructura
 que sea capaz de definir dichos requerimientos.
 
 SINTAXIS:
 
 protocol <nombre> {
 
    <requerimientos ...>
 
 }
 
 <requerimiento> ~ var <propiedad> : <tipo> { <get | set> }
 
 <requerimiento> ~ [mutating] func <método>(<paramétros ...>) -> <tipo retorno>
 
 */

protocol TieneTotal {
    
    var total : Double { get }
    
}

struct Producto : TieneTotal {
    
    var nombre: String
    var precio: Double
    
    var total: Double { return precio * 1.16 }
    
}

let p1 = Producto(nombre: "Coca Cola", precio: 18.5)

print(p1.total)

class Tienda : TieneTotal {
    
    var productos : [Producto] = []
    
    var total: Double {
        var sumaTotales: Double = 0.0
        
        for producto in productos {
            sumaTotales += producto.total
        }
        
        return sumaTotales
    }
    
    func agregar(nombre: String, precio: Double) {
        productos.append(Producto(nombre: nombre, precio: precio))
    }
    
}

let t1 = Tienda()

t1.agregar(nombre: "Coca Cola", precio: 18.5)
t1.agregar(nombre: "Gansito", precio: 10.5)

print(t1.total)

let vendible1 : TieneTotal = p1
let vendible2 : TieneTotal = t1

print("Te vendo la cosa 1 por \(vendible1.total)")
print("Te vendo la cosa 2 por \(vendible2.total)")

func vender(vendible: TieneTotal) -> Bool {
    
    print("Comienza la venta por $\(vendible.total)")
    
    return vendible.total > 30
    
}

print(vender(vendible: p1))
print(vender(vendible: t1))
