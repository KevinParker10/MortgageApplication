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
        super.viewDidLoad()//change
        
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
    @IBOutlet weak var investBtn: UIButton!
    
    
    
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
    
    
    
    //Actions for the tab bar buttons
    @IBAction func investBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "goToPictureofMarket", sender: nil)
    }
    
    


        func monthlyPaymentCalc()
        {
        //print("Got to the method")
        var interest = Double(interestField.text!)
        var downPaymentPercentage = Double(downPaymentPer.text!)
        var lengthofMor = Double(termField.text!)
        var principalAmnt = Double(offerField.text!)
            
            if (downPaymentPercentage != 0)
            {
                downPaymentPercentage = downPaymentPercentage! / 100
                let downpayment = principalAmnt! * downPaymentPercentage!
                downPaymentField.text = ("\(downpayment)")
            }

        if (interestField.hasText && termField.hasText && offerField.hasText)
        {
            let closingCost = principalAmnt! * 0.03
            let downpayment = principalAmnt! * downPaymentPercentage!
            principalAmnt = principalAmnt! + closingCost - downpayment
            lengthofMor! = lengthofMor! * 12
            interest = (interest! / 100) / 12
    
            let numerator = (principalAmnt! * (interest! * pow((1+interest!),lengthofMor!)))
            let denominator = (pow((1+interest!),lengthofMor!) - 1 )
            
            var monthlyPay = numerator/denominator
            monthlyPay = monthlyPay * 12
            monthlyPay = Double(round(100 * monthlyPay)/100)
            
            //monthlyPay = round(monthlyPay * 100) / 100
        
            annualPayLabel.text = "\(monthlyPay)"
        }
            
        else{
            annualPayLabel.text = "Invalid Entry"
        }
        

    }

}

