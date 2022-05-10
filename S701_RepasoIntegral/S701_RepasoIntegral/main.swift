//
//  main.swift
//  S701_RepasoIntegral
//
//  Created by Dragon on 10/05/22.
//

import Foundation

enum TipoTransporte : String {
    
    case Tradicional = "TRADICIONAL"
    
    case Delux = "DELUX"
    
    case Ejecutivo = "EJECUTIVO"
    
    case Express = "EXPRESS"
    
}

class Viaje {
    
    var lugar : (lat: Double, lon: Double)
    var horaSalida : Date
    var tipoTransporte : TipoTransporte
    
    init(lat: Double, lon: Double, horaSalida: Date, tipoTransporte: TipoTransporte) {
        
        lugar = (lat, lon)
        
        self.horaSalida = horaSalida
        
        self.tipoTransporte = tipoTransporte
        
    }
    
    init(lat: Double, lon: Double) {
        lugar = (lat, lon)
        
        self.horaSalida = Date()
        
        self.tipoTransporte = .Tradicional
    }
    
}

enum ZonaTurisca {
    
    case Piramides
    case ValleBravo
    case MineralChico
    case Huasca
    case Chulula
    case Tajin
    
}

class LugarTuristico {
    
    init() {
    }
    
    subscript(zonaTuristica: ZonaTurisca) -> (lat: Double, lon: Double) {
        switch zonaTuristica {
        case .Piramides:
            return (90, 114)
        case .ValleBravo:
            return (82, 98)
        case .MineralChico:
            return (98, 116)
        case .Huasca:
            return (67, 102)
        case .Chulula:
            return (95, 123)
        case .Tajin:
            return (86, 96)
        }
    }
    
}

class Tour : Viaje {
    
    var zona : ZonaTurisca
    
    var pasajeros : [(nombre: String, edad: Int)]?
    
    init(zona: ZonaTurisca, transporte: TipoTransporte) {
        
        let lugarTuristico = LugarTuristico()
        
        let (lat, lon) = lugarTuristico[zona]
        
        self.zona = zona
        
        super.init(lat: lat, lon: lon, horaSalida: Date(), tipoTransporte: transporte)
        
    }
    
    deinit {
        if var pasajerosActuales = pasajeros {
            pasajerosActuales.removeAll()
        }
        pasajeros = nil
    }
    
}
