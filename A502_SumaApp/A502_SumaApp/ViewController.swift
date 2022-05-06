//
//  ViewController.swift
//  A502_SumaApp
//
//  Created by Dragon on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldA: UITextField!
    
    @IBOutlet weak var textFieldB: UITextField!
    
    @IBOutlet weak var labelResultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSumar(_ sender: UIButton) {
        
        print("Botón pulsado")
        
        // 1. Recuperar el a y b de los UITextField
        //    * Convertidos a entero
        // 2. Calcular el resultado de la suma
        // 3. Colocar el resultado en el UILabel
        
        if let a = Int(textFieldA.text!) {
            if let b = Int(textFieldB.text!) {
                let c = a + b
                labelResultado.text = "Resultado: \(c)"
            } else {
                labelResultado.text = "ERROR B"
            }
        } else {
            labelResultado.text = "ERROR A"
        }
        
    }
    
}

