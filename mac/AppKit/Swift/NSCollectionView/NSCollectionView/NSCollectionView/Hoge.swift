//
//  Hoge.swift
//  NSCollectionView
//
//  Created by air on 2015/03/22.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class Hoge: NSObject {
    var name: String
    var image: NSImage!
    
    override init() {
        self.name = "test"
        self.image = NSImage(named:"test.png")
    }
}