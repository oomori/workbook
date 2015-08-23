//
//  TableData002.swift
//  NSTableView
//
//  Created by air on 2015/03/26.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

    class TableData001: NSObject , NSApplicationDelegate , NSTableViewDelegate,NSTableViewDataSource {
        
        var dataArray:[NSMutableDictionary] = []
        
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
        //テーブルコラムをクリック
        func tableView(tableView: NSTableView, didClickTableColumn tableColumn: NSTableColumn) {
            //NSLog("click table !!!%@", tableColumn.description)
            //NSLog("click table !!!%@", tableColumn.identifier)
            var newAscending : Bool = false
            if ( tableColumn.sortDescriptorPrototype != nil ){
                NSLog("click table !!!%@", tableColumn.sortDescriptorPrototype!.description)
                if tableColumn.sortDescriptorPrototype!.ascending {
                    NSLog("↑")
                    newAscending = false
                }else{
                    NSLog("↓")
                    newAscending = true
                }
            }
            //ソートデスクリプタを作る
            //tableColumn.identifierは、カラムのID (e.g. col1)
            let sortDesc : NSSortDescriptor = NSSortDescriptor(key: tableColumn.identifier, ascending: newAscending ,selector:Selector("localizedCompare:"))
            let sortDescArray : [NSSortDescriptor] = [sortDesc]
            tableView.sortDescriptors = sortDescArray
            
            //カラムにソートデスクリプタをセット昇順だと ^ が表示される
            tableColumn.sortDescriptorPrototype = sortDesc
            
            dataArray = (dataArray as NSArray).sortedArrayUsingDescriptors(sortDescArray) as! [NSMutableDictionary]
            tableView.reloadData()
            
        }

        //sort descriptorが変更された場合
        func tableView(aTableView: NSTableView,
            sortDescriptorsDidChange oldDescriptors: [AnyObject]){
                NSLog("sort desc change")
                
        }
        
        func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
            var newString: (AnyObject?) = getDataArray().objectAtIndex(row).objectForKey(tableColumn!.identifier)
            return newString
        }
        
        //セル編集終了
        func control(control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
            NSLog("textShouldEndEditing !!!%@ , %@", control.description, fieldEditor.string!)
            return true
        }
        
        func getDataArray () -> NSArray{

            return dataArray
        }
        
        
}
