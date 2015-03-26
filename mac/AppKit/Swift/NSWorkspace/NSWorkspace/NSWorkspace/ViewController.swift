//
//  ViewController.swift
//  NSWorkspace
//
//  Created by air on 2015/03/20.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    //NSWorkspace sharedWorkspace()
    //NSWorkspace notificationCenter
    
    @IBOutlet weak var theView: NSView!
    
    @IBAction func function001(sender: AnyObject) {
        let workspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        NSLog("workspace %@",workspace.description)
        
        let notificationcenter : NSNotificationCenter = workspace.notificationCenter
        NSLog("notificationcenter %@",notificationcenter.description)
    }
    //NSWorkspace openURL()
    @IBAction func function002(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theURL : NSURL = NSURL(string: "http://cocoaapi.hatenablog.com/")!
        
        if theWorkspace.openURL(theURL){
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace openFile()
    @IBAction func function003(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.openFile("/Applications/Font Book.app") {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace　openFile:withApplication:
    @IBAction func function004(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath)
        if theWorkspace.openFile(fileFullPath, withApplication:"Safari") {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace openFile:withApplication:andDeactivate:
    @IBAction func function005(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath)
        if theWorkspace.openFile(fileFullPath, withApplication:"Preview", andDeactivate: true) {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace　openFile:fromImage:at:inView:
    //このメソッドは非推奨　openFile:と同じ動作をする
    @IBAction func function006(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath)
        
        let img : NSImage = NSImage(named: "IconImage")!
        NSLog("%@",img.description)
        
        //let theView : NSView = (sender as NSButton).window?.contentView as NSView
        NSLog("%@",theView.description)
        if theWorkspace.openFile(theFilePath, fromImage: img,
            at: NSMakePoint(0,0),
            inView: theView )
        {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace launchApplication:
    @IBAction func function007(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.launchApplication("iTunes"){
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace launchApplication:showIcon:autolaunch:
    @IBAction func function008(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.launchApplication("iTunes", showIcon: true, autolaunch: true ){
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace
    //調査中
    @IBAction func function009(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        var anError: NSError?
        let andPrint = NSWorkspaceLaunchOptions.AndPrint.rawValue
        let mask = Int( andPrint ) // cast from UInt
        

        
//        if theWorkspace.launchApplicationAtURL("/Applications/Stickies.app",
//            options: NSWorkspaceLaunchOptions.AndPrint,
//            configuration: [NSWorkspaceLaunchConfigurationArguments:""], error: &anError){
//            NSLog("OK")
//        }else{
//            NSLog("NO")
//        }
    }
    //NSWorkspace hideOtherApplications()
    @IBAction func function010(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        theWorkspace.hideOtherApplications()
    }
    
    //NSWorkspace duplicateURLs
    @IBAction func function011(sender: AnyObject) {
        //複製するファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを複製
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                theWorkspace.duplicateURLs(openPanel.URLs, completionHandler: {
                    (dic : [ NSObject : AnyObject]!, err) in
                    NSLog("%@", (dic as Dictionary).description)
                    //let values: Array = Array(dic.keys)
                    let values: Array = Array(dic.values)
                    for (index, value) in enumerate(values) {
                        println("index: \(index), value: \(value)")
                    }
                })
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    //NSWorkspace　recycleURLs
    @IBAction func function012(sender: AnyObject) {
        //警告なしに選んだファイルがゴミ箱に入るので注意！！！
        //ゴミ箱へいれるファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルをゴミ箱へ
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                theWorkspace.recycleURLs(openPanel.URLs, completionHandler: {
                    (dic : [ NSObject : AnyObject]!, err) in
                    NSLog("%@", (dic as Dictionary).description)
                    //let values: Array = Array(dic.keys)
                    let values: Array = Array(dic.values)
                    for (index, value) in enumerate(values) {
                        println("index: \(index), value: \(value)")
                    }
                })
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace　performFileOperation
    @IBAction func function013(sender: AnyObject) {
        //デスクトップの「testFilename」というファイルを
        //Documentsに移動する
        var tagCount : Int = 0
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let sourcePath : NSString = "~/Desktop/".stringByExpandingTildeInPath
        let destiPath : NSString = "~/Documents/".stringByExpandingTildeInPath
        let result : Bool = theWorkspace.performFileOperation(NSWorkspaceMoveOperation,
                    source: sourcePath,
                    destination: destiPath,
                    files: ["testFilename"],
                    tag: &tagCount
                )
            NSLog("%d",tagCount)
        if result {
            NSLog("OK")
        }else{
            NSLog("NG")
        }
    }
    
    //NSWorkspace
    @IBAction func function014(sender: AnyObject) {
        
    }
    
    //NSWorkspace　activateFileViewerSelectingURLs
    @IBAction func function015(sender: AnyObject) {
        //ファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                theWorkspace.activateFileViewerSelectingURLs(openPanel.URLs)
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace selectFile:inFileViewerRootedAtPath:
    @IBAction func function016(sender: AnyObject) {
        //ファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                let theURL : NSURL =  openPanel.URL!
                let filepath : NSString = theURL.path!
                theWorkspace.selectFile(filepath,
                    inFileViewerRootedAtPath: "" )
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace typeOfFile
    @IBAction func function017(sender: AnyObject) {
        //ファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                let theURL : NSURL =  openPanel.URL!
                let filepath : NSString = theURL.path!
                var anError : NSError?
                let utiType : NSString? = theWorkspace.typeOfFile(filepath, error: &anError)
                if utiType != nil {
                NSLog("%@", utiType!)
                //Ex.->  public.png , public.data
                }
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace localizedDescriptionForType
    @IBAction func function018(sender: AnyObject) {
        //ファイルを選択
        var openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                let theURL : NSURL =  openPanel.URL!
                let filepath : NSString = theURL.path!
                var anError : NSError?
                let utiType : NSString? = theWorkspace.typeOfFile(filepath, error: &anError)
                if utiType != nil {
                    NSLog("%@", utiType!)
                    //Ex.->  public.png , public.data
                    NSLog("%@", theWorkspace.localizedDescriptionForType(utiType!)!)
                    //Ex.->Portable Network Graphics image , data
                }
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace
    @IBAction func function019(sender: AnyObject) {
    }
    
    //NSWorkspace
    @IBAction func function020(sender: AnyObject) {
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

