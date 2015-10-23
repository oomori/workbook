//
//  ViewController.swift
//  NSTableViewwithNSArrayController
//
//  Created by air on 2015/03/29.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa
//モデル
class TheModel: NSObject {
    var name : String = ""
    var col1 : String = ""
    var col2 : String = ""
}

class ViewController: NSViewController {


    var windowArray : NSMutableArray = []
    var dataArray : NSMutableArray = []
    var theArray : NSMutableArray = []
    
    //NSTableView
    //Swift1.2
    //まだ出来てない
    //ウインドウのボタン
    func buttonAction001(sender: AnyObject){
        //var theWindow : NSWindow = (sender as! NSButton).window!
        //NSLog("!!!")
    }
    var arrayController001 = NSArrayController(content: nil)
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
        
        //アレイコントローラー
        
        //arrayController.addObject("aaa")
        //arrayController.addObject("bbb")
        //arrayController.insert("ccc")
        
        
        //arrayController.content = theArray
        //エンティティ名を設定
        arrayController001.entityName = "Entity1"
        //var error : NSError? = nil
//        if (arrayController.fetchWithRequest(nil , merge: true , error: error)){
//            
//        }

        //arrayController.managedObjectContext = NSManagedObjectContext()
        
        //テーブルビューを作成
        //まずはスクロールビュー
        let scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のテーブルビュー
        let theTableView : NSTableView = NSTableView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //列
        let tableColumn1 : NSTableColumn = NSTableColumn(identifier: "col1")
        let tableColumn2 : NSTableColumn = NSTableColumn(identifier: "col2")
        tableColumn1.width = 170
        tableColumn2.width = 130
        //列をテーブルにセット
        theTableView.addTableColumn(tableColumn1)
        theTableView.addTableColumn(tableColumn2)
    

        
        //var theArray:[NSDictionary] = [["col1": "和蘭陀", "col2": "おらんだ"],
        //    ["col1": "西班牙", "col2": "すぺいん"],
        //    ["col1": "亜米利加", "col2": "あめりか"],
        //    ["col1": "独逸", "col2": "どいつ"],
        //    ["col1": "露西亜", "col2": "ろしあ"] ]
        
        //arrayController.addObjects(theArray)
        
        let objects : NSMutableArray = []
        
        for (var i = 0; i < 30; i++) {
            let model : TheModel = TheModel()
            model.name = NSString(format: "name %d", i) as String
            model.col1 = NSString(format: "name %d", i) as String
            model.col2 = NSString(format: "name %d", i) as String
            objects.addObject(model)
        }
        arrayController001.addObjects(objects as [AnyObject])
        NSLog("controller %@", arrayController001.description)
        //NSLog("%@", arrayController.selectedObjects.description)


        //theTableView.bind("col1", toObject: arrayController, withKeyPath: "selection", options: nil )
        //theTableView.bind("col1", toObject: arrayController, withKeyPath: "selection.col2", options: nil )

        //データソースとデリゲートをセット
        let dataObj : TableData001 = TableData001()
        dataObj.dataArray = [["col1": "和蘭陀", "col2": "おらんだ"],
            ["col1": "西班牙", "col2": "すぺいん"],
            ["col1": "亜米利加", "col2": "あめりか"],
            ["col1": "独逸", "col2": "どいつ"],
            ["col1": "露西亜", "col2": "ろしあ"]]
        dataArray.addObject(dataObj)
        
        theTableView.setDataSource(dataObj )
        theTableView.setDelegate(dataObj )
        theTableView.reloadData()
         //テーブルの入ったスクロールビューをウインドウに配置
        scrollView.documentView = theTableView
        scrollView.hasVerticalRuler = true
        aWindow.contentView!.addSubview(scrollView)
        
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

