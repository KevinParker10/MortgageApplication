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
        
        if (Double(passedOffer) != nil)
        {
        offerField.text = passedOffer
        downPaymentPer.text = "20"
        interestField.text = "5.5"
        termField.text = "20"
        downPaymentField.text = (String(passedDownPayment))
        
        monthlyPaymentCalc()
        }
        
    }
    
    //Receiveing the variables that are passed from the PictureOfMarketVC
    var passedOffer:String!
    var passedDownPayment:Double!


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var offerField: UITextField!
    @IBOutlet weak var downPaymentField: UITextField!
    @IBOutlet weak var interestField: UITextField!
    @IBOutlet weak var termField: UITextField!
    @IBOutlet weak var annualPayLabel: UILabel!
    @IBOutlet weak var downPaymentPer: UITextField!
    
    
    
    //Actions for if the text of the defaults is edited

    @IBAction func offerAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    @IBAction func downPaymentAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    @IBAction func interestRateAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    @IBAction func termAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    


        func monthlyPaymentCalc()
        {
            print("Got to the method")
        var interest = Double(interestField.text!)
        var downPaymentPercentage = Double(downPaymentPer.text!)
        let lengthofMor = Double(termField.text!)
        let principalAmnt = Double(offerField.text!)

        if (interest != 0.0 || lengthofMor != 0.0 || principalAmnt != 0.0)
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
        
        if (downPaymentPercentage != 0)
        {
            downPaymentPercentage = downPaymentPercentage! / 100
            let downpayment = principalAmnt! * downPaymentPercentage!
            downPaymentField.text = ("\(downpayment)")
            }
    }

}

