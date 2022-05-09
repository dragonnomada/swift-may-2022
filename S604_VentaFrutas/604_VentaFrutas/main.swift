//
//  main.swift
//  604_VentaFrutas
//
//  Created by Dragon on 09/05/22.
//

import Foundation

/*
 
 HERENCIA
 
 La herencia es un mecanimso para convertir una clase en la subclase de otra.
 
 Es decir, una clase puede extender las definiciones de otra clase (llamada la superclase),
 volviéndose una subclase de esta.
 
 Todas las definiciones de la superclase estarían disponibles en la subclase,
 para permitirle al modelo seguir extendiendo o reemplazando las funcionalidades,
 sin tener que modificar la definición original.
 
 ---
 
 Cuándo la superclase tiene inicializadores, estamos obligados a inicializar
 la superclase dentro de la subclase (nos obliga a definir al menos un inicializador
 en la subclase que mande a llamar a un inicializador de la superclase.
 
 REGLAS:
 
 1. Si la superclase tiene inicializadores, debemos llamar al menos a uno en la subclase
 2. Tenemos que inicializar los atributos de la subclase antes de llamar al inicializador
    de la superclase
 3. Si la superclase y la subclase tienen un deinicializador debemos deinicializar
    la subclase antes de llamar al deinicializador de la superclase (automático)
    
 
 */

class Fruta { // Superclase
    
    var nombre : String
    var precio : Double
    
    init(nombre: String, precio: Double) {
        self.nombre = nombre
        self.precio = precio
    }
    
    func describir() {
        print("\(nombre) $\(precio)")
    }
    
}

class FrutaConColor : Fruta { // Subclase
    
    var color : CGColor
    
    init(nombre: String, precio: Double, color: CGColor) {
        self.color = color // Inicialización de la subclase
        super.init(nombre: nombre, precio: precio) // Llamada al inicializador de la superclase
    }
    
}

let fruta1 = Fruta(nombre: "manzana", precio: 45.5)

let fruta2 = FrutaConColor(nombre: "manzana", precio: 45.5, color: CGColor(red: 123, green: 23, blue: 17, alpha: 1))

print(fruta1)

print(fruta2)
