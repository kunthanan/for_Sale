//
//  ViewController.swift
//  for_Sale
//  Created by K.Konthanan on 22/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Order:Int!
    var Name:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coffeeTypeButton(_ sender: UIButton) {
        switch (sender.tag) {
        case 0:
            print(0)
            Order = 70
            Name = "Espresso"
        case 1:
            print(1)
            Order = 70
            Name = "Americano"
        case 2:
            print(2)
            Order = 69
            Name = "Black coffee"
        case 3:
            print(3)
            Order = 70
            Name = "Latte"
        default:
            break
        }
        
        self.performSegue(withIdentifier: "goToPage2", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPage2" {
            let destinetionVc = segue.destination as! ViewControllerPage2
            destinetionVc.coffeeName = Name
            destinetionVc.BasePrice = Order
        }
    }
    
}

