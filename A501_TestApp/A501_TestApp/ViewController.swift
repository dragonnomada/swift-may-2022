//
//  ViewController.swift
//  A501_TestApp
//
//  Created by Dragon on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //label1.text = "Hola mundo"
    }

    @IBAction func onSwitchValueChanged(_ sender: UISwitch, forEvent event: UIEvent) {
        print(sender.isOn)
        if sender.isOn {
            label1.text = "Encendido"
        } else {
            label1.text = "Apagado"
        }
    }
    
}

