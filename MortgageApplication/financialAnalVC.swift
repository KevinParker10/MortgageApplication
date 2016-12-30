//
//  financialAnalVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 12/19/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class financialAnalVC: UIViewController {

    //Values Passed from other view controllers:
    
    var passedRepairs:Int!

    @IBOutlet weak var scrollViewer: UIScrollView!
    @IBOutlet weak var costAndRevenueView: UIView!
    
    
    //Declerations for the Cost and Revenue Assumptions View
    
        //Text Fields (User Inputs)
    @IBOutlet weak var contractedPriceField: UITextField!
    @IBOutlet weak var repairsField: UITextField!
    @IBOutlet weak var numOfUnitsField: UITextField!
    @IBOutlet weak var avgMonthRentField: UITextField!
    
        //Lables (Displaying text via calculations)
    @IBOutlet weak var dwnPaymentLabel: UILabel!
    @IBOutlet weak var closeCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var grossMonthRevLabel: UILabel!
    @IBOutlet weak var vacRentLossLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (passedRepairs != nil)
        {
            repairsField.text = ("\(passedRepairs)")
        }
        else{
            repairsField.text = "20000"
        }
        
        //Setting the scroll views content size to the actual size of the content that needs to be "scrollable"
        scrollViewer.contentSize.height = 2000
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Operation of Math - setting variables to be used as text in output fields
    
    @IBAction func contractPriceAction(_ sender: Any) {
        costAndRevenueAssumptions()
    }
    
    @IBAction func numOfUnitsAction(_ sender: Any) {
        NumberofUnits()
    }
    
    @IBAction func avgMonthlyRentAction(_ sender: Any) {
        NumberofUnits()
    }


    
    func costAndRevenueAssumptions()
    {
        if (contractedPriceField.text != "")
        {
        let contractedPrice = ((contractedPriceField.text!))
        let downPayment = (Int((Double(contractedPrice)! * 0.20)))
        let ClosingCost = (Int((Double(contractedPrice)! * 0.03)))
            let downPaymentInt = Int(downPayment)
            let ClosingCostInt = Int(ClosingCost)
        let total = ((Int(contractedPrice))! + ClosingCostInt - downPaymentInt)
    
        
            dwnPaymentLabel.text = ("\(downPayment)")
            closeCostLabel.text = ("\(ClosingCost)")
            totalLabel.text = ("\(total)")
        
        
        
        }
    }
    
    
    func NumberofUnits()
    {
        if (numOfUnitsField.text != "" && avgMonthRentField.text != "")
        {
            let numberOfUnits = (Double(numOfUnitsField.text!))
            let avgMonthlyRent = (Double(avgMonthRentField.text!))
            
            var grsMonthRevenue = numberOfUnits! * avgMonthlyRent!
                grsMonthRevenue *= 12
            let vacRentLoss = ((grsMonthRevenue * 0.10))
                var vacRentLossInt = Int(vacRentLoss)
                    vacRentLossInt *= 12
            
            vacRentLossLabel.text = ("\(vacRentLossInt)")
            grossMonthRevLabel.text = ("\(grsMonthRevenue)")
        }
    }
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
