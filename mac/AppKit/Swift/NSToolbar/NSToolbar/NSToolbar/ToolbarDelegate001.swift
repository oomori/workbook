//
//  YoolbarDelegate001.swift
//  NSToolbar
//
//  Created by air on 2015/03/30.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ToolbarDelegate001: NSObject,NSToolbarDelegate {
    
    func toolBarAction001(sender: AnyObject){
        NSLog("!!!")
    }
    
    //NSToolbarDelegate にはこの3つのメソッドが必要
    var toolBarArray : [String] = ["toolBarItem1",NSToolbarSeparatorItemIdentifier,"SearchDocToolbarItemIdentifier"]
    func toolbarAllowedItemIdentifiers(toolbar: NSToolbar) -> [AnyObject] {
        return toolBarArray
    }
    func toolbarDefaultItemIdentifiers(toolbar: NSToolbar) -> [AnyObject] {
        return toolBarArray
    }
    func toolbar(toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: String, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        var aToolBarItem : NSToolbarItem = NSToolbarItem()
        if ( itemIdentifier == "SearchDocToolbarItemIdentifier"){
            
            aToolBarItem  = NSToolbarItem(itemIdentifier: "SearchDocToolbarItemIdentifier")
            aToolBarItem.label = "Search"
            aToolBarItem.paletteLabel = "Search"
            aToolBarItem.toolTip = "Search item"
            
            //検索
            let searchFieldOutlet : NSSearchField = NSSearchField(frame: NSMakeRect(0.0, 0.0, 100.0,30.0))
            aToolBarItem.view = searchFieldOutlet
            
            
        }else if( itemIdentifier == "toolBarItem1" ){
            aToolBarItem = NSToolbarItem(itemIdentifier: "toolBarItem1")
            aToolBarItem.label = "item 1"
            aToolBarItem.paletteLabel = "item 1"
            aToolBarItem.toolTip = "toolbar item 1 "
            aToolBarItem.image = NSImage(named: "toolbarImage")
            aToolBarItem.action = Selector("toolBarAction001:")
            aToolBarItem.target = self
        }else{
            
        }
        return aToolBarItem
    }
    
}
