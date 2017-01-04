//
//  SettingsVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 1/3/17.
//  Copyright © 2017 Kevin Parker. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
    }

    var canGoToFinance = false
    var canGoToPicture = false
    var fromPicture = false
    var fromFinance = false
    
    
    
        //Declerations of all UI elements
    @IBOutlet weak var closingCostField: UITextField!
    @IBOutlet weak var agentFeeField: UITextField!
    @IBOutlet weak var holdingField: UITextField!
    @IBOutlet weak var proftField: UITextField!
    @IBOutlet weak var dwnPayField: UITextField!
    @IBOutlet weak var vacancyField: UITextField!
    @IBOutlet weak var propertyField: UITextField!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var signOutBtn: UIButton!
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Class-Wide Variables that will be used in implementaion
    var closeCostPer:Double!
    var agentFeePer:Double!
    var holdCostPer:Double!
    var profitPer:Double!
    
    var dwnPayPer:Double!
    var vacancyPer:Double!
    var PropManPer:Double!
    
    
    
    
    
    //Creating of variables upon editing them
    @IBAction func ClosingCostAction(_ sender: Any) {
        closeCostPer = Double(closingCostField.text!)
        closeCostPer = closeCostPer / 100
    }
    
    @IBAction func AgentFeeAction(_ sender: Any) {
        agentFeePer = Double(agentFeeField.text!)
        agentFeePer = agentFeePer / 100
    }
    
    @IBAction func holdCostAction(_ sender: Any) {
        holdCostPer = Double(holdingField.text!)
        holdCostPer = holdCostPer / 100
    }
    
    @IBAction func profitFieldAction(_ sender: Any) {
        profitPer = Double(proftField.text!)
        profitPer = profitPer / 100
    }
    
    @IBAction func downPayAction(_ sender: Any) {
        dwnPayPer = Double(dwnPayField.text!)
        dwnPayPer = dwnPayPer / 100
    }
    
    @IBAction func vacancyAction(_ sender: Any) {
        vacancyPer = Double(vacancyField.text!)
        vacancyPer = vacancyPer / 100
    }
    
    @IBAction func PropAction(_ sender: Any) {
        PropManPer = Double(propertyField.text!)
        PropManPer = PropManPer / 100
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (fromPicture)
        {
            let destViewController : PictureofMarketVC = segue.destination as! PictureofMarketVC
        
            destViewController.preCloseCost = closeCostPer
            destViewController.preAgentFee = agentFeePer
            destViewController.preHoldCost = holdCostPer
            destViewController.preProfit = profitPer
            
        }
        
        if (canGoToFinance)
        {
            let destViewController : financialAnalVC = segue.destination as! financialAnalVC
            
            
            
            
        }
    }
 

}
