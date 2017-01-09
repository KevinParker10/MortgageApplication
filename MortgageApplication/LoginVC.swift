//
//  LoginVC.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 12/17/16.
//  Copyright © 2016 Kevin Parker. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    @IBAction func submitPressed(_ sender: Any) {
        
        if (loginField.text == "admin" && passField.text == "admin")
        {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        else{
            loginField.text = "invalid"
            passField.text = "invalid"
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
