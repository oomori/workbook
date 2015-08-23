//
//  MyDrawer.swift
//  NSDrawer
//
//  Created by air on 2015/04/05.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class MyDrawer: NSDrawer {

    override func close(sender: AnyObject?) {
        super.close(sender)
        if (sender != nil) {
        NSLog("close: %@",sender!.description)
        }
    }
    
}
