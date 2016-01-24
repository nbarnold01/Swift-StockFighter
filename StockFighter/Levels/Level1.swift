//
//  Level1.swift
//  StockFighter
//
//  Created by Nathan Arnold on 1/22/16.
//  Copyright © 2016 Nathan Arnold. All rights reserved.
//

import Cocoa

class Level1: Level {

    let account = BrokerageAccount(venue:"QLMEX", account: "BWB5611223")
    
    
    //ticker FIM
    //purchase 100 000 shares
    
    override func start() {
        

        for index in 1...10000 {
            
            let order = account.order("FBL", price: 0, quantity: 10, direction: .Buy, type: .Market)
            
            account.execute(order) { (order) -> Void in
                print(order)
            }
        }

        
        
        
    }
}