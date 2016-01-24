//
//  TestLevel.swift
//  StockFighter
//
//  Created by Nathan Arnold on 1/23/16.
//  Copyright © 2016 Nathan Arnold. All rights reserved.
//

import Foundation


struct TestLevel {
    
    let account = BrokerageAccount(venue:"TESTEX", account:"EXB123456")
    
    func start () {
        
       let order = account.order("FOOBAR", price: 100, quantity: 100, direction: .Buy, type: .Market)
        
        account.execute(order) { (order) -> Void in
            print(order)
        }
        
        
    }
    
}