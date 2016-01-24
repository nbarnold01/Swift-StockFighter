//
//  BrokerageAccountAPI.swift
//  StockFighter
//
//  Created by Nathan Arnold on 1/22/16.
//  Copyright © 2016 Nathan Arnold. All rights reserved.
//

import Cocoa
import Alamofire

class BrokerageAccountAPIClient: NSObject {
    
    let APIKey = "3eebef2baab7930779161b640ed3595242ec199e"
    let baseURL = "https://api.stockfighter.io/ob/api"
    let headers : Dictionary <String , String>
    let manager = Alamofire.Manager.sharedInstance
    
    override init() {
        
        // Add API key header to all requests make with this manager (i.e., the whole session)
        headers = ["X-Starfighter-Authorization" : APIKey]

    }
    

    func process(var order:Order, forAccount account:BrokerageAccount, completionHandler:((order:Order)->Void)) {
        
        let urlStr = baseURL + "/venues/" + account.venue + "/stocks/" + order.symbol + "/orders"
        
        let url = NSURL(string:urlStr)!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(APIKey, forHTTPHeaderField: "X-Starfighter-Authorization")
        
        request.HTTPBody = order.jsonObject()
        
        
        
        let httpRequest = Alamofire.request(request)

        httpRequest.responseJSON { (response) -> Void in
            print(response)
            // do whatever you want here
            switch response.result {
            case .Failure(let error):
                print(error)
            case .Success(let responseObject):
                print(responseObject)
                order.executed = true

            }
        }
        
        
        completionHandler(order: order)
    }
    
}
