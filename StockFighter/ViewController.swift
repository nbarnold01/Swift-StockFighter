//
//  ViewController.swift
//  StockFighter
//
//  Created by Nathan Arnold on 1/22/16.
//  Copyright © 2016 Nathan Arnold. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
    }

    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        let level = TestLevel()
        level.start();
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

