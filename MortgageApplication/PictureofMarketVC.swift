//
//  PictureofMarketVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/26/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class PictureofMarketVC: UIViewController {
    
    var preCloseCost = 0.03
    var preAgentFee = 0.06
    var preHoldCost = 0.05
    var preProfit = 0.15
    
    
    
    
    //Decleration of variables used in this VC
    
    var currentPriceValue = 0
    var currentRepairsValue = 0
    var value = 0
    var offerBool = false
    var downpaymentToPass = 0.0
    var canGoToMonthly = false
    var goingToSettings = false
    
    
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
        // Do any additional setup after loading the view. yes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MainViewTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
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
            repairsGlobal = currentRepairsValue
        }
        displayAll()
    }
    
    @IBAction func CalcBtnPressed(_ sender: Any) {
        canGoToMonthly = true
        performSegue(withIdentifier: "goToMonthlyPay", sender: nil)
    }
    
    @IBAction func financeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "pictureToFinance", sender: nil)
    }
    
    
    //Settings Button
    @IBAction func SettingsBtn(_ sender: Any) {
        performSegue(withIdentifier: "pictureToSettings", sender: nil)
        
        UserDefaults.standard.set(currentPriceValue, forKey: "priceValue")
    }
    

    
    func update()
    {
        if (UserDefaults.standard.object(forKey: "closeCost") != nil)
        {
            preCloseCost = UserDefaults.standard.object(forKey: "closeCost") as! Double
        }
        
        if (UserDefaults.standard.object(forKey: "agentFee") != nil)
        {
            preAgentFee = UserDefaults.standard.object(forKey: "agentFee") as! Double
        }
        
        if (UserDefaults.standard.object(forKey: "holdCost") != nil)
        {
            preHoldCost = UserDefaults.standard.object(forKey: "holdCost") as! Double
        }
        
        if (UserDefaults.standard.object(forKey: "profit") != nil)
        {
            preProfit = UserDefaults.standard.object(forKey: "profit") as! Double
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Function to Display the final amounts on the bottom labels
    
    func displayAll()
    {
        
        if (closecostGlobal != 0.0)
        {
            preCloseCost = closecostGlobal
        }
        
        
        
        //Change
        let tempCloseCost = ((Double(currentPriceValue)) * preCloseCost)
        let tempAgentFee = ((Double(currentPriceValue)) * preAgentFee)
        let tempNet = (Double(currentPriceValue) - tempCloseCost - tempAgentFee - (Double(currentRepairsValue)))
        let tempHoldingCost = ((Double(currentPriceValue)) * preHoldCost)
        let tempProfit = ((Double(currentPriceValue)) * preProfit)
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
            
            offerGlobal = Int(Double(tempOffer))
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
        if (offerLabel.text != "")
        {
        
        }
    }
    
    

        
    }

    



    


