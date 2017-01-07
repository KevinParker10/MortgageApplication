//
//  Model.swift
//  MortgageApplication
//
//  Created by Kevin Parker on 1/6/17.
//  Copyright © 2017 Kevin Parker. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var closingCostPercentage:Double = 0.03
    var holdingCostPrecentage:Double = 0.06
    
    func setCloseCost(closeingCostToBe:Double){
        closingCostPercentage = closeingCostToBe
    }
    
    
    func getCloseCost() -> Double{
        return closingCostPercentage
        
    }
    
    func getHoldCost() ->Double{
        return holdingCostPrecentage
    }
    
    
}
