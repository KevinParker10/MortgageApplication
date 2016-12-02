//
//  TabTwoVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 10/20/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class TabTwoVC: UIViewController {

    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var sqrFtField: UITextField!
    @IBOutlet weak var answerlabel1: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculateBtn1(_ sender: AnyObject) {
        
        let address = String(addressField.text!)
        let price = Double(priceField.text!)
        let sqrFt = Double(sqrFtField.text!)
        
//        let closingCost = price! * 0.3
//        let agentFee = price! * 0.6
//        let net = price! + sqrFt! + closingCost
//        let holdingCost = price! * 0.5
//        let profit = price! * 0.15
        
        answerlabel1.text = "Address: " + "\(address!)"
        
        
        
        
    }
    
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
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
