//
//  Trade.swift
//  StockFighter
//
//  Created by Nathan Arnold on 1/22/16.
//  Copyright © 2016 Nathan Arnold. All rights reserved.
//

import Cocoa

enum OrderDirection : String {
    case Buy = "buy"
    case Sell = "sell"
};

enum OrderType : String {
    case Limit = "limit"
    case Market = "market"
    case FillOrKill = "fill-or-kill" //A limit order which has a special rule: it is for immediate execution on an all-or-nothing basis
    case ImmediateOrCancel = "immediate-or-cancel" //Like a fill-or-kill order, except while it executes immediately, it accepts partial execution
};


struct Order {

    var symbol:String
    var price:Int
    var quantity:Int
    var direction:OrderDirection
    var type:OrderType
    var account:String
    var venue:String
    var executed:Bool = false
    
    init (symbol:String, price:Int, quantity:Int, direction:OrderDirection, type:OrderType, account:String, venue:String){
            
            self.symbol = symbol
            self.price = price
            self.quantity = quantity
            self.direction = direction
            self.type = type
            self.account = account
            self.venue = venue
    }
    
    
    func jsonObject()-> NSData {
        
        let dict = dictionaryObject();
        let json = try! NSJSONSerialization.dataWithJSONObject(dictionaryObject(), options: NSJSONWritingOptions.PrettyPrinted)
        
        return json
    }
    
    func dictionaryObject() -> Dictionary <String, AnyObject> {
        return ["symbol":self.symbol,
        "price":self.price,
        "qty":self.quantity,
            "direction":self.direction.rawValue,
            "orderType":self.type.rawValue,
            "account":self.account,
            "venue":self.venue,
        ]
    }
}
