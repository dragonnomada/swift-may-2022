//
//  main.swift
//  S10_ErroresYGuards
//
//  Created by Dragon on 13/05/22.
//

import Foundation

/*
 
 ERRORES
 
 Los errores que se pueden provocar y provienen del protocolo de Error y generalmente se implementan
 en enumeraciones, para listar fácilmente que tipo de error podemos provocar y los valores asociados
 al error.
 
 EJEMPLO:
 
 enum ProductoError: Error {
 
    case NombreVacio
    case PrecioNegativo
    case PrecioExcesivo
    case ExistenciasNegativas
    case ErrorLectura
    case MaximoIntentos
 
 }
 
 Las implementaciones del protocolo Error pueden ser arrojadas (propagadas) dentro
 de una función/método que tenga marcado un throws, es decir, todas las funciones/métodos
 con capacidad de propagar errores, serán capaces de arrojar errores de tipo Error
 o derivados.
 
 EJEMPLO:
 
 // Funciones error-controlables
 // func ... throws -> son funciones con propagación de error
 func capturarProducto() throws -> Producto {
    // TODO: ... (en algún momento se podría generar un error)
 }
 
 Para arrojar un error dentro de una función/método marcada con throws
 debemos usar: throw <error>
 
 En este momento la función/método se dentendrá y se producirá el error específico
 que deberá ser controlado fuera de la función/método, es decir, quién invoque
 a la función/método deberá hacerse responsable de controlar el error
 y advertir que este sucedió bajo alguna estrategia como if-try?, guard-try? o do-catch.
 
 EJEMPLO:
 
 func capturarProducto() throws -> Producto {
    print("Dame el nombre: ")
    if let nombre = readLine() {
        if nombre.isEmpty {
            throw ProductoError.NombreVacio
        }
        // TODO: Seguimos capturando y determinando si arrojar otro error
    } else {
        throw ProductoError.ErrorLectura
    }
 }
 
 */

enum ProductoError: Error {

    case NombreVacio
    case PrecioNegativo
    case PrecioExcesivo
    case PrecioNoValido
    case ExistenciasNegativas
    case ExistenciasNoValidas
    case ErrorLectura
    case MaximoIntentos

}

struct Producto {
    
    var nombre: String
    var precio: Double
    var existencias: Int
    
}

func capturarProducto() throws -> Producto {
    print("Dame el nombre: ")
    if let nombre = readLine() {
        if nombre.isEmpty {
           throw ProductoError.NombreVacio
        }
        print("Dame el Precio: ")
        if let line = readLine() {
            if let precio = Double(line) {
                if precio < 0 {
                    throw ProductoError.PrecioNegativo
                }
                if precio >= 1_000_000 {
                    throw ProductoError.PrecioExcesivo
                }
                print("Dame las existencias: ")
                if let line = readLine() {
                    if let existencias = Int(line) {
                        if existencias < 0 {
                            throw ProductoError.ExistenciasNegativas
                        }
                        return Producto(nombre: nombre, precio: precio, existencias: existencias)
                    } else {
                        throw ProductoError.ExistenciasNoValidas
                    }
                } else {
                    throw ProductoError.ErrorLectura
                }
            } else {
                throw ProductoError.PrecioNoValido
            }
        } else {
            throw ProductoError.ErrorLectura
        }
    } else {
        throw ProductoError.ErrorLectura
    }
}

/*
 
 GUARDS
 
 Los guards son como if-let's que permiten retener el valor del let en scope del guard
 a diferencia del if-let, dónde fuera del bloque del if no se puede acceder al valor.
 
 EJEMPLO:
 
 if let line = readLine() {
    <line sólo existe en esta clausura>
 }
 
 <line ya no es accesible aquí>
 
 ---
 
 guard let line = readLine() else {
    return <result> | throw <error>
 }
 
 <line es accesible aquí>
 
 Los guards nos generan linealidad del código y evitan la anidación de los if-let
 
 */

func capturaProductoGuard() throws -> Producto {
    
    print("Dame el nombre: ")
    guard let nombre = readLine() else {
        throw ProductoError.ErrorLectura
    }
    if nombre.isEmpty {
        throw ProductoError.NombreVacio
    }
    
    print("Dame el precio: ")
    guard let linePrecio = readLine() else {
        throw ProductoError.ErrorLectura
    }
    guard let precio = Double(linePrecio) else {
        throw ProductoError.PrecioNoValido
    }
    if precio < 0 {
        throw ProductoError.PrecioNegativo
    }
    if precio > 1_000_000 {
        throw ProductoError.PrecioExcesivo
    }
    
    print("Dame las existencias: ")
    guard let lineExistencias = readLine() else {
        throw ProductoError.ErrorLectura
    }
    guard let existencias = Int(lineExistencias) else {
        throw ProductoError.ExistenciasNoValidas
    }
    if existencias < 0 {
        throw ProductoError.ExistenciasNegativas
    }
    
    return Producto(nombre: nombre, precio: precio, existencias: existencias)
    
}

