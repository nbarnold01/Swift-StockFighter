//
//  BrokerageAccount.swift
//  StockFighter
//
//  Created by Nathan Arnold on 1/22/16.
//  Copyright © 2016 Nathan Arnold. All rights reserved.
//

import Cocoa

class BrokerageAccount: NSObject {

    let venue:String
    let account:String
    var orders:Array <Order> = Array<Order>()
    let apiClient = BrokerageAccountAPIClient()
    

    init(venue:String, account:String) {
        self.venue = venue
        self.account = account
    }
    
    func order(symbol:String, price:Int, quantity:Int, direction:OrderDirection, type:OrderType ) -> Order{
        
        let order = Order(symbol: symbol, price: price, quantity: quantity, direction: direction, type: type, account: self.account, venue: self.venue)
        
        self.orders.append(order);
        return order;
    }
    
    func execute(order:Order, completionHandler:((order:Order) ->Void)) {
        
        apiClient.process(order, forAccount:self, completionHandler:completionHandler);
    }
    
}
