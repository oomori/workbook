//
//  TableData066.swift
//  NSWindow051
//
//  Created by air on 2015/03/26.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class TableData066: NSObject , NSApplicationDelegate , NSTableViewDelegate,NSTableViewDataSource {


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int
    {
        let numberOfRows:Int = getDataArray().count
        return numberOfRows
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject?
    {
        let newString: (AnyObject?) = getDataArray().objectAtIndex(row).objectForKey(tableColumn!.identifier)
        return newString
    }
    
    func getDataArray () -> NSArray{
        let dataArray:[NSDictionary] = [["col1": "和蘭陀", "col2": "おらんだ"],
            ["col1": "西班牙", "col2": "すぺいん"],
            ["col1": "亜米利加", "col2": "あめりか"],
            ["col1": "独逸", "col2": "どいつ"],
            ["col1": "露西亜", "col2": "ろしあ"],
            ["col1": "加奈陀", "col2": "かなだ"],
            ["col1": "越南", "col2": "べとなむ"],
            ["col1": "馬来西亜", "col2": "まれーしあ"],
            ["col1": "伯剌西爾", "col2": "ぶらじる"],
            ["col1": "柬埔寨", "col2": "かんぼじあ"],
            ["col1": "伊太利亜", "col2": "いたりあ"],
            ["col1": "仏蘭西", "col2": "ふらんす"],
        ]
        //NSLog("%@", dataArray.description)
        return dataArray
    }

    
}
