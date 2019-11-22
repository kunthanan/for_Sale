//
//  ViewControllerPage3.swift
//  for_Sale
//
//  Created by K.Konthanan on 22/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit
import MapKit
class customPin:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
class ViewControllerPage3: UIViewController {
    var CoffeeType = " "
    var CupSize = " "
    var Price = 0
    var coffeePrecentage = " "
    var foamedPrecentage = " "
    var steamedMilkPrecentage = " "
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = CLLocationCoordinate2DMake(    18.796143,         98.979263)
        let region = MKCoordinateRegion(center: location, span:MKCoordinateSpan (latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.MapView.setRegion(region, animated: true)
        
        let pin = customPin(pinTitle: "Our Shop", pinSubTitle: "A Coffee Shop of ...", location: location)
        self.MapView.addAnnotation(pin)
    }
    
    @IBAction func Order(_ sender: Any) {
                self.performSegue(withIdentifier: "ToPageResult", sender: self)
    }
    
    @IBAction func Back(_ sender: Any) {
                self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPageResult" {
            let Vc = segue.destination as! ViewControllerPageResult
            Vc.CoffeeType = CoffeeType
            Vc.CupSize = CupSize
            Vc.Price = Price
            Vc.coffeePrecentage = coffeePrecentage
            Vc.foamedPrecentage = foamedPrecentage
            Vc.steamedMilkPrecentage = steamedMilkPrecentage
        }
    }
}
