//
//  PictureofMarketVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/26/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class PictureofMarketVC: UIViewController {
    
    
    
    //Try Catch blocks to try to grab the values from the settings tab, if catch occurs, it sets the defaults that are also set in the settiongs view controller
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Decleration of variables used in this VC
    
    var currentPriceValue = 0
    var currentRepairsValue = 0
    var value = 0
    var offerBool = false
    var downpaymentToPass = 0.0
    var canGoToMonthly = false
    
    
    //Declerations of outlets
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var repairsField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var financeBtn: UIButton!
    
    //Decleration of outlets that are for description of values
    
    
    
    //Outlets for the bottom display labels
    
    @IBOutlet weak var closingCostLabel: UILabel!
    @IBOutlet weak var agentFeeLabel: UILabel!
    @IBOutlet weak var netLabel: UILabel!
    @IBOutlet weak var closingCost2Label: UILabel!
    @IBOutlet weak var holdingCostLabel: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //text field actions
    
    @IBAction func priceEditingChanged(_ sender: Any) {
        if (priceField.text! != "")
        {
            currentPriceValue = Int(priceField.text!)!
            
        }
        displayAll()
    }
    
    
    @IBAction func repairsEditingChanged(_ sender: Any) {
        if(repairsField.text! != "")
        {
            
            currentRepairsValue = Int(repairsField.text!)!
        }
        displayAll()
    }
    
    @IBAction func CalcBtnPressed(_ sender: Any) {
        canGoToMonthly = true
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "goToMonthlyPay", sender: nil)
    }
    
    @IBAction func financeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "pictureToFinance", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    

    
    
    
    //Function to Display the final amounts on the bottom labels
    
    func displayAll()
    {
        //Change
        let tempCloseCost = ((Double(currentPriceValue)) * 0.03)
        let tempAgentFee = ((Double(currentPriceValue)) * 0.06)
        let tempNet = (Double(currentPriceValue) - tempCloseCost - tempAgentFee - (Double(currentRepairsValue)))
        let tempHoldingCost = ((Double(currentPriceValue)) * 0.05)
        let tempProfit = ((Double(currentPriceValue)) * 0.15)
        let tempOffer = (tempNet - tempCloseCost - tempHoldingCost - tempProfit)
        downpaymentToPass = tempOffer * 0.20
        
        if (priceField.hasText && repairsField.hasText)
        {
            
            closingCostLabel.text = ("\(tempCloseCost)")
            
            agentFeeLabel.text = ("\(tempAgentFee)")
            
            netLabel.text = ("\(tempNet)")
            
            closingCost2Label.text = ("\((Double(currentPriceValue)) * 0.03)")
            
            holdingCostLabel.text = ("\(tempHoldingCost)")
            
            profitLabel.text = ("\(tempProfit)")
            
            offerLabel.text = ("\(tempOffer)")
        }
        
        else
        {
            closingCostLabel.text = ""
            agentFeeLabel.text = ""
            netLabel.text = ""
            closingCost2Label.text = ""
            holdingCostLabel.text = ""
            profitLabel.text = ""
            offerLabel.text = ""
        }
        offerBool = true
        //MonthlyPaymentVc().displayValues()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (canGoToMonthly)
        {
        let destViewController : MonthlyPaymentVc = segue.destination as! MonthlyPaymentVc
        
        destViewController.passedOffer = offerLabel!.text
        destViewController.passedDownPayment = downpaymentToPass
        destViewController.passedRepairs = currentRepairsValue
        }
        
    }
    

        
    }

    



    


