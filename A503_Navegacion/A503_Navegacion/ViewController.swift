//
//  ViewController.swift
//  A503_Navegacion
//
//  Created by Dragon on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelNombre: UILabel!
    
    @IBOutlet weak var labelPrecio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func onProductoReady(nombre: String, precio: Double) {
        labelNombre.text = nombre
        labelPrecio.text = "\(precio)"
    }

    @IBAction func onCapturarProducto(_ sender: UIButton) {
        
        let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        navigationController?.pushViewController(secondViewController, animated: true)
        
        secondViewController.onProductoReady = onProductoReady
        
    }
    
}

