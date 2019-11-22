//
//  ViewControllerPage2.swift
//  for_Sale
//  Created by K.Konthanan on 22/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit

class ViewControllerPage2: UIViewController {
    var coffeeName:String = " "
    var BasePrice = 0
    var UpdatePrice = 0
    var Sugar = 0
    @IBOutlet weak var TitleOutlet: UILabel!
    @IBOutlet weak var CupSizeOutlet: UILabel!
    @IBOutlet weak var CupSize: UISegmentedControl!
    @IBOutlet weak var coffeePrecent: UILabel!
    @IBOutlet weak var coffeeSlider: UISlider!
    @IBOutlet weak var FoamedMilkPrecent: UILabel!
    @IBOutlet weak var FoamedMilkSlider: UISlider!
    @IBOutlet weak var SteamedMilkPrecent: UILabel!
    @IBOutlet weak var SteamedMilkSlider: UISlider!
    @IBOutlet weak var SugarOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleOutlet.text = coffeeName
        UpdatePrice = BasePrice
    }
 
    @IBAction func Cupsize(sender: UISegmentedControl) {
        switch CupSize.selectedSegmentIndex {
        case 0:
            UpdatePrice = BasePrice + 0
        case 1:
            UpdatePrice = BasePrice + 20
        case 2:
            UpdatePrice = BasePrice + 30
        case 3:
            UpdatePrice = BasePrice + 40
        default:
            break;
        }
        CupSizeOutlet.text = CupSize.titleForSegment(at: CupSize.selectedSegmentIndex)
    }
    @IBAction func FoamedButton(_ sender: UISlider)  {
        let Precentage = String(format:"%.0f",sender.value)
        switch sender.tag {
        case 0:
            coffeePrecent.text = "\(Precentage) %"
        case 1:
            FoamedMilkPrecent.text = "\(Precentage) %"
        case 2:
            SteamedMilkPrecent.text = "\(Precentage) %"
        default:
            break
        }
        
    }
    
    @IBAction func ValueChangeSugar(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if (Sugar > 0) {
            Sugar-=1
            }
        case 1:
            Sugar+=1
        default:
            break
        }
        SugarOutlet.text = String(Sugar)
    }
    
    @IBAction func OrderCoffee(_ sender: Any) {
        self.performSegue(withIdentifier: "ToPage3", sender: self)
    }
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToPage3" {
            let destinetionVc = segue.destination as! ViewControllerPage3
            destinetionVc.CoffeeType = TitleOutlet.text!
            destinetionVc.CupSize = CupSizeOutlet.text!
            destinetionVc.Price = UpdatePrice
            destinetionVc.coffeePrecentage = coffeePrecent.text!
            destinetionVc.foamedPrecentage = FoamedMilkPrecent.text!
            destinetionVc.steamedMilkPrecentage = FoamedMilkPrecent.text!
        }
    }
}
