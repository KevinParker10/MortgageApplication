//
//  MonthlyPaymentVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/19/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class MonthlyPaymentVc: UIViewController {

    @IBOutlet weak var interestField: UITextField!
    @IBOutlet weak var lengthField: UITextField!
    @IBOutlet weak var princAmountField: UITextField!
    @IBOutlet weak var monthlyPaymentBtn: UIButton!
    
    @IBOutlet weak var monthlyPaymentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func monthlyPaymentCalc(_ sender: AnyObject) {
        var interest = Double(interestField.text!)
        var months = 0.0
        let lengthofMor = Double(lengthField.text!)
        //Make this take Commas in the input
        let principalAmnt = Double(princAmountField.text!)

        if (interest != nil || lengthofMor != nil || principalAmnt != nil)
        {
            months = lengthofMor! * 12
            interest = interest! / 100
    
            var monthlyPay = ((interest! * pow((1 + interest!),months)) / (pow((1 + interest!),months)-1))
            monthlyPay = monthlyPay * principalAmnt!
        
            monthlyPaymentLabel.text = "\(monthlyPay)"
        }
        else{
            monthlyPaymentLabel.text = "Invalid Entry"
        }
        
    }
    
    

}

