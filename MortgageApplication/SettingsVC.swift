//
//  SettingsVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 1/3/17.
//  Copyright © 2017 Kevin Parker. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var model = Model()
    
    var closeCoster = closecostGlobal
    var holdCoster = holdcostGlobal
    var agentFee = agentfeeGlobal
    var profiter = profitGlobal
    
    var downpayer = downPaymentGlobal
    var vacRentLooser = vacRentLossGlobal
    var propManager = propManagGlobal
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        closingCostField.text = String((Int(closecostGlobal * 100)))
        holdingField.text = String((Int(holdcostGlobal * 100)))
        agentFeeField.text = String((Int(agentfeeGlobal * 100)))
        proftField.text = String((Int(profitGlobal * 100)))
        dwnPayField.text = String((Int(downPaymentGlobal * 100)))
        vacancyField.text = String((Int(vacRentLossGlobal * 100)))
        propertyField.text = String((Int(propManagGlobal * 100)))
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
        
        closecostGlobal = closeCostPer
    }
    
    @IBAction func AgentFeeAction(_ sender: Any) {
        agentFeePer = Double(agentFeeField.text!)
        agentFeePer = agentFeePer / 100
        
        agentfeeGlobal = agentFeePer
    }
    
    @IBAction func holdCostAction(_ sender: Any) {
        holdCostPer = Double(holdingField.text!)
        holdCostPer = holdCostPer / 100
        
        holdcostGlobal = holdCostPer
    }
    
    @IBAction func profitFieldAction(_ sender: Any) {
        profitPer = Double(proftField.text!)
        profitPer = profitPer / 100
        
        profitGlobal = profitPer
    }
    
    @IBAction func downPayAction(_ sender: Any) {
        dwnPayPer = Double(dwnPayField.text!)
        dwnPayPer = dwnPayPer / 100
        
        downPaymentGlobal = dwnPayPer
    }
    
    @IBAction func vacancyAction(_ sender: Any) {
        vacancyPer = Double(vacancyField.text!)
        vacancyPer = vacancyPer / 100
        
        vacRentLossGlobal = vacancyPer
    }
    
    @IBAction func PropAction(_ sender: Any) {
        PropManPer = Double(propertyField.text!)
        PropManPer = PropManPer / 100

        propManagGlobal = PropManPer
    }
    
    

 

}
