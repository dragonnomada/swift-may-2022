//
//  main.swift
//  E407_ClaseRobot2D
//
//  Created by Dragon on 05/05/22.
//

import Foundation

class Robot2D {
    
    var x : Int = 0
    var y : Int = 0
    var d : Character = "N"
    
    func avanzar() {
        switch d {
        case "N":
            y += 1
            break
        case "S":
            y -= 1
            break
        case "E":
            x += 1
            break
        case "O":
            x -= 1
            break
        default:
            print("Dirección no válida")
        }
    }
    
    func mirarNorte() {
        d = "N"
    }
    
    func mirarSur() {
        d = "S"
    }
    
    func mirarEste() {
        d = "E"
    }
    
    func mirarOeste() {
        d = "O"
    }
    
    func describir() {
        print("(\(x), \(y)) [\(d)]")
    }

}

let robot1 = Robot2D()

robot1.describir() // (0, 0) [N]

robot1.avanzar()

robot1.describir() // (0, 1) [N]

robot1.mirarOeste()

robot1.avanzar()

robot1.describir() // (-1, 1) [O]

