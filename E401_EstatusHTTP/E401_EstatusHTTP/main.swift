//
//  main.swift
//  E401_EstatusHTTP
//
//  Created by Dragon on 05/05/22.
//

import Foundation

var status200 : (codigo: Int, statusText: String) = (200, "Ok")
var status304 : (codigo: Int, statusText: String) = (304, "Not Modified")
var status400 : (codigo: Int, statusText: String) = (400, "Bad Request")
var status403 : (codigo: Int, statusText: String) = (403, "Forbidden")
var status404 : (codigo: Int, statusText: String) = (404, "Not Found")
var status500 : (codigo: Int, statusText: String) = (500, "Internal Server Error")
var status501 : (codigo: Int, statusText: String) = (501, "Not Implemented")

print(status200.0)            // 200
print(status304.1)            // Not Modified
print(status400.codigo)       // 400
print(status403.statusText)   // Forbidden
print(status404.1)            // Not Found
print(status500.codigo)       // 500
print(status501)              // (codigo: 501, statusText: "NotImplemented")
