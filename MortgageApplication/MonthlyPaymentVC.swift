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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var mortgagePriceSlider: UISlider!
    @IBOutlet weak var interestRateSlider: UISlider!
    @IBOutlet weak var lengthofMortgageSlider: UISlider!
    
    @IBOutlet weak var monthlyPayLabel: UILabel!
    
    
    @IBOutlet weak var mortgagePriceLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    var currentPriceSlider = 0
    var currentInterest = 0.0
    var currentLength = 0
    var priceValue = 0
    var interestValue = 0.0
    var lengthValue = 0
    
    
    
    @IBAction func PriceSliderAction(_ sender: UISlider) {
        
        
        priceValue = Int(mortgagePriceSlider.value)
        
        if (priceValue == 0)
        {
            priceValue = priceValue + 30000
        }
            
        else if ((priceValue * 2500) + 30000 <= 100000)
        {
            priceValue = (priceValue * 2500) + 30000
        }
            
        else
        {
            priceValue = (priceValue * 5000) + 30000
        }
        
        mortgagePriceLabel.text = ("\(priceValue)")
        
        currentPriceSlider = priceValue
        
        monthlyPaymentCalc()
    }
    
    
    @IBAction func interestRateSliderAction(_ sender: UISlider) {
        
        var interestValue = (interestRateSlider.value)
        interestValue = interestValue/20
        //let valueString = NSString(format:"%.2f", (String(value)))
        interestValue = round(interestValue * 100)/100
        
        interestRateLabel.text = ("\(interestValue)")
        
        currentInterest = Double(interestValue)
        
        monthlyPaymentCalc()
        
    }
    
    @IBAction func lengthSliderAction(_ sender: UISlider) {
        
        var lengthValue = Int(lengthofMortgageSlider.value)
        
        lengthValue *= 5
        
        lengthLabel.text = ("\(lengthValue)")
        
        currentLength = lengthValue
        
        monthlyPaymentCalc()
    }
    
    
    
    
    
        func monthlyPaymentCalc()
        {
            
            
        var interest = Double(currentInterest)
        //var months = 0.0
        let lengthofMor = Double(currentLength)
        let principalAmnt = Double(currentPriceSlider)

        if (interest != 0 || lengthofMor != 0 || principalAmnt != 0)
        {
            let months = lengthofMor * 12
            interest = (interest / 100) / 12
    
            let numerator = (principalAmnt * (interest * pow((1+interest),lengthofMor)))
            let denominator = (pow((1+interest),lengthofMor) - 1 )
            
            let monthlyPay = numerator/denominator
            
            //monthlyPay = round(monthlyPay * 100) / 100
        
            monthlyPayLabel.text = "\(monthlyPay)"
        }
        else{
            monthlyPayLabel.text = "Invalid Entry"
        }
    }

}

