//
//  main.swift
//  S1104_ContadorReferenciasAutomatico
//
//  Created by Dragon on 16/05/22.
//

import Foundation

class A: CustomStringConvertible {
    
    static var countReferences: Int = 0
    
    var id: Int
    
    var description: String { "[ID: \(id)]" }
    
    init(id: Int) {
        self.id = id
        A.countReferences += 1
    }
    
    deinit {
        A.countReferences -= 1
    }
    
}

print(A.countReferences)

let a1 = A(id: 1) // -> 1

print(a1)

print(A.countReferences)

let a2 = A(id: 2) // -> 2

print(a2)

print(A.countReferences)

let a3 = A(id: 1) // -> 3

print(a3)

print(A.countReferences)

for i in 1...100 {
    let a = A(id: i + 1000) // -> 4
    
    print("\(a) :> \(A.countReferences)")
} // Las clausuras liberan las instancias al salir (-> 3)

print(A.countReferences) // -> 3

var listaA: [A] = []

for i in 1...100 {
    let a = A(id: i + 1000) // -> 4, 5, 6, ..., 100, 101, 102, 103
    
    listaA.append(a)
    
    print("\(a) :> \(A.countReferences)")
} // Al salir (-> 103)

print(A.countReferences) // -> 103

listaA.remove(at: 0)

print(A.countReferences) // -> 102

let a25 = listaA[25] // <- referencia a la instancia (ARC)

listaA.remove(at: 25)

print(A.countReferences) // -> 102

var a88: A? = nil

a88 = listaA[88]

listaA.remove(at: 88)

print(A.countReferences) // -> 102

a88 = nil

print(A.countReferences) // -> 101

class B {
    
    private var listaA: [A?] = [] // default (P) | public (X) | private (B-) | protected (B+)
    
    func add(_ a: A) {
        listaA.append(a)
    }
    
    deinit {
        for i in 0..<listaA.count {
            listaA[i] = nil
        }
        listaA.removeAll()
        print("Borrando instancia de B")
    }
    
}

print("------------------")

var b1: B? = B()

print(A.countReferences) // -> 101

b1?.add(A(id: 301))
b1?.add(A(id: 302))
b1?.add(A(id: 303))

print(A.countReferences) // -> 104

let refListaA = b1?.listaA // <<< --- <listaA>

b1 = nil

print(A.countReferences) // -> 101

print(refListaA!)


