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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewer.contentSize.height = 1397
        if (costAndRevenueView.isHidden)
        {
            print("is hidding")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
