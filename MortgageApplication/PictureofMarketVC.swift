//
//  PictureofMarketVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/26/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class PictureofMarketVC: UIViewController {
    
    //Decleration of variables used in this VC
    
    var currentPriceValue = 0
    var currentSqrFootage = 0
    var currentRepairsValue = 0
    var value = 0
    
    
    //Declerations of outlets
    
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var sqrFootageSlider: UISlider!
    @IBOutlet weak var sqrFootageLabel: UILabel!
    @IBOutlet weak var repairsSlider: UISlider!
    @IBOutlet weak var repairsLabel: UILabel!
    
    //Outlets for the bottom display labels
    
    @IBOutlet weak var closingCostLabel: UILabel!
    @IBOutlet weak var pricePerSqrFootLabel: UILabel!
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
    
    
    
    //Slider Actions
    
    @IBAction func priceSliderChanged(_ sender: UISlider) {
        
        var value = Int(priceSlider.value)
        
        if (value == 0)
        {
            value = value + 30000
        }
        
        else if ((value * 2500) + 30000 <= 100000)
        {
            value = (value * 2500) + 30000
        }
        
        else
        {
            value = (value * 5000) + 30000
        }
        
        
        PriceLabel.text = "\(value)"
        currentPriceValue = value
        
        displayAll()
        
        
    }
    
    @IBAction func sqrFootageSliderChanged(_ sender: UISlider) {
        
        var value = Int(sqrFootageSlider.value)
        
        if (value * 100 <= 10000)
        {
            value = value * 100
        }
        
        
        currentSqrFootage = value
        sqrFootageLabel.text = "\(currentSqrFootage)"
        
        displayAll()
        
        
    }

    @IBAction func repairsSliderAction(_ sender: UISlider) {
        
        currentRepairsValue = Int(repairsSlider.value)
        
        if (currentRepairsValue * 1000 <= 100000)
        {
            currentRepairsValue = currentRepairsValue * 1000
        }
        
        repairsLabel.text = "\(currentRepairsValue)"
        
        displayAll()
        
    }
    
    
    //Function to Display the final amounts on the bottom labels
    
    func displayAll()
    {
    
        let tempCloseCost = ((Double(currentPriceValue)) * 0.03)
        let tempAgentFee = ((Double(currentPriceValue)) * 0.06)
        let tempNet = (Double(currentPriceValue) - tempCloseCost - tempAgentFee - (Double(currentRepairsValue)))
        let tempHoldingCost = (tempNet * 0.05)
        let tempProfit = (tempNet * 0.15)
        
        if (currentPriceValue != 30000 && currentSqrFootage != 0 && currentRepairsValue != 0)
        {
            pricePerSqrFootLabel.text = ("Price/SqrFt = " + "\(currentPriceValue/currentSqrFootage)")
            
            closingCostLabel.text = ("Closing Cost = " + "\(tempCloseCost)")
            
            agentFeeLabel.text = ("Agent Fee = " + "\(tempAgentFee)")
            
            netLabel.text = ("Net Value = " + "\(tempNet)")
            
            closingCost2Label.text = ("Closing Cost = " + "\(tempNet * 0.03)")
            
            holdingCostLabel.text = ("Holding Cost = " + "\(tempHoldingCost)")
            
            profitLabel.text = ("Profit = " + "\(tempProfit)")
            
            offerLabel.text = ("Offer = " + "\(tempNet - tempCloseCost - tempHoldingCost - tempProfit)")
        }
        
        else
        {
            //Tester
            pricePerSqrFootLabel.text = ""
            closingCostLabel.text = ""
            agentFeeLabel.text = ""
            netLabel.text = ""
            closingCost2Label.text = ""
            holdingCostLabel.text = ""
            profitLabel.text = ""
            offerLabel.text = ""
        }
    }

    
        
    }
    
    



    


