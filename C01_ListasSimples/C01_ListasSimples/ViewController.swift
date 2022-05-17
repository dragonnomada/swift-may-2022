//
//  ViewController.swift
//  C01_ListasSimples
//
//  Created by Dragon on 17/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension UIViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se selección la Sección \(indexPath.section) en la Fila: \(indexPath.row)")
    }
    
}

/*
 
 Los controles generalmente tienen 3 partes principales:
 
 1. View - Se refiere a la clase visual
 2. DataSource - Se refiere al delegado de los datos (configura los datos)
 3. Delegate - Se referie al delegado de funcionalidad (configura los eventos)
 
 */
extension UIViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section + 1) * 2
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sección: \(section)"
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewCell")!
        
        cell.textLabel?.text = "Hola"
        cell.detailTextLabel?.text = "Sección: \(indexPath.section) Fila: \(indexPath.row)"
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            guard let url = URL(string: "https://i.pinimg.com/originals/4e/40/dd/4e40ddd11beb9ba671a0b59948861afb.png") else {
                return cell
            }
            
            guard let data = try? Data(contentsOf: url) else {
                return cell
            }
            
            cell.imageView?.image = UIImage(data: data)
            
        }
        
        return cell
    }
    
}

