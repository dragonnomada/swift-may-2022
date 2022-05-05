//
//  main.swift
//  E202_CentigradosAFahrenheit
//
//  Created by Dragon on 03/05/22.
//

import Foundation

print("Dame los grados centígrados: ", terminator: "")

if let line = readLine() {
    if let centigrados = Double(line) {
        let fahrenheit = centigrados * 9 / 5 + 32
        print("\(centigrados)°C ~ \(fahrenheit)°F")
    }
}

