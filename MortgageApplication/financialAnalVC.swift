//
//  financialAnalVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 12/19/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class financialAnalVC: UIViewController {


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


    
    func costAndRevenueAssumptions()
    {
        if (contractedPriceField.text != "")
        {
        let contractedPrice = (Double(contractedPriceField.text!))
        let downPayment = Int(contractedPrice! * 0.20)
        let ClosingCost = Int(contractedPrice! * 0.03)
        let total = ((contractedPrice) + ClosingCost - downPayment)
    
        
            dwnPaymentLabel.text = ("\(downPayment)")
            closeCostLabel.text = ("\(ClosingCost)")
            totalLabel.text = ("\(total)")
        
        
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
