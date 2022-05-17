//
//  main.swift
//  S1201_Repaso
//
//  Created by Dragon on 17/05/22.
//

import Foundation

protocol DoubleRepresentable {
    
    func toDouble() -> Double
    
}

// <T: Protocol, U: Protocolol> ... where T as Type, U: Equatable, Comparable, ...

func suma<T, U>(a: T, b: U) -> Double where T:DoubleRepresentable, U:DoubleRepresentable {
    return a.toDouble() + b.toDouble()
}

struct Producto: DoubleRepresentable {
    
    var id: Int
    var nombre: String
    var precio: Double
    var activo: Bool = true
    
    func toDouble() -> Double {
        return precio
    }
    
}

let p1 = Producto(id: 1, nombre: "Coca Cola", precio: 18.5)
let p2 = Producto(id: 2, nombre: "Gansito", precio: 10.5, activo: false)

print(suma(a: p1, b: p2))

extension Int: DoubleRepresentable {
    
    func toDouble() -> Double {
        return Double(self)
    }
    
}

print(suma(a: p1, b: 100))

/*
 
 OPERADORES
 
 Tenemos 3 tipos de operadores:
 
 prefix  <- <prefix><operando>
            Ejemplo: @producto
 
 infix   <- <operando1> <infix> <operando2>
            Ejemplo: producto1 @ producto2
 
 postfix <- <operando><postfix>
            Ejemplo: producto@
 
 Podemos definir operadores mediante:
 
 prefix operator @       # prefix
 
 operator @              # infix
 
 postifx operator @      # postfix
 
 Podemos asignar un operador a un tipo, preferentemente en una extensión:
 
 <struct|class|enum> <type A> {
 
    static prefix func @ (<operando>: <type A>) -> <valor> {
        return ...
    }
 
    static func @ (<operando1>: <type A>, <operando2>: <type B>) -> <valor> {
        return ...
    }
 
    static postfix func @ (<operando>: <type A>) -> <valor> {
        return ...
    }
 
 }
 
 */

postfix operator +
postfix operator -
prefix operator ~

extension Producto {
    
    static postfix func + (producto: Producto) -> Producto {
        return Producto(id: producto.id, nombre: producto.nombre, precio: producto.precio, activo: true)
    }
    
    static postfix func - (producto: Producto) -> Producto {
        return Producto(id: producto.id, nombre: producto.nombre, precio: producto.precio, activo: false)
    }
    
    static prefix func ~ (producto: Producto) -> Double {
        return producto.activo ? producto.precio : Double.infinity
    }
    
}

extension Double {
    
    static func + (a: Double, b: Double) -> Double? {
        return a == Double.infinity || b == Double.infinity ? nil : a.advanced(by: b)
    }
    
}

print(p1-)
print(p2+)
print(~p1)
print(~p2)
if let precio = ~p1 + ~p2 {
    print(precio)
} else {
    print("No se puede determinar el precio")
}

/*
 
 CONTEO AUTOMÁTICO DE MEMORIA
 
 Todas las refencias que hayan sido asignadas a una variable,
 se mantendrán en un conteo automático (ARC).
 
 Y cuándo una variable ya no referencia a la referencia previa,
 la refencia es liberada automáticamiente, cuándo su conteo llega a cero.
 
 Es decir, por cada referencia se incrementará un conteo y cada que
 se pierda la referencia se decrementará un conteo.
 
 Existen 2 formas de aumentar el conteo:
 
 1. Se asigna una variable a la referencia: ´let a = A(...)´
 2. Se guarda la referencia en una lista: ´listaA.append(A(...))´
 
 Existen 4 formas de disminuir el conteo:
 
 1. La referencia es opcional y se vuelve ´nil´
 2. La referencia está dentro de una clausura y esta termina
 3. La referencia está dentro de una lista y esta se vacía, cambia o se vuelve nil
 4. Se invoca al método ´deinit´
 
 EJEMPLO:
 
 let a = A(...) // 0x123 -> 1
 
 let b = a // 0x123 -> 2
 
 func test(c: A) { // 0x123 -> 3 (c = b)
    ...
 } 0x123 -> 2 (desaparece c)
 
 test(b) // 0x123 -> 3 (c = b)
 
 // 0x123 -> 2
 
 var x: A?
 
 x = a // 0x123 -> 3 (x = a)
 x = b // 0x123 -> 3 (x = b)
 
 x = nil // 0x123 -> 2 (x = nil)
 
 */

/*
 
 MEMORIA SEGURA
 
 Existen tres mecanismos para proteger la memoria (proteger las variables y sus valores)
 
 1. Inmutabilidad - Si hacemos variables ´let´ inmutables,
                    garantizaremos que los datos no se puede modificar
 
    EJEMPLO:
 
    let frutas: [String] = ["manza", "pera", "mango"]
 
    frutas.append("kiwi") // ERROR: inmutable
 
2. Niveles de acceso - Las propiedades disponibles en una enumeración/estructura/clase
                       pueden ser protegidas mediante los niveles de acceso:
 
   EJEMPLO:
 
   private   - protege las propiedades y métodos para que solo se puedan acceder dentro de la clase
   protected - protege las propiedades y métodos para que solo se puedan acceder dentro de la clase y
               derivados
   public    - NO protege las propiedades o métodos y sólo es recomendable en métodos
   default   - NO protege las propiedades o métodos y sólo es recomendable en librerías
 
   class Tienda {
        private var productos: [Producto] = []
   }
 
   let tienda = Tienda()
 
   tienda.productos = [] // ERROR: No hay nivel de acceso suficiente
 
   class TiendaMascotas: Tienda {
 
      var total: Int { return productos.count } // ERROR: No hay nivel de acceso suficiente
                                                // -> Cambia ´private´ por ´protected´
   }
 
 3. Inout - Son parámetros de entrada/salida, que son capaces de alterar la referencia original.
            Sirven para aplicar operaciones que afecten directamente la referencia, sin crear
            referencias adicionales.
 
    EJEMLPLO:
 
    func swap<T>(_ a: inout T, _ b: inout T) { // 0x1 -> 1 | 0x2 -> 1
        let t = a
        a = b
        b = a
    }
 
    var a: Int = 123 // 0x1 -> 1
    var b: Int = 456 // 0x2 -> 1
 
    swap(&a, &b)
 
    // a = 123
    // b = 456
 
 */
