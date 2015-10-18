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
    
    var windowArray : NSMutableArray = []
    
    @IBOutlet weak var theView: NSView!
    
    //NSWorkspace sharedWorkspace()
    //Swift2.0
    @IBAction func function001(sender: AnyObject) {
        let workspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        NSLog("workspace %@",workspace.description)
        
        let notificationcenter : NSNotificationCenter = workspace.notificationCenter
        NSLog("notificationcenter %@",notificationcenter.description)
    }
    
    //NSWorkspace openURL()
    //Swift2.0
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
    //Swift2.0
    @IBAction func function003(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.openFile("/Applications/Font Book.app") {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace　openFile:withApplication:
    //Swift2.0
    @IBAction func function004(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath as String)
        if theWorkspace.openFile(fileFullPath as String, withApplication:"Safari") {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    
    //NSWorkspace openFile:withApplication:andDeactivate:
    //Swift2.0
    @IBAction func function005(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath as String)
        if theWorkspace.openFile(fileFullPath as String, withApplication:"Preview", andDeactivate: true) {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace　openFile:fromImage:at:inView:
    //Swift2.0
    //このメソッドは非推奨　openFile:と同じ動作をする
    @IBAction func function006(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theFilePath : NSString = NSString(string: "~/Desktop/textured.gif")
        //チルダ付きのファイルパスをフルパスに変換する
        let fileFullPath : NSString = theFilePath.stringByExpandingTildeInPath
        NSLog(fileFullPath as String)
        
        let img : NSImage = NSImage(named: "IconImage")!
        NSLog("%@",img.description)
        
        //let theView : NSView = (sender as NSButton).window?.contentView as NSView
        NSLog("%@",theView.description)
        if theWorkspace.openFile(theFilePath as String, fromImage: img,
            at: NSMakePoint(0,0),
            inView: theView )
        {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    //NSWorkspace launchApplication:
    //Swift2.0
    @IBAction func function007(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.launchApplication("iTunes"){
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    
    //NSWorkspace launchApplication:showIcon:autolaunch:
    //Swift2.0
    @IBAction func function008(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.launchApplication("iTunes", showIcon: true, autolaunch: true ){
            NSLog("OK")
        }else{
            NSLog("NO")
        }
    }
    
    //NSWorkspace　launchApplicationAtURL:options:configuration:error:
    //047に追加テスト中あり
    //Swift2.0
    @IBAction func function009(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        //var anError: NSError?
        //let andPrint = NSWorkspaceLaunchOptions.AndPrint.rawValue
        //let mask = Int( andPrint ) // cast from UInt
        
        let theURL : NSURL = NSURL(fileURLWithPath: "/Applications/iTunes.app")
        //let theOption : NSNumber = NSNumber(integer: 0)
        //32ビットモードで起動
        let theArc : NSNumber = NSNumber(integer: NSBundleExecutableArchitectureI386)
        //64ビットモードで起動
        //let theArc : NSNumber = NSNumber(integer: NSBundleExecutableArchitectureX86_64)
        
        let theConfig : [String : AnyObject] = [NSWorkspaceLaunchConfigurationArchitecture : theArc]

        

        let runningApp = try! theWorkspace.launchApplicationAtURL(theURL, options: NSWorkspaceLaunchOptions.Async, configuration: theConfig)
        
        if runningApp.active {
            NSLog("OK")
        }else{
            NSLog("NO")
        }

    }
    //NSWorkspace hideOtherApplications()
    //Swift2.0
    @IBAction func function010(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        theWorkspace.hideOtherApplications()
    }
    
    //NSWorkspace duplicateURLs
    //Swift2.0
    @IBAction func function011(sender: AnyObject) {
        //複製するファイルを選択
        let openPanel = NSOpenPanel()
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
                    (dic : [ NSURL : NSURL], err) in
                    NSLog("%@", (dic as Dictionary).description)
                    //let values: Array = Array(dic.keys)
                    let values: Array = Array(dic.values)
                    for (index, value) in values.enumerate() {
                        print("index: \(index), value: \(value)")
                    }
                })
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    
    
    //NSWorkspace　recycleURLs
    //Swift2.0
    @IBAction func function012(sender: AnyObject) {
        //警告なしに選んだファイルがゴミ箱に入るので注意！！！
        //ゴミ箱へいれるファイルを選択
        let openPanel = NSOpenPanel()
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
                    (dic : [ NSURL : NSURL], err) in
                    NSLog("%@", (dic as Dictionary).description)
                    //let values: Array = Array(dic.keys)
                    let values: Array = Array(dic.values)
                    for (index, value) in values.enumerate() {
                        print("index: \(index), value: \(value)")
                    }
                })
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace　performFileOperation
    //NSWorkspace　ファイル操作
    //Swift2.0
    @IBAction func function013(sender: AnyObject) {
        //デスクトップの「testFilename」というファイルを
        //Documentsに移動する
        var tagCount : Int = 0
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let sourcePath : NSString = ("~/Desktop/" as NSString).stringByExpandingTildeInPath
        let destiPath : NSString = ("~/Documents/" as NSString).stringByExpandingTildeInPath
        let result : Bool = theWorkspace.performFileOperation(NSWorkspaceMoveOperation,
                    source: sourcePath as String,
                    destination: destiPath as String,
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
    //指定のファイルをFinderで選択する
    //Swift2.0
    @IBAction func function015(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
    //Swift2.0
    @IBAction func function016(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                theWorkspace.selectFile(filepath as String,
                    inFileViewerRootedAtPath: "" )
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace typeOfFile
    //ファイルのファイルタイプ「com.adobe.pdf」などを返す
    //Swift2.0
    @IBAction func function017(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                //let anError : NSError?
                let utiType : NSString?
                do {
                    utiType = try theWorkspace.typeOfFile(filepath as String)
                } catch let error as NSError {
                    
                        NSLog("error %@",error.description)
                    
                    utiType = nil
                } catch {
                    
                    fatalError()
                }
                if utiType != nil {
                NSLog("%@", utiType!)
                //Ex.->  public.png , public.data
                }
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace localizedDescriptionForType
    //ファイルのファイルタイプ「Portable Document Format (PDF)」などを返す
    //Swift2.0
    @IBAction func function018(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                //var anError : NSError?
                let utiType : NSString?
                do {
                    utiType = try theWorkspace.typeOfFile(filepath as String)
                } catch let error as NSError {
                    NSLog("error %@", error.description)
                    utiType = nil
                } catch {
                    fatalError()
                }
                if utiType != nil {
                    NSLog("%@", utiType!)
                    //Ex.->  public.png , public.data
                    NSLog("%@", theWorkspace.localizedDescriptionForType(utiType! as String)!)
                    //Ex.->Portable Network Graphics image , data
                }
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace preferredFilenameExtensionForType:
    //ファイルの拡張子「pdf」などを返す
    //Swift2.0
    @IBAction func function019(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                //var anError : NSError?
                let utiType : NSString?
                do {
                    utiType = try theWorkspace.typeOfFile(filepath as String)
                } catch let error as NSError {
                    NSLog("error %@",error.description)
                    utiType = nil
                } catch {
                    fatalError()
                }
                if utiType != nil {
                    NSLog("%@", utiType!)
                    //Ex.->com.apple.web-internet-location , com.compuserve.gif
                    NSLog("%@", theWorkspace.preferredFilenameExtensionForType(utiType! as String)!)
                    //Ex.->webloc , gif
                }
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace filenameExtension:isValidForType:
    @IBAction func function020(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        
        if (theWorkspace.filenameExtension("gif", isValidForType: "com.compuserve.gif")){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        //->YES
        if (theWorkspace.filenameExtension("png", isValidForType: "public.data")){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        //->YES
        if (theWorkspace.filenameExtension("png", isValidForType: "com.compuserve.gif")){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        //->NO
    }
    //NSWorkspace type:conformsToType:
    @IBAction func function021(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        
        if (theWorkspace.type("com.compuserve.gif", conformsToType: "public.data") ){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        //->YES gifはdataに包含される
        
        if (theWorkspace.type("public.data", conformsToType: "com.compuserve.gif") ){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        //->NO dataはgifに包含されない
        
        if (theWorkspace.type("com.compuserve.gif", conformsToType: "public.png") ){
            NSLog("YES")
        }else{
            NSLog("NO")
        }
        //->NO gifはpngに包含されない
    }
    //NSWorkspace URLForApplicationWithBundleIdentifier
    @IBAction func function022(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theURL : NSURL = theWorkspace.URLForApplicationWithBundleIdentifier("com.apple.safari")!
    
        NSLog("%@", theURL.description)
        //file:///Applications/Safari.app/
    }
    //NSWorkspace　getInfoForFile:application:type:
    //作成中
    @IBAction func function023(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                let applicationName: AutoreleasingUnsafeMutablePointer<NSString?> = nil
                let typeName: AutoreleasingUnsafeMutablePointer<NSString?> = nil

                //var itemResult : NSString?
                
                
                if (theWorkspace.getInfoForFile(filepath as String, application: applicationName , type: typeName) ){
                    NSLog("YES")
                }else{
                    NSLog("NO")
                }
                NSLog("%@,%@", applicationName ,typeName)
                    
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    //NSWorkspace fullPathForApplication
    @IBAction func function024(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let fullPath : NSString? = theWorkspace.fullPathForApplication("Safari")
        if (fullPath != nil) {
        NSLog("%@", fullPath!)
        }
        ///Applications/Safari.app
    }
    //NSWorkspace getFileSystemInfoForPath:isRemovable:isWritable:isUnmountable:description:type:
    @IBAction func function025(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                
                var removable = ObjCBool(false)
                var writable = ObjCBool(false)
                var unmountable = ObjCBool(false)
                var description = NSString?()
                var type = NSString?()
                if (theWorkspace.getFileSystemInfoForPath( filepath as String,
                    isRemovable: &removable,
                    isWritable: &writable,
                    isUnmountable: &unmountable,
                    description: &description,
                    type: &type )
                    ){
                    NSLog("YES")
                }else{
                    NSLog("NO")
                }
                // -> YES
                NSLog("%@,%@", description! ,type!)
                // -> hfs,hfs
                if removable {NSLog("removable:YES")}else{NSLog("removable:NO")}
                // -> removable:NO
                if writable {NSLog("writable:YES")}else{NSLog("writable:NO")}
                // -> writable:YES
                if removable {NSLog("removable:YES")}else{NSLog("removable:NO")}
                // -> removable:NO
                
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    //NSWorkspace isFilePackageAtPath
    @IBAction func function026(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                                // -> hfs,hfs
                if (theWorkspace.isFilePackageAtPath(filepath as String)) {
                    NSLog("filePackage?:YES")
                }else{
                    NSLog("filePackage?:NO")
                }
                
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    //NSWorkspace frontmostApplication
    //タイマーが起動した時の実行メソッド
    func timer027(timer:NSTimer!) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        
        NSLog("%@",(theWorkspace.frontmostApplication?.description)!)
        // -> <NSRunningApplication: 0x600000101290 (com.apple.dt.Xcode - 1148)>
        // -> <NSRunningApplication: 0x600000101290 (com.apple.dt.Xcode - 1148)>
        // -> <NSRunningApplication: 0x600000101290 (com.apple.Safari - 1549)>
        
    }
    @IBAction func function027(sender: AnyObject) {
        let anApplication = NSApplication.sharedApplication()
        //アプリケーションを隠す
        anApplication.hide(self)
        //タイマー作成
        //var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timer027:"), userInfo: nil, repeats: true )
    }
    //NSWorkspace runningApplications
    @IBAction func function028(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        
        NSLog("%@",(theWorkspace.runningApplications))
        //->
//        (
//        "<NSRunningApplication: 0x6000001015f0 (com.apple.loginwindow - 97)>",
//        "<NSRunningApplication: 0x6000001017a0 (com.trendmicro.iTIS.UIMgmt - 253)>",
//        "<NSRunningApplication: 0x6000001018c0 (com.google.inputmethod.Japanese - 353)>",
//        "<NSRunningApplication: 0x600000100f30 (.inputmethod.Japanese.Renderer - 358)>",
//        "<NSRunningApplication: 0x600000101200 ((null) - -1)>",
//        "<NSRunningApplication: 0x600000101050 (com.apple.systemuiserver - 471)>",
//        "<NSRunningApplication: 0x600000101170 (com.apple.dock - 469)>",
//        "<NSRunningApplication: 0x600000100fc0 (com.apple.Spotlight - 475)>",
//        "<NSRunningApplication: 0x600000101320 (com.apple.finder - 472)>",
//        "<NSRunningApplication: 0x6000001010e0 (com.apple.sharingd - 480)>",
//        "<NSRunningApplication: 0x600000101290 (com.apple.dock.extra - 485)>",
//        "<NSRunningApplication: 0x6000001013b0 (com.apple.iTunesHelper - 513)>",
//        "<NSRunningApplication: 0x600000100870 (com.apple.TISwitcher - 514)>",
//        "<NSRunningApplication: 0x600000100cf0 (com.security.apple.Keychain-Circle-Notification - 497)>",
//        "<NSRunningApplication: 0x600000100990 (com.apple.notificationcenterui - 500)>",
//        "<NSRunningApplication: 0x600000100b40 (jp.co.fenrir.sleipnir-helper - 515)>",
//        "<NSRunningApplication: 0x600000100bd0 (com.apple.photostream-agent - 506)>",
//        "<NSRunningApplication: 0x600000100900 (com.getdropbox.dropbox - 517)>",
//        "<NSRunningApplication: 0x600000100e10 (com.apple.wifi.WiFiAgent - 509)>",
//        "<NSRunningApplication: 0x600000100ab0 (com.apple.storeuid - 493)>",
//        "<NSRunningApplication: 0x600000100d80 (com.shapeservices.idisplay-host-lite - 536)>",
//        "<NSRunningApplication: 0x600000100a20 (com.apple.lateragent - 578)>",
//        "<NSRunningApplication: 0x600000100c60 (com.getdropbox.dropbox.garcon - 608)>",
//        "<NSRunningApplication: 0x600000100ea0 (com.apple.ImageCaptureExtension2 - 626)>",
//        "<NSRunningApplication: 0x6000001001b0 (com.apple.dt.Xcode - 1148)>",
//        "<NSRunningApplication: 0x600000100240 (com.apple.Safari - 1549)>",
//        "<NSRunningApplication: 0x6000001002d0 (com.apple.WebKit.Networking - 1552)>",
//        "<NSRunningApplication: 0x600000100480 (com.apple.WebKit.WebContent - 1555)>",
//        "<NSRunningApplication: 0x600000100630 (com.apple.WebKit.WebContent - 1556)>",
//        "<NSRunningApplication: 0x6000001003f0 (com.apple.WebKit.WebContent - 1558)>",
//        "<NSRunningApplication: 0x600000100510 (com.apple.qtkitserver - 1573)>",
//        "<NSRunningApplication: 0x600000100360 (com.apple.TextEdit - 2344)>",
//        "<NSRunningApplication: 0x6000001005a0 (com.getdropbox.dropbox.garcon - 2673)>",
//        "<NSRunningApplication: 0x6000001006c0 (com.apple.mail - 7902)>",
//        "<NSRunningApplication: 0x600000100750 (com.apple.WebKit.WebContent - 7928)>",
//        "<NSRunningApplication: 0x6000001007e0 (com.apple.WebKit.WebContent - 7929)>",
//        "<NSRunningApplication: 0x600000103060 (com.apple.LookupViewService - 8461)>",
//        "<NSRunningApplication: 0x6000001030f0 (com.apple.WebKit.WebContent - 11702)>",
//        "<NSRunningApplication: 0x600000104260 (com.apple.WebKit.WebContent - 11703)>",
//        "<NSRunningApplication: 0x600000104380 (com.apple.qtkitserver - 11706)>",
//        "<NSRunningApplication: 0x600000104410 (com.apple.WebKit.WebContent - 12430)>",
//        "<NSRunningApplication: 0x6000001044a0 (com.apple.qtkitserver - 12444)>",
//        "<NSRunningApplication: 0x600000104530 (com.apple.WebKit.WebContent - 12786)>",
//        "<NSRunningApplication: 0x6000001045c0 (com.apple.qtkitserver - 12793)>",
//        "<NSRunningApplication: 0x600000104650 (com.apple.coreservices.uiagent - 13042)>",
//        "<NSRunningApplication: 0x6000001046e0 (com.apple.internetaccounts - 13066)>",
//        "<NSRunningApplication: 0x600000104770 (com.oomori.workshop.NSWorkspace - 13141)>"
//        )


    }
    //NSWorkspace　menuBarOwningApplication
    func timer029(timer:NSTimer!) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        
        NSLog("%@",(theWorkspace.menuBarOwningApplication?.description)!)
        
    }
    @IBAction func function029(sender: AnyObject) {
        let anApplication = NSApplication.sharedApplication()
        //アプリケーションを隠す
        anApplication.hide(self)
        //タイマー作成
        //var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timer029:"), userInfo: nil, repeats: true )
        
    }
    //NSWorkspace iconForFile
    @IBAction func function030(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                
                let theView : NSImageView = NSImageView(frame: NSMakeRect(0.0, 0.0, 100.0, 100.0))
                theView.image = theWorkspace.iconForFile(filepath as String)
                aWindow.contentView!.addSubview(theView)
                aWindow.center()//ウインドウをスクリーンの中心に
                aWindow.orderFront(self)//前面に
                aWindow.makeKeyAndOrderFront(self)//表示

                
                }//if result
            }//openPanel.beginWithCompletionHandler
        
        }
    //NSWorkspace　iconForFiles
    @IBAction func function031(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //複数ファイルを選択
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = true
        openPanel.canChooseDirectories = false
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択した複数ファイルを
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                let theURLs : [AnyObject] = openPanel.URLs
                
                let theView : NSImageView = NSImageView(frame: NSMakeRect(0.0, 0.0, 100.0, 100.0))
                theView.image = theWorkspace.iconForFiles(theURLs as! [String])
                aWindow.contentView!.addSubview(theView)
                aWindow.center()//ウインドウをスクリーンの中心に
                aWindow.orderFront(self)//前面に
                aWindow.makeKeyAndOrderFront(self)//表示
                
                
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    //NSWorkspace setIcon:forFile:options:
    //NSWorkspace Workspace icon creation options
    //選択したファイルのアイコンが変更されるので注意すること
    @IBAction func function032(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                let newImage : NSImage = NSImage(named: "IconImage")!
                
                let theView : NSImageView = NSImageView(frame: NSMakeRect(0.0, 0.0, 100.0, 100.0))
                let result : Bool  = theWorkspace.setIcon(newImage,
                    forFile: filepath as String,
                    options: NSWorkspaceIconCreationOptions())
                if result {
                    NSLog("result YES")
                }else{
                    NSLog("result NO")
                }
                
                aWindow.contentView!.addSubview(theView)
                aWindow.center()//ウインドウをスクリーンの中心に
                aWindow.orderFront(self)//前面に
                aWindow.makeKeyAndOrderFront(self)//表示
                
                
            }//if result
        }//openPanel.beginWithCompletionHandler
        
    }
    //NSWorkspace unmountAndEjectDeviceAtPath
    func buttonAction033(sender: AnyObject){
        
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()

        let result : Bool  = theWorkspace.unmountAndEjectDeviceAtPath("/Volumes/ディスクイメージ")
        if result {
            NSLog("OK")
        }else{
            NSLog("NG")
        }
        
    }
    @IBAction func function033(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction033:")
        theButton.target = self
        aWindow.contentView!.addSubview(theButton)
        
        let theLabel : NSTextField = NSTextField(frame: NSMakeRect(10.0, 100.0, 280.0, 30.0))
        theLabel.stringValue = "指定したディスクがアンマウントされますので、アンマウントしてもいいディスクを選んでください。（ディスクイメージをマウントしたものなど）"
        theLabel.bordered = false
        theLabel.canBecomeKeyView
        
        aWindow.contentView!.addSubview(theLabel)
        
        aWindow.contentView!.addSubview(theView)
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
 
    }
    //NSWorkspace unmountAndEjectDeviceAtURL
    func buttonAction034(sender: AnyObject){
        
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theURL : NSURL = NSURL(fileURLWithPath: "/Volumes/ディスクイメージ")
        //var theError : NSError? = NSError()
        let result : Bool
        do {
            try theWorkspace.unmountAndEjectDeviceAtURL(theURL)
            result = true
        } catch let error as NSError {
            NSLog("error %@",error.description)
            NSLog("NG %@",(error.description as String?)!)
            NSLog("NG %d",(error.code as Int?)! )
            NSLog("NG %@",(error.domain as String?)! )
            result = false
        }
        
        if result {
            NSLog("OK")
        }else{
            
        }

    }
    @IBAction func function034(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        //ボタンを作成
        let theButton : NSButton = NSButton(frame: NSMakeRect(100.0, 2.0, 100.0, 30.0))
        theButton.title = "Action"
        theButton.bezelStyle = NSBezelStyle.RoundedBezelStyle
        theButton.action = Selector("buttonAction034:")
        theButton.target = self
        aWindow.contentView!.addSubview(theButton)
        
        let theLabel : NSTextField = NSTextField(frame: NSMakeRect(10.0, 100.0, 280.0, 30.0))
        theLabel.stringValue = "指定したディスクがアンマウントされますので、アンマウントしてもいいディスクを選んでください。（ディスクイメージをマウントしたものなど）"
        theLabel.bordered = false
        theLabel.canBecomeKeyView
        
        aWindow.contentView!.addSubview(theLabel)
        
        aWindow.contentView!.addSubview(theView)
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
    }
    //NSWorkspace absolutePathForAppBundleWithIdentifier
    @IBAction func function035(sender: AnyObject) {
        
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        NSLog("%@",theWorkspace.absolutePathForAppBundleWithIdentifier("com.apple.safari")! )
        // -> /Applications/Safari.app
    }
    //NSWorkspace　launchAppWithBundleIdentifier:options:additionalEventParamDescriptor:launchIdentifier:
    //NSWorkspace NSWorkspaceLaunchOptions
    //指定のアプリを起動することはできるが、パラメータを渡すことが出来ない 調査中
    func val4 (s: String) -> UInt32
    {
        var n: UInt32 = 0
        var r: String = ""
        if (s.characters.count > 4)
        {
            r = s.substringToIndex(s.startIndex.advancedBy(4))
        }
        else
        {
            r = s + "    "
            r = r.substringToIndex(r.startIndex.advancedBy(4))
        }
        for UniCodeChar in r.unicodeScalars
        {
            n = (n << 8) + (UInt32(UniCodeChar.value) & 255)
        }
        
        return (n)
    }
    @IBAction func function036(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        //var asDescriptor : NSAppleEventDescriptor? = NSAppleEventDescriptor.nullDescriptor()
        let urlDescriptor : NSAppleEventDescriptor? = NSAppleEventDescriptor(string: "http://www.apple.com/")

        let asDescriptor : NSAppleEventDescriptor? = NSAppleEventDescriptor.recordDescriptor()
        
        let aeKeyword : AEKeyword = val4("pURL")
        asDescriptor?.setParamDescriptor(urlDescriptor!, forKeyword: aeKeyword )
        

        var launchID : NSNumber? = NSNumber()
        let result : Bool = theWorkspace.launchAppWithBundleIdentifier("com.apple.safari",
            options: NSWorkspaceLaunchOptions.Default,
            additionalEventParamDescriptor: asDescriptor,
            launchIdentifier: &launchID )
        if result {
            NSLog("launchID %d",launchID!)
            // -> launchID 311
        }
        NSLog("%@", asDescriptor!.description as String)
    }
    //NSWorkspace　openURLs:withAppBundleIdentifier:options:additionalEventParamDescriptor:launchIdentifiers:
    //NSWorkspace NSWorkspaceLaunchOptions
    //launchIdentifiers の戻し方が不明
    @IBAction func function037(sender: AnyObject) {
        //複製するファイルを選択
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = true
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = false
        openPanel.canChooseFiles = true
        openPanel.beginWithCompletionHandler { (result) -> Void in
            //オープンパネルでOKを選択したら
            if result == NSFileHandlingPanelOKButton {
                //選択したファイルを複製
                let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
                let asDescriptor : NSAppleEventDescriptor? = NSAppleEventDescriptor.nullDescriptor()
                
                //var retID : [AnyObject?] = []
                //var anError: NSError?
                let options: NSWorkspaceLaunchOptions = .Async
                
                let result : Bool =
                theWorkspace.openURLs(openPanel.URLs,
                    withAppBundleIdentifier: "com.apple.Finder",
                    options: options,
                    additionalEventParamDescriptor: asDescriptor ,
                    launchIdentifiers: nil )
             
                if result {
                    NSLog("OK ")
                }
            
            }//if result
        }//openPanel.beginWithCompletionHandler

    }
    //NSWorkspace　desktopImageURLForScreen
    @IBAction func function038(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200),
            styleMask:  NSTitledWindowMask |
                NSClosableWindowMask |
                NSMiniaturizableWindowMask |
            NSResizableWindowMask,
            backing:    .Buffered,
            `defer`:      false)
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        
        
        
        //テーブルビューを作成
        //まずはスクロールビュー
        let scrollView : NSScrollView = NSScrollView(frame: NSMakeRect(0.0,30.0,300.0,170.0))
        //中身のイメージビュー
        let theImageView : NSImageView = NSImageView(frame: NSMakeRect(0.0,30.0,1000.0,1000.0))
        
        
        //デスクトップ画像を取得
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theURL : NSURL = theWorkspace.desktopImageURLForScreen(NSScreen.mainScreen()!)!
        
        let img : NSImage = NSImage(contentsOfURL: theURL)!
        theImageView.image  = img
        
        

        
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
        //scrollViewConstraints.addObjectsFromArray(scrollViewConstraintH)
        
        //ウインドウに対するスクロールビューの制約の追加
        aWindow.contentView!.addConstraints(scrollViewConstraintH)
        //aWindow.contentView!.addConstraints(scrollViewConstraints as [AnyObject])
        
        
        //ウインドウの表示
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.title = "ウインドウタイトル"//タイトル設定
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        

    }
    //NSWorkspace setDesktopImageURL:forScreen:options:error:
    //NSWorkspace デスクトップ画像キー
    //デスクトップの画像を変える
    //引き伸ばし設定のみ実装、他のオプション未設定
    @IBAction func function039(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                //let filepath : NSString = theURL.path!
                //var theError : NSError
                
                
                let num : NSNumber = NSNumber(unsignedLong:NSImageScaling.ScaleAxesIndependently.rawValue)
                
                //let num : NSNumber = NSNumber(unsignedLong:NSImageScaling.ImageScaleProportionallyUpOrDown.rawValue)
                
                //let num : NSNumber = NSNumber(unsignedLong:NSImageScaling.ImageScaleProportionallyDown.rawValue)

                //let num : NSNumber = NSNumber(unsignedLong:NSImageScaling.ImageScaleNone.rawValue)
                
                
                let dic : [ String : AnyObject] = ["NSWorkspaceDesktopImageScalingKey" : num ]
                do {
                    try theWorkspace.setDesktopImageURL(theURL,
                        forScreen: NSScreen.mainScreen()!,
                        options: dic)
                } catch _ {
                }

            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    
    //NSWorkspace desktopImageOptionsForScreen
    //値が返ってきませんね
    @IBAction func function040(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theDic : [ NSObject : AnyObject]? =
        theWorkspace.desktopImageOptionsForScreen(NSScreen.mainScreen()!)
        if (theDic != nil) {
            let theKeys: Array = Array(theDic!.keys)
            NSLog("keys = %@",theDic!.description)
            // => keys = [:] <=Why?
            for aKey in theKeys {
                NSLog("key = %@",aKey as! String)
            }
        }else{
            NSLog("nil")
        }
        
    }
    //NSWorkspace　showSearchResultsForQueryString
    @IBAction func function041(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        theWorkspace.showSearchResultsForQueryString("検索語")
    }
    //NSWorkspace fileLabelColors
    @IBAction func function042(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theLabels : [AnyObject] =
        theWorkspace.fileLabelColors
        
        for colorObj in theLabels {
            NSLog("color = %@",colorObj.description as String)
        }
    }
    //NSWorkspace fileLabels
    @IBAction func function043(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let theLabels : [AnyObject] =
        theWorkspace.fileLabels
        
        for theObj in theLabels {
            NSLog("label = %@",theObj.description as String)
        }
    }
    //NSWorkspace noteFileSystemChanged
    @IBAction func function044(sender: AnyObject) {
        //ファイルを選択
        let openPanel = NSOpenPanel()
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
                theWorkspace.noteFileSystemChanged(filepath as String)
                
            }//if result
        }//openPanel.beginWithCompletionHandler
    }
    //NSWorkspace extendPowerOffBy
    @IBAction func function045(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        let miliseconds : Int =
        theWorkspace.extendPowerOffBy(2000)
        
            NSLog("time = %d",miliseconds)
        
    }
    //NSWorkspace accessibilityDisplayShouldDifferentiateWithoutColor
    //NSWorkspace accessibilityDisplayShouldIncreaseContrast
    //NSWorkspace accessibilityDisplayShouldReduceTransparency
    @IBAction func function046(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        if theWorkspace.accessibilityDisplayShouldDifferentiateWithoutColor {
            NSLog("accessibilityDisplayShouldDifferentiateWithoutColor YES")
        }else{
            NSLog("accessibilityDisplayShouldDifferentiateWithoutColor NO")
        }
        if theWorkspace.accessibilityDisplayShouldIncreaseContrast {
            NSLog("accessibilityDisplayShouldIncreaseContrast YES")
        }else{
            NSLog("accessibilityDisplayShouldIncreaseContrast NO")
        }
        if theWorkspace.accessibilityDisplayShouldReduceTransparency {
            NSLog("accessibilityDisplayShouldReduceTransparency YES")
        }else{
            NSLog("accessibilityDisplayShouldReduceTransparency NO")
        }
    }
    //NSWorkspace　launchApplicationAtURL:options:configuration:error:
    //テスト中　動くのは009
    @IBAction func function047(sender: AnyObject) {
        let theWorkspace : NSWorkspace = NSWorkspace.sharedWorkspace()
        //var anError: NSError?
        //let andPrint = NSWorkspaceLaunchOptions.AndPrint.rawValue
        //let mask = Int( andPrint ) // cast from UInt
        
        let theURL : NSURL = NSURL(fileURLWithPath: "/Applications/iTunes.app")
        //let theOption : NSNumber = NSNumber(integer: 0)
        //32ビットモードで起動
        let theArc : NSNumber = NSNumber(integer: NSBundleExecutableArchitectureI386)
        //64ビットモードで起動
        //let theArc : NSNumber = NSNumber(integer: NSBundleExecutableArchitectureX86_64)
        
        
        //環境変数
        var env: Dictionary<String,AnyObject> = ["DYLD_INSERT_LIBRARIES": NSBundle.mainBundle().bundlePath]
        
        env["DYLD_FORCE_FLAT_NAMESPACE"] = "YES"
        
        //起動オプション設定　まずはアーキテクチャ
        var theConfig: Dictionary<String,AnyObject> = [NSWorkspaceLaunchConfigurationArchitecture: theArc]
        //追加　環境変数
        theConfig[NSWorkspaceLaunchConfigurationEnvironment] = env
        let runningApp = try! theWorkspace.launchApplicationAtURL(theURL, options: NSWorkspaceLaunchOptions.Async, configuration: theConfig)
        
        if runningApp.active {
            NSLog("OK")
        }else{
            NSLog("NO")
        }
        
    }

    
    //NSWorkspace NSWorkspaceWillLaunchApplicationNotification
    //NSWorkspace NSWorkspaceApplicationKey
    //アプリケーションが起動しようとするとき
    //
    var switch048 : Bool = false
    func notifyNSWorkspaceWillLaunchApplicationNotification(notify:NSNotification) {
        //NSLog("%@",notify.description)
        
        let bundleID : String = (notify.userInfo! as Dictionary)["NSApplicationBundleIdentifier"]! as! String
        NSLog("Bundle ID = %@",bundleID)
        // -> Bundle ID = com.apple.mail
        
        let appName : String = (notify.userInfo! as Dictionary)["NSApplicationName"]! as! String
        NSLog("application name = %@",appName)
        // -> application name = メール
        
        let appPathe : String = (notify.userInfo! as Dictionary)["NSApplicationPath"]! as! String
        NSLog("application path = %@",appPathe)
        // -> application path = /Applications/Mail.app
        
        let appProcessID : NSNumber = (notify.userInfo! as Dictionary)["NSApplicationProcessIdentifier"]! as! NSNumber
        NSLog("process id = %d",appProcessID.integerValue)
        // -> process id = 36580
        
        let appProcessSerialNumberHigh : NSNumber = (notify.userInfo! as Dictionary)["NSApplicationProcessSerialNumberHigh"]! as! NSNumber
        NSLog("process serial number high = %d",appProcessSerialNumberHigh.integerValue)
        // ->process serial number high = 0

        let appProcessSerialNumberLow : NSNumber = (notify.userInfo! as Dictionary)["NSApplicationProcessSerialNumberLow"]! as! NSNumber
        NSLog("process serial number low = %d",appProcessSerialNumberLow.integerValue)
        // ->process serial number low = 5145832
        

        let runningApp : NSRunningApplication = (notify.userInfo! as Dictionary)["NSWorkspaceApplicationKey"]! as! NSRunningApplication
        NSLog("runningApp = %@",runningApp.description)
        // ->runningApp = <NSRunningApplication: 0x600000105340 (com.apple.mail - 36867)>
        NSLog("runningApp = %@",runningApp.launchDate!.description)
        // ->runningApp = 2015-04-29 09:18:27 +0000
        
    }
    @IBAction func function048(sender: AnyObject) {
        let notificationName : String = NSWorkspaceWillLaunchApplicationNotification
        let notificationSelector : Selector = Selector("notifyNSWorkspaceWillLaunchApplicationNotification:")
        
        if switch048 {
        //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName, object: nil )
            NSLog("--------observe off")
            switch048 = false
        
        }else{
        //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName, object: nil )
            NSLog("--------observe on")
            switch048 = true
        }
        
    }
    //NSWorkspace NSWorkspaceDidTerminateApplicationNotification
    //アプリケーションが終了しようとするとき
    var switch049 : Bool = false
    func notifyNSWorkspaceDidTerminateApplicationNotification(notify:NSNotification) {
        //NSLog("%@",notify.description)

        let bundleID : String = (notify.userInfo! as Dictionary)["NSApplicationBundleIdentifier"]! as! String
        NSLog("Bundle ID = %@",bundleID)
        // -> Bundle ID = com.apple.mail
        
        let appName : String = (notify.userInfo! as Dictionary)["NSApplicationName"]! as! String
        NSLog("application name = %@",appName)
        // -> application name = メール
        
        let appPathe : String = (notify.userInfo! as Dictionary)["NSApplicationPath"]! as! String
        NSLog("application path = %@",appPathe)
        // -> application path = /Applications/Mail.app
        
        let appProcessID : NSNumber = (notify.userInfo! as Dictionary)["NSApplicationProcessIdentifier"]! as! NSNumber
        NSLog("process id = %d",appProcessID.integerValue)
        // -> process id = 36580
        
        let appProcessSerialNumberHigh : NSNumber = (notify.userInfo! as Dictionary)["NSApplicationProcessSerialNumberHigh"]! as! NSNumber
        NSLog("process serial number high = %d",appProcessSerialNumberHigh.integerValue)
        // ->process serial number high = 0
        
        let appProcessSerialNumberLow : NSNumber = (notify.userInfo! as Dictionary)["NSApplicationProcessSerialNumberLow"]! as! NSNumber
        NSLog("process serial number low = %d",appProcessSerialNumberLow.integerValue)
        // ->process serial number low = 5145832
        
        
        let runningApp : NSRunningApplication = (notify.userInfo! as Dictionary)["NSWorkspaceApplicationKey"]! as! NSRunningApplication
        NSLog("runningApp = %@",runningApp.description)
        // ->runningApp = <NSRunningApplication: 0x600000105340 (com.apple.mail - 36867)>
        NSLog("runningApp = %@",runningApp.launchDate!.description)
        // ->runningApp = 2015-04-29 09:18:27 +0000
        
        //let exitStatus : NSNumber = (notify.userInfo! as Dictionary)["NSWorkspaceExitStatusKey"]! as! NSNumber
        NSLog("exit status = %d",appProcessSerialNumberHigh.integerValue)
        // ->exit status = = 0
        
        
    }
    @IBAction func function049(sender: AnyObject) {
        let notificationName : String = NSWorkspaceDidTerminateApplicationNotification
        let notificationSelector : Selector = Selector("notifyNSWorkspaceDidTerminateApplicationNotification:")
        
        if switch049 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName, object: nil )
            NSLog("--------observe off")
            switch049 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName, object: nil )
            NSLog("--------observe on")
            switch049 = true
        }
    }
    
    //NSWorkspace NSWorkspaceSessionDidBecomeActiveNotification
    //NSWorkspace NSWorkspaceSessionDidResignActiveNotification
    //NSWorkspace NSWorkspaceDidHideApplicationNotification
    var switch050 : Bool = false
    func notify050(notify:NSNotification) {
        //NSLog("!! %@",notify.description)
        
        if notify.name == NSWorkspaceSessionDidBecomeActiveNotification {
            NSLog("NSWorkspaceSessionDidBecomeActiveNotification")
        }
        
        if notify.name == NSWorkspaceDidHideApplicationNotification {
            let runningApp : NSRunningApplication = (notify.userInfo! as Dictionary)["NSWorkspaceApplicationKey"]! as! NSRunningApplication
            NSLog("runningApp = %@",runningApp.description)
            // ->runningApp = <NSRunningApplication: 0x600000105340 (com.apple.mail - 36867)>
            NSLog("runningApp = %@",runningApp.launchDate!.description)
            // ->runningApp = 2015-04-29 09:18:27 +0000
        }
    }
    @IBAction func function050(sender: AnyObject) {
        let notificationName1 : String = NSWorkspaceSessionDidBecomeActiveNotification
        let notificationName2 : String = NSWorkspaceSessionDidResignActiveNotification
        let notificationName3 : String = NSWorkspaceDidHideApplicationNotification
        let notificationSelector : Selector = Selector("notify050:")
        
        if switch050 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName3, object: nil )
            NSLog("--------observe off")
            switch050 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName3, object: nil )
            NSLog("--------observe on")
            switch050 = true
        }
    }
    
    //NSWorkspace NSWorkspaceDidUnhideApplicationNotification
    var switch051 : Bool = false
    func notifyNSWorkspaceDidUnhideApplicationNotification(notify:NSNotification) {
        NSLog("%@",notify.description)
        
        
        let runningApp : NSRunningApplication = (notify.userInfo! as Dictionary)["NSWorkspaceApplicationKey"]! as! NSRunningApplication
        NSLog("runningApp = %@",runningApp.description)
        // ->runningApp = <NSRunningApplication: 0x600000105340 (com.apple.mail - 36867)>
        NSLog("runningApp = %@",runningApp.launchDate!.description)
        // ->runningApp = 2015-04-30 22:46:02 +0000
        
        
        
    }
    @IBAction func function051(sender: AnyObject) {
        let notificationName : String = NSWorkspaceDidUnhideApplicationNotification
        let notificationSelector : Selector = Selector("notifyNSWorkspaceDidUnhideApplicationNotification:")
        
        if switch051 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName, object: nil )
            NSLog("--------observe off")
            switch051 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName, object: nil )
            NSLog("--------observe on")
            switch051 = true
        }
    }
    //NSWorkspace NSWorkspaceDidActivateApplicationNotification
    //NSWorkspace NSWorkspaceDidDeactivateApplicationNotification
    var switch052 : Bool = false
    func notify052(notify:NSNotification) {
        //NSLog("!! %@",notify.description)
        
        if notify.name == NSWorkspaceDidActivateApplicationNotification {
            NSLog("NSWorkspaceDidActivateApplicationNotification")
                let runningApp : NSRunningApplication = (notify.userInfo! as Dictionary)["NSWorkspaceApplicationKey"]! as! NSRunningApplication
                NSLog("runningApp = %@",runningApp.description)
                // ->runningApp = <NSRunningApplication: 0x600000105340 (com.apple.mail - 36867)>
                NSLog("runningApp = %@",runningApp.launchDate!.description)
                // ->unningApp = 2015-04-30 22:46:02 +0000

        }
        if notify.name == NSWorkspaceDidDeactivateApplicationNotification {
            NSLog("NSWorkspaceDidDeactivateApplicationNotification")
                let runningApp : NSRunningApplication = (notify.userInfo! as Dictionary)["NSWorkspaceApplicationKey"]! as! NSRunningApplication
                NSLog("runningApp = %@",runningApp.description)
                // ->runningApp = <NSRunningApplication: 0x600000105340 (com.apple.mail - 36867)>
                //NSLog("runningApp = %@",runningApp.launchDate!.description)
                //エラーが出る
        }
    }
    @IBAction func function052(sender: AnyObject) {
        let notificationName1 : String = NSWorkspaceDidActivateApplicationNotification
        let notificationName2 : String = NSWorkspaceDidDeactivateApplicationNotification
        let notificationSelector : Selector = Selector("notify052:")
        
        if switch052 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName2, object: nil )
            NSLog("--------observe off")
            switch052 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName2, object: nil )
            NSLog("--------observe on")
            switch052 = true
        }
    }
    //NSWorkspace NSWorkspaceDidRenameVolumeNotification
    //NSWorkspace NSWorkspaceDidMountNotification
    //NSWorkspace NSWorkspaceWillUnmountNotification
    //NSWorkspace NSWorkspaceDidUnmountNotification
    //NSWorkspace Volume Mounting Notification User Info Keys
    
    var switch053 : Bool = false
    func notify053(notify:NSNotification) {
        //NSLog("!! %@",notify.description)
        
        //マウントされたとき
        if notify.name == NSWorkspaceDidMountNotification {
            //NSLog("!! %@",notify.description)
            let devicePath : String = (notify.userInfo! as Dictionary)["NSDevicePath"]! as! String
            NSLog("device path = %@",devicePath)
            // =>device path = /Volumes/ディスクイメージ
            let localizedName : String = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeLocalizedNameKey"]! as! String
            NSLog("localized new name = %@",localizedName)
            // =>localized new name = ディスクイメージ
            let newURL : NSURL = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeURLKey"]! as! NSURL
            NSLog("new URL = %@",newURL.path!)
            // =>new URL = /Volumes/ディスクイメージ

        }
        //アンマウントしようとした時
        if notify.name == NSWorkspaceWillUnmountNotification {
            let devicePath : String = (notify.userInfo! as Dictionary)["NSDevicePath"]! as! String
            NSLog("device path = %@",devicePath)
            // =>device path = /Volumes/ディスクイメージ
            let localizedName : String = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeLocalizedNameKey"]! as! String
            NSLog("localized new name = %@",localizedName)
            // =>localized new name = ディスクイメージ
            let newURL : NSURL = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeURLKey"]! as! NSURL
            NSLog("new URL = %@",newURL.path!)
            // =>new URL = /Volumes/ディスクイメージ
        }
        if notify.name == NSWorkspaceDidUnmountNotification {
            NSLog("!! %@",notify.description)
            let devicePath : String = (notify.userInfo! as Dictionary)["NSDevicePath"]! as! String
            NSLog("device path = %@",devicePath)
            // =>device path = /Volumes/ディスクイメージ
            let localizedName : String = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeLocalizedNameKey"]! as! String
            NSLog("localized new name = %@",localizedName)
            // =>localized new name = ディスクイメージ
            let newURL : NSURL = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeURLKey"]! as! NSURL
            NSLog("new URL = %@",newURL.path!)
            // =>new URL = /Volumes/ディスクイメージ
        }
        if notify.name == NSWorkspaceDidRenameVolumeNotification {
            NSLog("NSWorkspaceDidRenameVolumeNotification")
            
            let localizedName : String = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeLocalizedNameKey"]! as! String
            NSLog("localized new name = %@",localizedName)
            // =>localized new name = ディスクイメージ2
            let localizedOldName : String = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeOldLocalizedNameKey"]! as! String
            NSLog("localized old name = %@",localizedOldName)
            // =>localized old name = ディスクイメージ1
            
            let newURL : NSURL = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeURLKey"]! as! NSURL
            NSLog("new URL = %@",newURL.path!)
            // =>new URL = /Volumes/ディスクイメージ2
            let oldURL : NSURL = (notify.userInfo! as Dictionary)["NSWorkspaceVolumeOldURLKey"]! as! NSURL
            NSLog("old URL = %@",oldURL.path!)
            // =>old URL = /Volumes/ディスクイメージ1
        }

        
    }
    @IBAction func function053(sender: AnyObject) {
        let notificationName1 : String = NSWorkspaceDidRenameVolumeNotification
        let notificationName2 : String = NSWorkspaceDidMountNotification
        let notificationName3 : String = NSWorkspaceWillUnmountNotification
        let notificationName4 : String = NSWorkspaceDidUnmountNotification
        let notificationSelector : Selector = Selector("notify053:")
        
        if switch053 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName3, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName4, object: nil )
            NSLog("--------observe off")
            switch053 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName3, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName4, object: nil )
            NSLog("--------observe on")
            switch053 = true
        }
    }
    //NSWorkspace NSWorkspaceDidPerformFileOperationNotification
    //NSWorkspace NSWorkspaceDidChangeFileLabelsNotification
    //NSWorkspace NSWorkspaceActiveSpaceDidChangeNotification
    var switch054 : Bool = false
    func notify054(notify:NSNotification) {
        NSLog("!! %@",notify.description)
        
        if notify.name == NSWorkspaceDidPerformFileOperationNotification {
            //通知飛んでこない
            
        }
        if notify.name == NSWorkspaceDidChangeFileLabelsNotification {
            //通知飛んでこない
        }
        //アクティブスペースが切り替わった
        if notify.name == NSWorkspaceActiveSpaceDidChangeNotification {
                        NSLog("NSWorkspaceActiveSpaceDidChangeNotification")
                    }
    }
    @IBAction func function054(sender: AnyObject) {
        let notificationName1 : String = NSWorkspaceDidPerformFileOperationNotification
        let notificationName2 : String = NSWorkspaceDidChangeFileLabelsNotification
        let notificationName3 : String = NSWorkspaceActiveSpaceDidChangeNotification
        let notificationSelector : Selector = Selector("notify054:")
        
        if switch054 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName3, object: nil )
            NSLog("--------observe off")
            switch054 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, forKeyPath: notificationName1, options:NSKeyValueObservingOptions.New, context: nil)
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName3, object: nil )
            NSLog("--------observe on")
            switch054 = true
        }
    }
    //NSWorkspace NSWorkspaceDidWakeNotification
    //NSWorkspace NSWorkspaceWillSleepNotification
    //NSWorkspace NSWorkspaceWillPowerOffNotification
    let theLabel055 : NSTextField = NSTextField(frame: NSMakeRect(10.0, 100.0, 280.0, 30.0))
    
    var switch055 : Bool = false
    func notify055(notify:NSNotification) {
        NSLog("!! %@",notify.description)
        
        if notify.name == NSWorkspaceDidWakeNotification {
            theLabel055.stringValue = theLabel055.stringValue + "\n目覚めた"
            
        }
        if notify.name == NSWorkspaceWillSleepNotification {
            theLabel055.stringValue = theLabel055.stringValue + "\nスリープしようとした"
        }
        //電源オフしようとした
        if notify.name == NSWorkspaceWillPowerOffNotification {
            theLabel055.stringValue = theLabel055.stringValue + "\n電源オフしようとした"
            
        }
    }
    @IBAction func function055(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄

        theLabel055.stringValue = "通知欄"
        theLabel055.bordered = false
        theLabel055.canBecomeKeyView
        
        aWindow.contentView!.addSubview(theLabel055)
        
        aWindow.contentView!.addSubview(theView)
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let notificationName1 : String = NSWorkspaceDidWakeNotification
        let notificationName2 : String = NSWorkspaceWillSleepNotification
        let notificationName3 : String = NSWorkspaceActiveSpaceDidChangeNotification
        let notificationSelector : Selector = Selector("notify055:")
        
        if switch055 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName3, object: nil )
            NSLog("--------observe off")
            switch055 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, forKeyPath: notificationName1, options:NSKeyValueObservingOptions.New, context: nil)
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName3, object: nil )
            NSLog("--------observe on")
            switch055 = true
        }
    }
    //NSWorkspace NSWorkspaceScreensDidSleepNotification
    //NSWorkspace NSWorkspaceScreensDidWakeNotification
    //NSWorkspace NSWorkspaceAccessibilityDisplayOptionsDidChangeNotification
    let theLabel056 : NSTextField = NSTextField(frame: NSMakeRect(10.0, 100.0, 280.0, 30.0))
    
    var switch056 : Bool = false
    func notify056(notify:NSNotification) {
        NSLog("!! %@",notify.description)
        
        if notify.name == NSWorkspaceScreensDidSleepNotification {
            theLabel056.stringValue = theLabel056.stringValue + "\n画面スリープしようとした"
            
        }
        if notify.name == NSWorkspaceScreensDidWakeNotification {
            theLabel056.stringValue = theLabel056.stringValue + "\n画面スリープから目覚めた"
        }
        //
        if notify.name == NSWorkspaceAccessibilityDisplayOptionsDidChangeNotification {
            theLabel056.stringValue = theLabel056.stringValue + "\nアクティビティ変更"
            
        }
    }
    @IBAction func function056(sender: AnyObject) {
        let aWindow : NSWindow = NSWindow(contentRect: NSMakeRect(0.0, 0.0, 300, 200), styleMask: NSTitledWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask | NSResizableWindowMask, backing: .Buffered, `defer`: false , screen: NSScreen.mainScreen())
        windowArray.addObject(aWindow) //ウインドウを保持するための配列に追加。アプリ終了時に配列は破棄
        
        theLabel056.stringValue = "通知欄"
        theLabel056.bordered = false
        theLabel056.canBecomeKeyView
        
        aWindow.contentView!.addSubview(theLabel056)
        
        aWindow.contentView!.addSubview(theView)
        aWindow.center()//ウインドウをスクリーンの中心に
        aWindow.orderFront(self)//前面に
        aWindow.makeKeyAndOrderFront(self)//表示
        
        let notificationName1 : String = NSWorkspaceScreensDidSleepNotification
        let notificationName2 : String = NSWorkspaceScreensDidWakeNotification
        let notificationName3 : String = NSWorkspaceAccessibilityDisplayOptionsDidChangeNotification
        let notificationSelector : Selector = Selector("notify056:")
        
        if switch056 {
            //通知の監視をやめる
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.removeObserver(self,
                name: notificationName3, object: nil )
            NSLog("--------observe off")
            switch056 = false
            
        }else{
            //通知の監視を始める
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, forKeyPath: notificationName1, options:NSKeyValueObservingOptions.New, context: nil)
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName1, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName2, object: nil )
            NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
                selector: notificationSelector, name: notificationName3, object: nil )
            NSLog("--------observe on")
            switch056 = true
        }
    }
    //NSWorkspace
    @IBAction func function057(sender: AnyObject) {
    }
    //NSWorkspace
    @IBAction func function058(sender: AnyObject) {
    }
    //NSWorkspace
    @IBAction func function059(sender: AnyObject) {
    }
    //NSWorkspace
    @IBAction func function060(sender: AnyObject) {
    }
    //NSWorkspace
    @IBAction func function061(sender: AnyObject) {
    }

    //すべての通知を表示
    func notify(notify:NSNotification) {
    NSLog("%@",notify.description)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //すべてのリモート通知を得る
        //NSDistributedNotificationCenter.defaultCenter().addObserver(self,
        //    selector: Selector("notify:"), name: nil , object: nil )

        //すべての通知を得る
        //NSNotificationCenter.defaultCenter().addObserver(self,
        //selector: Selector("notify:"), name: nil , object: nil )
        
        //すべてのNSWorkspaceの通知
        //NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self,
        //    selector: Selector("notify:"), name: nil , object: nil )
        

        }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

