//
//  ViewControllerPageResult.swift
//  for_Sale
//
//  Created by K.Konthanan on 22/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit

class ViewControllerPageResult: UIViewController {
    var CoffeeType = " "
    var CupSize = " "
    var Price = 0
    var coffeePrecentage = " "
    var foamedPrecentage = " "
    var steamedMilkPrecentage = " "
    @IBOutlet weak var NameCoffee: UILabel!
    @IBOutlet weak var PriceTag: UILabel!
    @IBOutlet weak var coffee: UILabel!
    @IBOutlet weak var Foam: UILabel!
    @IBOutlet weak var Steam: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NameCoffee.text = CoffeeType + " (" + CupSize + ")"
        PriceTag.text = String(Price)
        coffee.text = coffeePrecentage
        Foam.text = foamedPrecentage
        Steam.text = steamedMilkPrecentage
    }
    
    @IBAction func New(_ sender: Any) {
        self.performSegue(withIdentifier: "NewOne", sender: self)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
