print("Hola Swift")

// Este es un comentario de línea

/*
 
 Este seria un comentario en múltiples líneas
 
 Sirve para documentar de forma más avanzada
 
 */

/*
 
 VARIABLES
 
 Existen dos tipos de variables: las inmutables (let) y las mutables (var)
 
 Una variable queda asociada a un tipo de datos, la primera vez que es asignada.
 
 Las literales tienen asociado un tipo de dato según la literal:
 
 EJEMPLO
 
 let a = 123
 
 - Declarar una variable inmutable ´a´ de tipo Int valor ´123´ (el tipo es implícito de la literal 123)
 
 */

let a = 123

// Variable de tipo explícito: var/let <nombre> : <tipo> = <valor>

let b : Double = 456

// Las inmutables no pueden cambiar su valor

// a = 321 // Error: La variable ´a´ es inmutable

// b = 654 // Error: La variable ´b´ es inmutable

var s = 0 // var s : Int = 0

s = 1  // s = 1

s += 2 // s = 3 (s = s + 2)

// s = 4.5 // Error: La variable ´s´ es de tipo Int

var x : Bool = true

if x {
    print("Pasa la x")
}

x = false

if !x {
    print("No pasa x")
}

/*
 
 FORMAS DE LA VARIABLE
 
 - inmutable (let): Impide cambiar (reasignar) el valor de una variable (se considera constante)
 - mutable   (var): Se permite cambiar (reasignar) el valor de una variable (se considera una variable)
 
 EJEMPLO
 
 let a = 123
 // a = 456 // ERROR
 
 var b = 789
 b = 555 // No error
 
 MODOS DE LA VARIABLE
 
 - requerida (!): No se permite que la variable contenga ´nil´ (valor requerido / garantizada)
 - opcional  (?): Si se permite que la variable contenga ´nil´ (valor opcional / no garantizada)
 
 EJEMPLO
 
 let a = 123 // let a : Int! = 123 (Int!)
 
 var b : Int? = nil
 
 b = 333 // ´b´ puede o no contener ´nil´
 
 */

var c : Int?

c = 123

c = nil

var mensaje : String? = nil

mensaje = "Hola mundo"

mensaje = nil

var d : String;

// d = 123 // ERROR: El tipo de dato no coincide (String <- Int)
