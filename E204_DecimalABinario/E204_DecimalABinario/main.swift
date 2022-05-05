//
//  main.swift
//  E204_DecimalABinario
//
//  Created by Dragon on 03/05/22.
//

import Foundation

print("Dame un número: ", terminator: "")

if let line = readLine() {
    if var n = Int(line) {
        while n > 0 {
            let r = n % 2
            print(r)
            n = n / 2
        }
    }
}

