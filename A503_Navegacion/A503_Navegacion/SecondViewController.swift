//
//  SecondViewController.swift
//  A503_Navegacion
//
//  Created by Dragon on 06/05/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textFieldNombre: UITextField!
    
    @IBOutlet weak var textFieldPrecio: UITextField!
    
    var onProductoReady : ((String, Double) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onAceptar(_ sender: Any) {
        if let nombre = textFieldNombre.text {
            if let precio = Double(textFieldPrecio.text ?? "0.0") {
                if let productoReady = onProductoReady {
                    productoReady(nombre, precio)
                }
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
