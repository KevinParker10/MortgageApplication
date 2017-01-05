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
        
        UserDefaults.standard.set(closeCostPer, forKey: "closeCost")
        UserDefaults.standard.synchronize()

        if (UserDefaults.standard.object(forKey: "closeCost") != nil)
        {
            closeCostPer = UserDefaults.standard.object(forKey: "closeCost") as! Double!
           
        } else{
            closeCostPer = 0.03
        }
        
        if (UserDefaults.standard.object(forKey: "agentFee") != nil)
        {
            agentFeePer = UserDefaults.standard.object(forKey: "agentFee") as! Double!
        } else{
            agentFeePer = 0.06
        }
        
        if (UserDefaults.standard.object(forKey: "holdCost") != nil)
        {
            holdCostPer = UserDefaults.standard.object(forKey: "holdCost") as! Double!
        } else{
            holdCostPer = 0.05
        }
        
        if (UserDefaults.standard.object(forKey: "profit") != nil)
        {
            profitPer = UserDefaults.standard.object(forKey: "profit") as! Double!
        } else{
            profitPer = 0.15
        }
        
        if (UserDefaults.standard.object(forKey: "downPay") != nil)
        {
            dwnPayPer = UserDefaults.standard.object(forKey: "downPay") as! Double!
        } else{
            dwnPayPer = 0.20
        }
        
        if (UserDefaults.standard.object(forKey: "VacancyPer") != nil)
        {
            vacancyPer = UserDefaults.standard.object(forKey: "VacancyPer") as! Double!
        } else{
            vacancyPer = 0.10
        }
        
        if (UserDefaults.standard.object(forKey: "property") != nil)
        {
            PropManPer = UserDefaults.standard.object(forKey: "property") as! Double!
        } else{
            PropManPer = 0.10
        }
        
        
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
        
        UserDefaults.standard.set(closeCostPer, forKey: "closeCost")
        UserDefaults.standard.synchronize()
        
        
        
    }
    
    @IBAction func AgentFeeAction(_ sender: Any) {
        agentFeePer = Double(agentFeeField.text!)
        agentFeePer = agentFeePer / 100
        
        UserDefaults.standard.set(agentFeePer, forKey: "agentFee")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func holdCostAction(_ sender: Any) {
        holdCostPer = Double(holdingField.text!)
        holdCostPer = holdCostPer / 100
        
        UserDefaults.standard.set(holdCostPer, forKey: "holdCost")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func profitFieldAction(_ sender: Any) {
        profitPer = Double(proftField.text!)
        profitPer = profitPer / 100
        
        UserDefaults.standard.set(profitPer, forKey: "profit")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func downPayAction(_ sender: Any) {
        dwnPayPer = Double(dwnPayField.text!)
        dwnPayPer = dwnPayPer / 100
        
        UserDefaults.standard.set(dwnPayPer, forKey: "downPay")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func vacancyAction(_ sender: Any) {
        vacancyPer = Double(vacancyField.text!)
        vacancyPer = vacancyPer / 100
        
        UserDefaults.standard.set(vacancyPer, forKey: "VacancyPer")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func PropAction(_ sender: Any) {
        PropManPer = Double(propertyField.text!)
        PropManPer = PropManPer / 100
        
        UserDefaults.standard.set(PropManPer, forKey: "Property")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        PictureofMarketVC().update()
    }
    
    

 

}
