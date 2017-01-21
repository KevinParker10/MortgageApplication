//
//  MonthlyPaymentVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/19/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

var closecostGlobal : Double = 0.03
var agentfeeGlobal : Double = 0.06
var holdcostGlobal :  Double = 0.05
var profitGlobal : Double = 0.15
var downPaymentGlobal : Double = 0.20
var vacRentLossGlobal : Double = 0.10
var propManagGlobal : Double = 0.10
var offerGlobal : Int = Int()
var repairsGlobal : Int = Int()
var interestGlobal : Double = Double()
var termGlobal : Int = Int()
var totalGlobal : Int = Int()

class MonthlyPaymentVc: UIViewController {
    
    
    var closingCostPercentage = 0.03
    var downPaymentPercentage = 0.20
    var offer: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerField.text = String(offerGlobal)
        downPaymentGlobal = 0.20
        downPaymentPer.text = String(Int(downPaymentGlobal * 100))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        offerField.text = String(offerGlobal)
        closingCostPercentage = closecostGlobal
        downPaymentPer.text = String(Int(downPaymentGlobal * 100))
        
        monthlyPaymentCalc()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var offerField: UITextField!
    @IBOutlet weak var downPaymentField: UITextField!
    @IBOutlet weak var interestField: UITextField!
    @IBOutlet weak var termField: UITextField!
    @IBOutlet weak var annualPayLabel: UILabel!
    @IBOutlet weak var monthlyPayLabel: UILabel!
    @IBOutlet weak var downPaymentPer: UITextField!
    @IBOutlet weak var investBtn: UIButton!
    @IBOutlet weak var financeBtn: UIButton!
    
    
    
    //Actions for if the text of the defaults is edited

    @IBAction func offerAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    @IBAction func downPaymentAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    @IBAction func interestRateAction(_ sender: Any) {
        monthlyPaymentCalc()
        interestGlobal = Double(Double(interestField.text!)! / 100)
    }
    
    @IBAction func termAction(_ sender: Any) {
        monthlyPaymentCalc()
    }
    
    



        func monthlyPaymentCalc()
        {
            
            
            
            
        var interest = Double(interestField.text!)
        downPaymentPercentage = downPaymentGlobal
        var lengthofMor = Double(termField.text!)
        var principalAmnt = Double(offerField.text!)
            
            
            if (downPaymentPercentage != 0.0)
            {
                let downpayment = principalAmnt! * downPaymentPercentage
                downPaymentField.text = ("\(downpayment)")
            }

        if (interestField.hasText && termField.hasText && offerField.hasText)
        {
            let closingCost = principalAmnt! * closingCostPercentage
            let downpayment = principalAmnt! * downPaymentPercentage
            principalAmnt = principalAmnt! + closingCost - downpayment
            lengthofMor! = lengthofMor! * 12
            interest = (interest! / 100) / 12
    
            let numerator = (principalAmnt! * (interest! * pow((1+interest!),lengthofMor!)))
            let denominator = (pow((1+interest!),lengthofMor!) - 1 )
            
            var monthlyPay = numerator/denominator
            var annualPay = monthlyPay * 12
            annualPay = Double(round(100 * annualPay)/100)
            monthlyPay = Double(round(100 * monthlyPay)/100)
            annualPayLabel.text = "\(annualPay)"
            monthlyPayLabel.text = "\(monthlyPay)"
        }
            
        else{
            annualPayLabel.text = "Invalid Entry"
        }
        

    }
    
    
    
    
    
    
    

}

