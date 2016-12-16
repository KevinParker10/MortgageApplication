//
//  MonthlyPaymentVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/19/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class MonthlyPaymentVc: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerField.text = passedOffer
        
    }
    
    //Receiveing the variables that are passed from the PictureOfMarketVC
    var passedOffer:String!


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var offerField: UITextField!
    @IBOutlet weak var downPaymentField: UITextField!
    @IBOutlet weak var interestField: UITextField!
    @IBOutlet weak var termField: UITextField!
    @IBOutlet weak var annualPayLabel: UILabel!
    
    func displayValues()
    {
        MonthlyPaymentVc().offerField.text = "Hello"
    }
    

        func monthlyPaymentCalc()
        {
            
            offerField.text = (passedOffer)
            
        var interest = Double(interestField.text!)
        //var months = 0.0
        let lengthofMor = Double(termField.text!)
        let principalAmnt = Double(offerField.text!)

        if (interest != 0 || lengthofMor != 0 || principalAmnt != 0)
        {
            //var months = lengthofMor! * 12
            interest = (interest! / 100) / 12
    
            let numerator = (principalAmnt! * (interest! * pow((1+interest!),lengthofMor!)))
            let denominator = (pow((1+interest!),lengthofMor!) - 1 )
            
            let monthlyPay = numerator/denominator
            
            //monthlyPay = round(monthlyPay * 100) / 100
        
            annualPayLabel.text = "\(monthlyPay)"
        }
        else{
            annualPayLabel.text = "Invalid Entry"
        }
    }

}

