//
//  main.swift
//  E405_EstructuraCliente
//
//  Created by Dragon on 05/05/22.
//

import Foundation

struct Cliente {
    
    var id : Int
    var nombre : String
    var correo : String
    var activo : Bool
    var lineaCredito : Double
    
    func superaLineaCredito(limiteCredito: Double) -> Bool {
        return lineaCredito > limiteCredito
    }
    
    func describir() {
        print("\(nombre) <\(correo)> [ACTIVO: \(activo)] LC: $\(lineaCredito)")
    }
    
    func enviarCorreo(correos: [String]) {
        for correo in correos {
            print("DE: \(self.correo) A: \(correo)")
        }
    }
    
}

let cliente1 = Cliente(id: 1, nombre: "Pepe", correo: "pepe@gmail.com", activo: true, lineaCredito: 50000)

cliente1.describir()

if cliente1.superaLineaCredito(limiteCredito: 30000) {
    cliente1.enviarCorreo(correos: ["ana@gmail.com", "beto@gmail.com", "paco@hotmail.com"])
}
