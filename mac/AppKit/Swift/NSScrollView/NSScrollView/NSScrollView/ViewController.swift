//
//  ViewController.swift
//  NSScrollView
//
//  Created by air on 2015/03/27.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//Swift2.0

import Cocoa

class ViewController: NSViewController {
        
        var windowArray : NSMutableArray = []
    
        //NSScrollView
        //Swift2.0
        func buttonAction001(sender: AnyObject){
            //var theWindow : NSWindow = (sender as! NSButton).window!
        }
        @IBAction func function001(sender: AnyObject) {
            let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
                styleMask:  NSTitledWindowMask |
                    NSClosableWindowMask |
                    NSMiniaturizableWindowMask |
                NSResizableWindowMask,
                backing:    .Buffered,
                `defer`:      false)
            windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
            
            //ボタンを作成
            let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
            theButton.title = "Set"
            theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
            theButton.action = Selector("buttonAction001:")
            theButton.target = self
            aWindow.contentView!.addSubview(theButton)
            
            
            
            //ボタンの制約設定
            //falseを設定する
            theButton.translatesAutoresizingMaskIntoConstraints = false
            
            //先にaddSubviewする
            aWindow.contentView!.addSubview(theButton)
            
            let viewDictionary:Dictionary = ["theButton": theButton]
            
            let constraints:NSMutableArray = NSMutableArray()
            
            //横方向の制限
            //ボタン真ん中に
            let constraintFormat1:[NSLayoutConstraint] =
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-[theButton]-|",
                options : NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: viewDictionary)
            constraints.addObjectsFromArray(constraintFormat1)
            
            aWindow.contentView!.addConstraints(constraintFormat1)
            //aWindow.contentView!.addConstraints(constraints as [AnyObject])

            
            
            
            //テーブルビューを作成
            //まずはスクロールビュー
            let scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
            //中身のイメージビュー
            let theImageView : NSImageView = NSImageView(frame: NSMakeRect(0.0,30.0,300.0,300.0))

            theImageView.image = NSImage(named: "testImage")
            
            scrollView.documentView = theImageView
            scrollView.hasVerticalRuler = true
            scrollView.hasHorizontalScroller = true
            scrollView.hasVerticalScroller = true
            scrollView.hasHorizontalRuler = true
            aWindow.contentView!.addSubview(scrollView)
            
            
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            
            //ウインドウに対するスクロールビューの制約
            let scrollViewConstraints : NSMutableArray = NSMutableArray()
            let viewDictionary3 : Dictionary = ["scrollView": scrollView]
            let scrollViewConstraintV:[AnyObject] =
            NSLayoutConstraint.constraintsWithVisualFormat(
                "V:|-(5)-[scrollView]-(30)-|",
                options : NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: viewDictionary3)
            scrollViewConstraints.addObjectsFromArray(scrollViewConstraintV)
            //横の制約　スクロールビューが親ビューに対して
            let scrollViewConstraintH:[NSLayoutConstraint] =
            NSLayoutConstraint.constraintsWithVisualFormat(
                "H:|-(5)-[scrollView]-(5)-|",
                options : NSLayoutFormatOptions(rawValue: 0),
                metrics: nil,
                views: viewDictionary3)
            scrollViewConstraints.addObjectsFromArray(scrollViewConstraintH)
            
            //ウインドウに対するスクロールビューの制約の追加
            aWindow.contentView!.addConstraints(constraintFormat1)
            
            //aWindow.contentView!.addConstraints(scrollViewConstraints as [AnyObject])
            
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