/*
 
 CONTROLAR ERRORES
 
 Existen 3 estrategias para el control de errores y son:
 
 1. [if-try?] if let <result> = try? <error-controlable>(...) { <result> }
 
 EJEMPLO:
 
 if let producto = try? capturarProducto() {
    print(producto)
 } else {
    print("No se pudo capturar el producto")
 }
 
 2. [guard-try?] guard let <result> = try? <error-controlable>(...) else { <no-result> }
 
 EJEMPLO:
 
 guard let producto = try? capturarProducto() {
    print("No se pudo capturar el producto")
    return
 }
 
 print(producto)
 
 3. [do-try-catch] do { <result> = try <error-controlable>(...) } catch <error> { <no-result> }
 
 EJEMPLO:
 
 var producto: Producto?
 
 do {
    producto = try capturarProducto()
 } catch .ErrorLectura {
    print("Error de lectura")
 } catch .NombreVacio {
    print("El nombre no puede ser vacío")
 } catch .PrecioNegativo {
    print("El precio no puede ser negativo")
 } ... {
    ...
 } catch {
    print("Error desconocido")
 }
 
 RESUMEN:
 
 1. Definir los tipos de errores que se pueden arrojar (enum)
 2. Definir una función/método <error-controlable> (throws)
 3. Controlar un <error-controlable> (if-try? | guard-try? | do-try-catch)
 
 */

// if-try?

if let producto1 = try? capturarProducto() {
    print("Producto 1: \(producto1)")
} else {
    print("No se pudo capturar el Producto 1")
}

func test() {
    guard let producto2 = try? capturaProductoGuard() else {
        print("No se pudo capturar el producto 2")
        return
    }
    
    print("Producto 2: \(producto2)")
}

test()

var producto3: Producto? = nil

do {
    producto3 = try capturarProducto()
} catch ProductoError.ErrorLectura {
    print("Error al leer los datos del usuario")
} catch ProductoError.NombreVacio {
    print("El nombre no puede estar vacío")
} catch ProductoError.PrecioNoValido {
    print("El precio no es un número")
} catch ProductoError.PrecioNegativo {
    print("El precio es negativo")
} catch ProductoError.ExistenciasNoValidas, ProductoError.ExistenciasNegativas {
    print("Error al capturar las existencias")
} catch {
    print("Otro Error: \(error)")
}

if let producto = producto3 {
    print("Producto 3: \(producto)")
} else {
    print("El producto 3 no fué capturado")
}

/*
 
 RETO:
 
 1. Define la enumeración ´SolverError´
 
 SolverError: Error
 -----------------------
 case DivisionError
 case ImaginaryError
 
 2. Define la función ´solverQuadratic(a: Double, b: Double, c: Double) throws -> (x1: Double, x2: Double)´
 
 ALGORITMO
 
    SI a = 0 -> ERROR: .DivisionError
 
    d = b * b - 4 * a * c
 
    SI d < 0 -> ERROR: .ImaginaryError
 
    x1 = (-b + sqrt(d)) / (2 * a)
 
    x2 = (-b - sqrt(d)) / (2 * a)
 
    REGRESAR -> (x1, x2)
 
 3. Realiza las siguientes pruebas:
 
func test1(a: Double, b: Double, c: Double) {
    if let (x1, x2) = try? solverQuadratic(a: a, b: b, c: c) {
        print("[if-try?] a=\(a) b=\(b) c=\(c) -> x1=\(x1) x2=\(x2)")
    } else {
        print("[if-try?] Sin solución")
    }
 }
 
 func test2(a: Double, b: Double, c: Double) {
    guard let (x1, x2) = try? solverQuadratic(a: a, b: b, c: c) else {
        print("[guard-try?] No hay solución")
    }
 
    print("[guard-try?] a=\(a) b=\(b) c=\(c) -> x1=\(x1) x2=\(x2)")
 }
 
 // TODO: Crea la función test3 similar pero usando do-try-catch
 
 test1(0, 1, 1)
 test1(1, 1, 1)
 test1(1, 2, 1)
 
 test2(0, 1, 1)
 test2(1, 1, 1)
 test2(1, 2, 1)
 
 test3(0, 1, 1)
 test3(1, 1, 1)
 test3(1, 2, 1)
 
 */


// 1. Tipo de Error

enum SolverError: Error {
    case DivisionError
    case ImaginaryError
}

// 2. Error-Controlable

func solverQuadratic(a: Double, b: Double, c: Double) throws -> (x1: Double, x2: Double) {
    
    if a == 0 {
        throw SolverError.DivisionError
    }
    
    let d = b * b - 4 * a * c
    
    if d < 0 {
        throw SolverError.ImaginaryError
    }
    
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    
    return (x1, x2)
    
}

// 3. Control de Error

func test1(_ a: Double, _ b: Double, _ c: Double) {
    if let (x1, x2) = try? solverQuadratic(a: a, b: b, c: c) {
        print("[if-try?] a=\(a) b=\(b) c=\(c) -> x1=\(x1) x2=\(x2)")
    } else {
        print("[if-try?] Sin solución")
    }
 }
 
func test2(_ a: Double, _ b: Double, _ c: Double) {
   guard let (x1, x2) = try? solverQuadratic(a: a, b: b, c: c) else {
       print("[guard-try?] No hay solución")
       return
   }

   print("[guard-try?] a=\(a) b=\(b) c=\(c) -> x1=\(x1) x2=\(x2)")
}
 
func test3(_ a: Double, _ b: Double, _ c: Double) {
    var x1: Double
    var x2: Double
    
    do {
        (x1, x2) = try solverQuadratic(a: a, b: b, c: c)
    } catch SolverError.DivisionError {
        print("División por cero")
        return
    } catch SolverError.ImaginaryError {
        print("Solución imaginaria")
        return
    } catch {
        print("Error desconocido")
        return
    }
    
    print("[do-try-catch] a=\(a) b=\(b) c=\(c) -> x1=\(x1) x2=\(x2)")
}
 
test1(0, 1, 1)
test1(1, 1, 1)
test1(1, -2, 1)

test2(0, 1, 1)
test2(1, 1, 1)
test2(1, -2, 1)

test3(0, 1, 1)
test3(1, 1, 1)
test3(1, -2, 1)
