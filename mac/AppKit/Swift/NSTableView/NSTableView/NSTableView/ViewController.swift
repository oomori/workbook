//
//  ViewController.swift
//  NSTableView
//
//  Created by air on 2015/03/26.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSWindowDelegate,NSTableViewDelegate,NSTableViewDataSource {
//Swift1.2
    var windowArray : NSMutableArray = []
    var dataArray : NSMutableArray = []
    
    //NSTableView
    func buttonAction001(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
    }
    @IBAction func function001(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction001:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //テーブルビューを作成
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のテーブルビュー
        var theTableView : NSTableView = NSTableView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //列
        var tableColumn1 : NSTableColumn = NSTableColumn(identifier: "col1")
        var tableColumn2 : NSTableColumn = NSTableColumn(identifier: "col2")
        tableColumn1.width = 170
        tableColumn2.width = 130
        //列をテーブルにセット
        theTableView.addTableColumn(tableColumn1)
        theTableView.addTableColumn(tableColumn2)
        //データソースとデリゲートをセット
        var dataObj : TableData001 = TableData001()
        dataArray.addObject(dataObj)
        
        theTableView.setDataSource(dataObj )
        theTableView.setDelegate(dataObj )
        theTableView.reloadData()
        
        scrollView.documentView = theTableView
        scrollView.hasVerticalRuler = true
        aWindow.contentView.addSubview(scrollView)
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    //NSTableView
    //Swift1.2
    func buttonAction002(sender: AnyObject){
        var theWindow : NSWindow = (sender as! NSButton).window!
    }
    @IBAction func function002(sender: AnyObject) {
        var aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            defer:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        var theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Set"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction002:")
        theButton.target = self
        aWindow.contentView.addSubview(theButton)
        
        //ボタンの制約設定
        //falseを設定する
        theButton.translatesAutoresizingMaskIntoConstraints = false

        //先にaddSubviewする
        aWindow.contentView.addSubview(theButton)
        
        var viewDictionary:Dictionary = ["theButton": theButton]
        
        var constraints:NSMutableArray = NSMutableArray()
        
        //横方向の制限
        //ボタン真ん中に
        var constraintFormat1:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[theButton]-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary)
        constraints.addObjectsFromArray(constraintFormat1)
       
        aWindow.contentView.addConstraints(constraints as [AnyObject])
        
        
        
        
        
        
        //テーブルビューを作成
        //まずはスクロールビュー
        var scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のテーブルビュー
        var theTableView : NSTableView = NSTableView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //列
        var tableColumn1 : NSTableColumn = NSTableColumn(identifier: "col1")
        var tableColumn2 : NSTableColumn = NSTableColumn(identifier: "col2")
        tableColumn1.width = 170
        tableColumn2.width = 130
        //列をテーブルにセット
        theTableView.addTableColumn(tableColumn1)
        theTableView.addTableColumn(tableColumn2)

        //効いてない？

        scrollView.autoresizesSubviews = true
        theTableView.autoresizingMask = ( .ViewWidthSizable | .ViewHeightSizable )
        
        //データソースとデリゲートをセット
        var dataObj : TableData002 = TableData002()
        dataArray.addObject(dataObj)
        
        theTableView.setDataSource(dataObj )
        theTableView.setDelegate(dataObj )
        theTableView.reloadData()
        
        scrollView.documentView = theTableView
        scrollView.hasVerticalRuler = true
        aWindow.contentView.addSubview(scrollView)
        
        //テーブルの制約設定
        //falseを設定する
        //スクロールビューの制約を手動に
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        //ウインドウに対するスクロールビューの制約
        var scrollViewConstraints : NSMutableArray = NSMutableArray()
        var viewDictionary3 : Dictionary = ["scrollView": scrollView]
        var scrollViewConstraintV:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(11)-[scrollView]-(20)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        scrollViewConstraints.addObjectsFromArray(scrollViewConstraintV)
        //横の制約　スクロールビューが親ビューに対して
        var scrollViewConstraintH:[AnyObject] =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(11)-[scrollView]-(20)-|",
            options : NSLayoutFormatOptions(0),
            metrics: nil,
            views: viewDictionary3)
        scrollViewConstraints.addObjectsFromArray(scrollViewConstraintH)

        //ウインドウに対するスクロールビューの制約の追加
        aWindow.contentView.addConstraints(scrollViewConstraints as [AnyObject])

        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

