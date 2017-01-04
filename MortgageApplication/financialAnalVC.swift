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
    
    var passedRepairS:Int!
    var passedInterest:Double!
    var passedTerm:Double!
    
    var goingToSettings = false

    //Tab Buttons
    @IBAction func calcBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func investBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "financeToPicture", sender: nil)
    }
    
    //Settings Button
    @IBAction func settingsBtnPressed(_ sender: Any) {
        goingToSettings = true
        performSegue(withIdentifier: "financeToSettings", sender: nil)
    }
    
    
    
        //All views in the view controller:
    @IBOutlet weak var scrollViewer: UIScrollView!
    @IBOutlet weak var costAndRevenueView: UIView!
    @IBOutlet weak var OperatingExpensesView: UIView!
    @IBOutlet weak var financialAssumptionsView: UIView!
    
    
        //Declerations for all views
    
    //Cost and Revenue View Text Fields
    @IBOutlet weak var contractedPriceField: UITextField!
    @IBOutlet weak var repairsField: UITextField!
    @IBOutlet weak var numOfUnitsField: UITextField!
    @IBOutlet weak var avgMonthRentField: UITextField!
    
    
    //Cost and Revenue View Labels
    @IBOutlet weak var dwnPaymentLabel: UILabel!
    @IBOutlet weak var closeCostLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var grossMonthRevLabel: UILabel!
    @IBOutlet weak var vacRentLossLabel: UILabel!
    @IBOutlet weak var rentAfterVacancyLabel: UILabel!
    
    //Interest Rate Labels
    @IBOutlet weak var interestTextField: UITextField!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    
    //SecondView Text Fields
    @IBOutlet weak var repairsAndMaintField: UITextField!
    @IBOutlet weak var taxesField: UITextField!
    @IBOutlet weak var insuranceField: UITextField!
    @IBOutlet weak var utilField: UITextField!
    @IBOutlet weak var trashField: UITextField!
    
    //Second View Labels
    @IBOutlet weak var propertyManagLabel: UILabel!
    @IBOutlet weak var totalLabel2: UILabel!
    
    //Third View Labels
    @IBOutlet weak var capRateLabel: UILabel!
    @IBOutlet weak var debtServLabel: UILabel!
    @IBOutlet weak var cashFlowLabel: UILabel!
    @IBOutlet weak var roiLabel: UILabel!
    @IBOutlet weak var noiLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (passedRepairS != nil)
        {
            repairsField.text = ("\(passedRepairS!)")
        }
        else{
            repairsField.text = "20000"
        }
        
        if (passedInterest != nil)
        {
        interestTextField.text = ("\(passedInterest!)")
        }
        else {
            interestTextField.text = "5.5"
        }
        
        if (passedTerm != nil)
        {
        termLabel.text = ("\(passedTerm!)")
        }
        else{
            termLabel.text = "20"
        }
        
        //Setting the scroll views content size to the actual size of the content that needs to be "scrollable"
        scrollViewer.contentSize.height = 2650
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

    @IBAction func repairsAction(_ sender: Any) {
        OperatingExpenses()
    }

    @IBAction func taxesAction(_ sender: Any) {
        OperatingExpenses()
    }
    
    @IBAction func insuranceAction(_ sender: Any) {
        OperatingExpenses()
    }
    
    @IBAction func UtilitiesAction(_ sender: Any) {
        OperatingExpenses()
    }
    
    @IBAction func trashAction(_ sender: Any) {
        OperatingExpenses()
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
            closeCostLabel.text = ("\(ClosingCostInt)")
            totalLabel.text = ("\(total)")
        
        
        
        }
    }
    
    
    func NumberofUnits()
    {
        if (numOfUnitsField.text != "" && avgMonthRentField.text != "")
        {
            let numberOfUnits = (Double(numOfUnitsField.text!))
            let avgMonthlyRent = (Double(avgMonthRentField.text!))
            
            let grsMonthRevenue = numberOfUnits! * avgMonthlyRent!
                let grsMonthRevenueInt = Int(grsMonthRevenue)
                let grsMonthRevenueAnnual = grsMonthRevenueInt * 12
            let vacRentLoss = ((grsMonthRevenue * 0.10))
                var vacRentLossInt = Int(vacRentLoss)
                    vacRentLossInt *= 12
            let rentAfterVac = grsMonthRevenueAnnual - vacRentLossInt
                let rentAfterVacInt = Int(rentAfterVac)
            
            vacRentLossLabel.text = ("\(vacRentLossInt)")
            grossMonthRevLabel.text = ("\(grsMonthRevenueAnnual)")
            rentAfterVacancyLabel.text = ("\(rentAfterVacInt)")
        }
    }
    
    func OperatingExpenses()
    {
        if (repairsAndMaintField.text != "" && taxesField.text != "" && insuranceField.text != "" && utilField.text != "" && trashField.text != "")
        {
            let repairsAndMaint = Int(repairsAndMaintField.text!)
            let taxes = Int(taxesField.text!)
            let insurance = Int(insuranceField.text!)
            let trashRemoval = Int(trashField.text!)
            let utilities = Int(utilField.text!)
            
            var propManagInt = 0
                if (rentAfterVacancyLabel.text != "")
                {
                    var propManag = (Double(rentAfterVacancyLabel.text!))
                
                    propManag = (propManag! * 0.10)
                    propManagInt = Int(propManag!)
                    
                    propertyManagLabel.text = ("\(propManagInt)")
                }

            let total = (repairsAndMaint! + taxes! + insurance! + propManagInt + trashRemoval! + utilities!)
            
            totalLabel2.text = ("\(total)")
            
            
            
        }
        
        
        if (totalLabel2.text != "")
        {
            FinancialAssumptions()
        }
        
        
    }
    
    func FinancialAssumptions()
    {

        if (rentAfterVacancyLabel.text != "")
        {
            print ("Hello")
            let rentAfterVac = Int(rentAfterVacancyLabel.text!)
            let total1 = Int(totalLabel.text!)
            var noi = 0
            
            if (totalLabel2.text != "")
            {
            let total = Int(totalLabel2.text!)
            noi = rentAfterVac! - total!
            noiLabel.text = ("\(noi)")
            }
            
            
            if (noiLabel.text != "" && closeCostLabel.text != "")
            {
            let capRate = noi/total1!
            capRateLabel.text = ("\(capRate)")
            }
        }
        
    }
    
    
    
    
    
    
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (goingToSettings)
        {
            let destViewController : SettingsVC = segue.destination as!SettingsVC
            
            destViewController.fromFinance = true
            
        }
        
    }


}
