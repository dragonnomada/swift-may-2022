//
//  main.swift
//  E702_RobotMovil
//
//  Created by Dragon on 10/05/22.
//

import Foundation

enum DireccionRobot: String {
    
    case Norte  = "NORTE"
    case Sur = "SUR"
    case Este = "ESTE"
    case Oeste = "OESTE"
    
}

class Robot {
    
    var x: Int
    var y: Int
    var d: DireccionRobot
    
    init() {
        x = 0
        y = 0
        d = .Norte
        
        print("(\(self.x), \(self.y)) [\(self.d)]")
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        self.d = .Norte
        
        print("(\(self.x), \(self.y)) [\(self.d)]")
    }
    
    init(x: Int, y: Int, direccion: DireccionRobot) {
        self.x = x
        self.y = y
        self.d = direccion
        
        print("(\(self.x), \(self.y)) [\(self.d)]")
    }
    
    init?(direccion: String) {
        if let direccionRobot = DireccionRobot(rawValue: direccion) {
            self.x = 0
            self.y = 0
            self.d = direccionRobot
            
            print("(\(self.x), \(self.y)) [\(self.d)]")
        } else {
            print("No se puede inicializar")
            return nil
        }
    }
    
    deinit {
        self.x = 0
        self.y = 0
        self.d = .Norte
        
        print("! (\(self.x), \(self.y)) [\(self.d)]")
    }
    
}

func test() {
    let r1 = Robot()
    
    print(r1)

    let r2 = Robot(x: 5, y: 4)
    
    print(r2)

    let r3 = Robot(x: 10, y: 45, direccion: .Este)
    
    print(r3)
    
    if let r4 = Robot(direccion: "OESTE") {
        print(r4)
        print("Si existe la dirección OESTE")
    }

    if let r5 = Robot(direccion: "CENTRO") {
        print(r5)
        print("Si existe la dirección CENTRO")
    } else {
        print("No existe la dirección CENTRO")
    }
}

test()

