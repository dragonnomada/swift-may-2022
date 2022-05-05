var a : Int? = nil

a = 123

// Forzar que una variable opcional se vuelva no-opcional

// a! - Se refiere a la variable quitando lo opcional
//      CUIDADO: Si la variable contiene ´nil´ se producirá un error

// a! -> 123

print(a!) // Imprime el valor garantizado (no ´nil´)

a = nil

// a! -> ERROR: ´a´ es nil

// print(a!) // ERROR: Intenta imprimir el valor garantizado (no ´nil´), pero produce un error porque si es ´nil´

// Desengrapar (unwrapping) - Es la forma de extraer de forma segura una variable grarantizada de una variable opcional

if let b = a {
    // ´b´ es la variable garantizada de ´a´ (´b ~ a!´)
    print(b)
} else {
    // ´a == nil´
    print("La variable es nula")
}

a = 456

if let a = a {
    print(a)
} else {
    print("La variable es nula")
}

var textoOpcional : String? = nil

if 1 > 0 {
    textoOpcional = "1 es mayor a 0"
}

if let texto = textoOpcional {
    print(texto)
} else {
    print("No hay texto por imprimir")
}

func dividir(a : Double, b : Double) -> Double? {
    if b == 0 {
        return nil
    }
    return a / b
}

if let resultado = dividir(a: 5, b: 0) {
    print(resultado)
} else {
    print("No puede dividir 5 / 0")
}

if textoOpcional != nil {
    print(textoOpcional!)
}

if let texto = textoOpcional {
    print(texto)
}
