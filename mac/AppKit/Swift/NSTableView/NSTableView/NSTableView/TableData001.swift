//
//  TableData002.swift
//  NSTableView
//
//  Created by air on 2015/03/26.
//  Copyright (c) 2015年 oomori. All rights reserved.
////Swift1.2

import Cocoa

    class TableData002: NSObject , NSApplicationDelegate , NSTableViewDelegate,NSTableViewDataSource {
        
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
            var newString: (AnyObject?) = getDataArray().objectAtIndex(row).objectForKey(tableColumn!.identifier)
            return newString
        }
        
        func getDataArray () -> NSArray{
            var dataArray:[NSDictionary] = [["col1": "和蘭陀", "col2": "おらんだ"],
                ["col1": "西班牙", "col2": "すぺいん"],
                ["col1": "亜米利加", "col2": "あめりか"],
                ["col1": "独逸", "col2": "どいつ"],
                ["col1": "露西亜", "col2": "ろしあ"]]
            //NSLog("%@", dataArray.description)
            return dataArray
        }
        
        
}
