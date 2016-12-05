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
    var currentRepairsValue = 0
    var value = 0
    
    
    //Declerations of outlets
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var repairsField: UITextField!
    
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
    
    @IBAction func priceFieldAction(_ sender: Any) {
    
        if (priceField.text! != "")
        {
        currentPriceValue = Int(priceField.text!)!
        
        displayAll()
        }
        
    }
    
    @IBAction func repairsFieldAction(_ sender: Any) {
    
        if(repairsField.text! != "")
        {
        
        currentRepairsValue = Int(repairsField.text!)!
        
        displayAll()
        }
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
        
        if (currentPriceValue != 0 && currentRepairsValue != 0)
        {
            
            closingCostLabel.text = ("Closing Cost = " + "\(tempCloseCost)")
            
            agentFeeLabel.text = ("Agent Fee = " + "\(tempAgentFee)")
            
            netLabel.text = ("Net Value = " + "\(tempNet)")
            
            closingCost2Label.text = ("Closing Cost = " + "\((Double(currentPriceValue)) * 0.03)")
            
            holdingCostLabel.text = ("Holding Cost = " + "\(tempHoldingCost)")
            
            profitLabel.text = ("Profit = " + "\(tempProfit)")
            
            offerLabel.text = ("Offer = " + "\(tempNet - tempCloseCost - tempHoldingCost - tempProfit)")
        }
        
        else
        {
            closingCostLabel.text = "Closing Cost = "
            agentFeeLabel.text = "Agent Fee = "
            netLabel.text = "Net Label = "
            closingCost2Label.text = "Closing Cost = "
            holdingCostLabel.text = "Holding Cost = "
            profitLabel.text = "Profit Label = "
            offerLabel.text = "Offer = "
        }
    }

    
        
    }
    
    



    


