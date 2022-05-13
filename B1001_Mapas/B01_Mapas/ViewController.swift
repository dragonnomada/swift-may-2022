//
//  ViewController.swift
//  B01_Mapas
//
//  Created by Dragon on 13/05/22.
//

import UIKit
import MapKit

extension MKMapView {
    
    func centerTo(latitude: Double, longitude: Double, meters: Double = 1000) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: meters,
            longitudinalMeters: meters
        )
        
        self.setRegion(region, animated: true)
    }
    
}

class MyAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, latitude: Double, longitude: Double) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        super.init()
    }
    
}

extension MKMapView {
    
    func addAnnotation(latitude: Double, longitude: Double, title: String, subtitle: String = "Sin descripción") {
        
        let annotation = MyAnnotation(title: title, subtitle: subtitle, latitude: latitude, longitude: longitude)
        
        self.addAnnotation(annotation)
        
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var switchAgregarMarcador: UISwitch!
    
    @IBOutlet weak var textFieldTitulo: UITextField!
    
    @IBOutlet weak var textFieldSubtitulo: UITextField!
    
    @IBOutlet weak var labelCoordenadas: UILabel!
    
    var selectedAnnotation: MyAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.centerTo(latitude: 19.415088, longitude: -99.171278, meters: 400)
        
        mapView.addAnnotation(latitude: 19.415088, longitude: -99.171278, title: "Parque España", subtitle: "CDMX, México")
        
        mapView.delegate = self // <obj: MKMapViewDelegate>
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard switchAgregarMarcador.isOn else {
            return
        }
        
        for touch in touches {
            let touchPoint = touch.location(in: mapView)
            let location = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            // mapView.centerTo(latitude: location.latitude, longitude: location.longitude, meters: 400)
            mapView.addAnnotation(latitude: location.latitude, longitude: location.longitude, title: "Nuevo Marcador")
        }
    }

    @IBAction func onTouchActualizar(_ sender: Any) {
        if let annotation = selectedAnnotation {
            
            annotation.title = textFieldTitulo.text
            annotation.subtitle = textFieldSubtitulo.text
            
            mapView.deselectAnnotation(annotation, animated: true)
            mapView.selectAnnotation(annotation, animated: true)
            
        }
    }
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? MyAnnotation {
            print("Marcador: \(annotation.title!) \(annotation.subtitle!) \(annotation.coordinate)")
            
            textFieldTitulo.text = annotation.title
            textFieldSubtitulo.text = annotation.subtitle
            labelCoordenadas.text = "(\(annotation.coordinate.latitude), \(annotation.coordinate.longitude))"
            
            selectedAnnotation = annotation
            
        }
    }
    
}

