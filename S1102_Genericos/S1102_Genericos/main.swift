//
//  main.swift
//  S1102_Genericos
//
//  Created by Dragon on 16/05/22.
//

import Foundation

/*
 
 GENÉRICOS
 
 Un genérico es un patrón de modelado en el que determinamos sustituir/reemplazar
 un tipo específico por un tipo genérico. Es decir, si nosotros requerimos una
 función, estructura, clase, subscript, enumeración, etc. Que tome valores
 si que nos importe un tipo de dato específico, entonces, podemos sustituir dicho
 tipo específico por uno genérico y poner algunas restricciones.
 
 Generalmente estos se usan para crear listas genéricas y poder manipular
 sus valores sin entrar en detalles del tipo específico que almacenan.
 
 Por ejemplo, podemos agregar, quitar, ordenar o filtrar de listas genéricas
 y no importaría que tipo de dato específico sea el de la lista.
 
 
 
 */

func sumaInt(a: Int, b: Int) -> Int {
    return a + b
}

func sumaDouble(a: Double, b: Double) -> Double {
    return a + b
}

/*
 func suma<T>(a: T, b: T) -> T {
    return a + b
 }
 */

func partirListaDouble(lista: [Double]) -> (left: [Double], right: [Double]) {
    
    let m: Int = Int(floor(Double(lista.count - 1) / 2.0))
    
    // 12 -> 0 .. 11 | 5
    // 11 -> 0 .. 10 | 5
    
    var listaIzquierda : [Double] = []
    var listaDerecha : [Double] = []
    
    for i in 0..<lista.count {
        let valor: Double = lista[i]
        if i <= m {
            listaIzquierda.append(valor)
        } else {
            listaDerecha.append(valor)
        }
    }
    
    return (listaIzquierda, listaDerecha)

}

print(partirListaDouble(lista: [1, 2, 3, 4]))

func partirLista<T>(lista: [T]) -> (left: [T], right: [T]) {
    
    // Ínidice central
    let m: Int = Int(floor(Double(lista.count - 1) / 2.0))
    
    var listaIzquierda : [T] = []
    var listaDerecha : [T] = []
    
    for i in 0..<lista.count {
        let valor: T = lista[i]
        if i <= m {
            listaIzquierda.append(valor)
        } else {
            listaDerecha.append(valor)
        }
    }
    
    return (listaIzquierda, listaDerecha)
    
}

print(partirLista(lista: ["Hola", "Mundo", "Esta", "Es", "Otra", "Palabra"]))

struct Producto {
    var id: Int
}

print(partirLista(lista: [
    Producto(id: 1),
    Producto(id: 2),
    Producto(id: 3),
    Producto(id: 4),
    Producto(id: 5),
    Producto(id: 6),
    Producto(id: 7),
    Producto(id: 8),
]))

class Balanceador<T>: CustomStringConvertible {
    
    var listaA: [T] = []
    var listaB: [T] = []
    
    var batchSize: Int = 5
    
    var inListaA: Bool = true
    
    var description: String {
        
        var text = "A: \(listaA.count) B: \(listaB.count) [\(inListaA ? "-> A" : "-> B")]\n"
        
        text += "--------------------------\n"
        
        for elementoA in listaA {
            text += "[A] \(elementoA)\n"
        }
        
        text += "--------------------------\n"
        
        for elementoB in listaB {
            text += "[B] \(elementoB)\n"
        }
        
        return text
        
    }
    
    init() {
        
    }
    
    init(batchSize: Int) {
        self.batchSize = batchSize
    }
    
    func agregar(elemento: T) {
        if inListaA {
            listaA.append(elemento)
            
            if listaA.count > listaB.count + batchSize - 1 {
                inListaA = false
            }
        } else {
            listaB.append(elemento)
            
            if listaB.count > listaA.count + batchSize - 1 {
                inListaA = true
            }
        }
    }
    
}

let balancedor = Balanceador<String>(batchSize: 2)

print(balancedor)

balancedor.agregar(elemento: "manzana") // A

print(balancedor)

balancedor.agregar(elemento: "mango") // A
balancedor.agregar(elemento: "pera") // B
balancedor.agregar(elemento: "guayaba") // B

print(balancedor)

balancedor.agregar(elemento: "papaya") // B
balancedor.agregar(elemento: "melón") // B
balancedor.agregar(elemento: "sandía") // A

print(balancedor)

balancedor.agregar(elemento: "fresa") // A
balancedor.agregar(elemento: "mora") // A
balancedor.agregar(elemento: "arándano") // A

print(balancedor)

balancedor.agregar(elemento: "guanabana") // B
balancedor.agregar(elemento: "plátano") // B
balancedor.agregar(elemento: "kiwi") // B

print(balancedor)

balancedor.agregar(elemento: "maracuyá") // B
balancedor.agregar(elemento: "lichis") // A
balancedor.agregar(elemento: "naranja") // A

print(balancedor)

let balanceador2 = Balanceador<Double>()

for i in 1...100 {
    balanceador2.agregar(elemento: Double(2 * i + 8) / Double(2 + i * 3))
}

print(balanceador2)
