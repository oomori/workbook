//
//  AppDelegate.swift
//  NSApplication
//
//  Created by air on 2014/12/30.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

import Cocoa


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSUserInterfaceItemSearching {

    @IBOutlet weak var discardCheckBox: NSButton!
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var newWindow: NSWindow!
    

    //NSApplication.sharedApplication()
    func function001()  {
        
        let anApplication = NSApplication.sharedApplication()
        
        NSLog("Shared Application Object: \(anApplication).")
        
    }
    //NSApplication delegate
    func function002()  {
        
        let anApplication = NSApplication.sharedApplication()
        let obj = anApplication.delegate
        NSLog("Delegate Object: \(obj).")
        
    }

    
    //NSApplication applicationIconImage
    @IBOutlet weak var imageView: NSImageView!
    @IBAction func function003(sender: AnyObject) {
        NSLog("function003 called")
        let anApplication = NSApplication.sharedApplication()
        var imageObj:NSImage = anApplication.applicationIconImage
        NSLog("Image Object: \(imageObj).")
        imageView.image = imageObj
        
    }
    
    //NSApplication terminate:
    //ボタンを押す
    @IBAction func function004(sender: AnyObject) {
        NSLog("function004 called")
        NSLog("I will terminate after 5 minutes")
        //タイマー作成
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("update:"), userInfo: nil, repeats: false)

    }
    //タイマーが起動した時の実行メソッド
    func update(timer:NSTimer!) {
        NSLog("good bye")//ここは実行される
        let anApplication = NSApplication.sharedApplication()
        //アプリケーション終了
        anApplication.terminate(self)
        NSLog("end")//ここは実行されない
        
        //anApplication.replyToApplicationShouldTerminate(true )
    }
    
    //NSApplication currentEvent
    @IBAction func function005(sender: AnyObject) {
        NSLog("function005 called")
        let anApplication = NSApplication.sharedApplication()
        var event:NSEvent = anApplication.currentEvent!
        var type:NSEventType = event.type
        switch type {
        case .LeftMouseDown :       //NSEventType.LeftMouseDownでも良い
            NSLog("LeftMouseDown")
            break
        case NSEventType.LeftMouseUp :  //.LeftMouseUpだけでも良い
            NSLog("LeftMouseUp")
        default :
            break
        }
    }
    
    //NSApplication discardEventsMatchingMask
    @IBAction func function006(sender: AnyObject) {
        NSLog("function006 called")
        let anApplication = MyApplication.sharedApplication()
        var event:NSEvent = anApplication.currentEvent!

        let maskUp = NSEventMask.LeftMouseUpMask.rawValue
        let maskDragged = NSEventMask.LeftMouseDraggedMask.rawValue
        let mask = Int( maskUp | maskDragged ) // cast from UInt
        //var theEvent:NSEvent? = nil;
        NSLog("1 %@",event)
        anApplication.discardEventsMatchingMask(mask,beforeEvent: event)
        var newEvent:NSEvent = anApplication.currentEvent!
        NSLog("2 %@",newEvent)
        var type:NSEventType = newEvent.type
        switch type {
        case .LeftMouseDragged :       //NSEventType.LeftMouseDownでも良い
            NSLog("LeftMouseDragged")
            break
        case NSEventType.LeftMouseUp :  //.LeftMouseUpだけでも良い
            NSLog("LeftMouseUp")
        default :
            break
        }
        
    }
    
    
    //NSApplication running
    @IBAction func function007(sender: AnyObject) {
        
        let anApplication = MyApplication.sharedApplication()
        if anApplication.running {
            NSLog("YES")
        }else{
            NSLog("NO")
        }
    }
    //Modal windowの表示
    //リターンコードの設定
    private let RETURN_NO  :Int = 0 // モーダルの戻り判定 NO
    private let RETURN_YES :Int = 1 // モーダルの戻り判定 YES

    //NSApplication runModalForWindow
    @IBAction func function008(sender: AnyObject) {
        //newWindowはNIBで作られているwindow
        //@IBOutlet weak var newWindow: NSWindow!
        let anApplication = MyApplication.sharedApplication()
        var result = anApplication.runModalForWindow(newWindow)
        
        //モーダルが閉じられた場合の結果が帰ってくる
        
        switch result {
        case RETURN_NO :
            NSLog("NO")
            break
        case RETURN_YES :
            NSLog("YES")
        default :
            break
        }
        
    }
    //NSApplication stopModal
    @IBAction func function009(sender: AnyObject) {
        NSLog("%@",newWindow)
        let anApplication = MyApplication.sharedApplication()
        anApplication.stopModal()
        newWindow.orderOut(self)
    }
    //NSApplication stopModalWithCode:
    //モーダルを終了する。コードは任意の整数。押されたボタンを判定するときなどに使う
    @IBAction func function010(sender: AnyObject) {
        NSLog("stopModalWithCode")
        let anApplication = MyApplication.sharedApplication()
        anApplication.stopModalWithCode(RETURN_YES)
        newWindow.orderOut(self)
    }
    
    //NSApplication abortModal
    //時間が来たらモーダルを停止する
    func abortTimer(timer:NSTimer!) {
        NSLog("abort modal")
        let anApplication = NSApplication.sharedApplication()
        //modal
        anApplication.abortModal()
    }
    
    @IBAction func function011(sender: AnyObject) {
        NSLog("abortModal")
        let anApplication = MyApplication.sharedApplication()
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("abortTimer:"), userInfo: nil, repeats: false)

        //タイマー、モーダルに入るとタイマーが動かなくなるので、ランループに追加する
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)

        //モーダル開始
        var result:NSModalResponse = anApplication.runModalForWindow(newWindow)
        
        //モーダルが閉じられた場合の結果が帰ってくる
        switch result {
        case -1000 :    //NSModalResponseStop
            NSLog("NSModalResponseStop")
            break
        case -1001 :    //NSModalResponseAbort
            NSLog("NSModalResponseAbort")
        case -1002 :
            NSLog("NSModalResponseContinue")
        default :
            break
        }
        //帰ってきたらウインドウ閉じる
        newWindow.orderOut(self)
    }
    
    
    //NSApplication orderFrontColorPanel
    @IBAction func function012(sender: AnyObject) {
        NSLog("orderFrontColorPanel")
        let anApplication = MyApplication.sharedApplication()
        anApplication.orderFrontColorPanel(self)
    }
    //NSApplication orderFrontStandardAboutPanel
    @IBAction func function013(sender: AnyObject) {
        NSLog("orderFrontStandardAboutPanel")
        let anApplication = MyApplication.sharedApplication()
        anApplication.orderFrontStandardAboutPanel(self)
    }
    
    //NSApplication beginModalSessionForWindow runModalSession　endModalSession
    @IBAction func function014(sender: AnyObject) {
        NSLog("beginModalSessionForWindow")
        var modalCode:NSInteger;
        NSApp.stopModal()
        let anApplication = MyApplication.sharedApplication()
        var session:NSModalSession = anApplication.beginModalSessionForWindow(newWindow)
        
        do{
            modalCode = NSApp.runModalSession(session)
             NSLog("loop")
        }while (modalCode == NSRunContinuesResponse)
        NSLog("end %@",anApplication.modalWindow!)
        anApplication.endModalSession(session)
    }
    
    
    //NSApplication orderFrontStandardAboutPanelWithOptions
    @IBAction func function015(sender: AnyObject) {
        NSLog("orderFrontStandardAboutPanelWithOptions")
        let anApplication = MyApplication.sharedApplication()
        //アバウトパネルの情報表示用NSDictionaryを設定
        let panelDic:Dictionary<String, String> = ["Version" : "1.1", "Copyright" : "satoshi oomori"];
        //表示用
        for key in panelDic.keys{
            println("\(key) : \(panelDic[key])");
        }
        //アバウトパネルを表示
        anApplication.orderFrontStandardAboutPanelWithOptions(panelDic)
    }
    
    //NSApplication extendStateRestoration
    //調査中
    @IBAction func function016(sender: AnyObject) {
        let anApplication = MyApplication.sharedApplication()
        anApplication.extendStateRestoration()
    }
    
    //NSApplication orderFrontCharacterPalette
    //文字パレットを表示
    @IBAction func functtion017(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //文字パレットを表示
        anApplication.orderFrontCharacterPalette(self)
    }
    //NSApplication runPageLayout
    //ページ設定パネルを表示
    @IBAction func function018(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ページ設定パネルを表示
        anApplication.runPageLayout(self)
    }
    
    //NSApplication enabledRemoteNotificationTypes
    //リモート通知の管理
    @IBAction func function019(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //リモート通知の取得
        var types:NSRemoteNotificationType = anApplication.enabledRemoteNotificationTypes
        
       //ifで判定
        if (types == NSRemoteNotificationType.None)
        {
            NSLog("None")
        }
        
        //switchで分岐
        //remoteStateTextFieldは表示用のNSTextField
        switch types {
        case NSRemoteNotificationType.None :
            remoteStateTextField.stringValue = "None"
            NSLog("None")
        case NSRemoteNotificationType.Badge :
            remoteStateTextField.stringValue = "Badge"
            NSLog("Badge")
        case NSRemoteNotificationType.Sound :
            remoteStateTextField.stringValue = "Sound"
            NSLog("Sound")
        case NSRemoteNotificationType.Alert :
            remoteStateTextField.stringValue = "Alert"
            NSLog("Alert")
        default :
            break
        }
        
        
    }
    //リモート状態を表示するTextField
    @IBOutlet weak var remoteStateTextField: NSTextField!
    
    //NSApplication registerForRemoteNotificationTypes
    //
    @IBAction func function020(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //バッジに設定
        anApplication.registerForRemoteNotificationTypes(NSRemoteNotificationType.Badge)
    }
    //NSApplication registerForRemoteNotificationTypes
    //
    @IBAction func function021(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //バッジに設定
        anApplication.registerForRemoteNotificationTypes(NSRemoteNotificationType.Sound)
    }
    //NSApplication unregisterForRemoteNotifications
    //
    @IBAction func function022(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //登録解除
        anApplication.unregisterForRemoteNotifications()
    }
    
    //NSApplication modalWindow
    @IBAction func function023(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        NSLog("%@",anApplication.modalWindow!)
        
    }
    
    //NSApplication userInterfaceLayoutDirection
    @IBAction func function024(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //UI方向を取得
        var direction : NSUserInterfaceLayoutDirection = anApplication.userInterfaceLayoutDirection
        
        //switchで分岐
        switch direction {
        case NSUserInterfaceLayoutDirection.LeftToRight :
            NSLog("LeftToRight")
        case NSUserInterfaceLayoutDirection.RightToLeft :
            NSLog("RightToLeft")
        default :
            break
        }
    }
    //NSApplication keyWindow
    @IBAction func function025(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        NSLog(anApplication.keyWindow!.title!)
    }
    
    //NSApplication mainWindow
    @IBAction func function026(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        NSLog(anApplication.mainWindow!.title!)
    }
    
    //NSApplication windowWithWindowNumber()
    @IBAction func function027(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        let mainWindow :NSWindow = anApplication.mainWindow!
        NSLog("window number = %d",anApplication.windowWithWindowNumber(mainWindow.windowNumber)!)
    }
    //NSApplication windows
    @IBAction func function028(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        let windowArray :Array = anApplication.windows
        //表示用
        for obj in windowArray{
            NSLog("window = %@",obj.description)
        }
    }
    //NSApplication makeWindowsPerform
    @IBAction func function029(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ウインドウ最小化
        anApplication.makeWindowsPerform("miniaturize:", inOrder: false)
    }
    //NSApplication miniaturizeAll
    @IBAction func function030(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ウインドウ最小化
        anApplication.miniaturizeAll(self)
    }
    
    //NSApplication hidden
    @IBAction func function031(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ウインドウは最小化しているか
        // anApplication.hidden = false //　×書き込みはできない
        if (anApplication.hidden)
        {
            NSLog("hidden")
        }else{
            NSLog("not hidden")
        }
    }
    //NSApplication hide()
    @IBAction func function032(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //アプリケーションを隠す
        anApplication.hide(self)
    }
    //NSApplication unhide:
    @IBAction func function033(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //アプリケーションを隠す
        anApplication.hide(self)
        NSLog("I will unhide after 5 minutes")
        //タイマー作成
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("unhideApp:"), userInfo: nil, repeats: false)

    }
    //タイマーが起動した時の実行メソッド
    func unhideApp(timer:NSTimer!) {
        NSLog("unhide now")//ここは実行される
        let anApplication = NSApplication.sharedApplication()
        //アプリケーション終了
        anApplication.unhide(self)
        NSLog("end")
    }
    
    //NSApplication unhideWithoutActivation:
    @IBAction func function034(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //アプリケーションを隠す
        anApplication.hide(self)
        NSLog("I will unhide after 5 minutes")
        //タイマー作成
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("unhideAppwithoutAct:"), userInfo: nil, repeats: false)
        
    }
    //タイマーが起動した時の実行メソッド
    func unhideAppwithoutAct(timer:NSTimer!) {
        NSLog("unhide now")//ここは実行される
        let anApplication = NSApplication.sharedApplication()
        //アプリケーション終了
        anApplication.unhideWithoutActivation()
        NSLog("end")
    }
    //NSApplication updateWindows
    @IBAction func function035(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //アプリケーションをアップデート
        anApplication.updateWindows()
    }
    //NSApplication setWindowsNeedUpdate
    @IBAction func function036(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //アップデートするかどうかのセット
        anApplication.setWindowsNeedUpdate(true)
    }
    //NSApplication preventWindowOrdering()
    @IBAction func function037(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.preventWindowOrdering()
        NSLog("NSApplication preventWindowOrdering")
    }
    //NSApplication arrangeInFront()
    @IBAction func function038(sender: AnyObject) {
        var timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("arrange:"), userInfo: nil, repeats: true )

    }
    //タイマーが起動した時の実行メソッド
    func arrange(timer:NSTimer!) {
        NSLog("arrange in front")//ここは実行される
        let anApplication = NSApplication.sharedApplication()
        //アプリケーション終了
        anApplication.arrangeInFront(self)
        NSLog("end")//
    }
 
    //NSApplication arrangeInFront
    @IBAction func function039(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.arrangeInFront(self)
        NSLog("NSApplication arrangeInFront")
    }
    //NSApplication mainMenu
    @IBAction func function040(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        var aMenu :NSMenu = anApplication.mainMenu!
        
        NSLog("NSApplication mainmenu %@",aMenu)
    }
    //NSApplication addWindowsItem
    @IBAction func function041(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //新しいウインドウを作成
        //let maskDragged = NSEventMask.LeftMouseDraggedMask.rawValue
        //let mask = Int( maskUp | maskDragged ) // cast from UInt
        
        var theWindow = NSWindow(contentRect: NSMakeRect(100, 100, 400, 150),
            styleMask: NSTitledWindowMask
                | NSClosableWindowMask
                | NSMiniaturizableWindowMask
                | NSResizableWindowMask
            ,
            backing: NSBackingStoreType.Buffered, defer: true);
        /*
        var NSBorderlessWindowMask: Int { get }
        var NSTitledWindowMask: Int { get }     //1　タイトルバーあり
        var NSClosableWindowMask: Int { get } //2 クローズ可能
        var NSMiniaturizableWindowMask: Int { get }//4 最小化可能
        var NSResizableWindowMask: Int { get }      //8 サイズ調整可能
        var NSTexturedBackgroundWindowMask: Int { get }//テクスチャバックグラウンド
        */
        theWindow.title = "New Window";
        theWindow.center();
        
        //Add the window to the main viewer
        window.addChildWindow(theWindow, ordered:NSWindowOrderingMode.Above)
        
        var controller = NSWindowController(window: theWindow)
        controller.showWindow(self)
        
        anApplication.addWindowsItem(theWindow,
            title: "added title",
            filename: true  )
        NSLog("NSApplication addWindowsItem")
        
    }

    //NSApplication changeWindowsItem
    @IBAction func function042(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.changeWindowsItem(newWindow,
            title: "changed name",
            filename: false )
        NSLog("NSApplication changeWindowsItem")
    }
    //NSApplication removeWindowsItem
    @IBAction func function043(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.removeWindowsItem(newWindow)
        NSLog("NSApplication removeWindowsItem")
    }
    //NSApplication dockTile
    @IBAction func function044(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ドックタイルを取得
        var dockTile :NSDockTile =  anApplication.dockTile
        NSLog("NSApplication dockTile %@",dockTile)
    }
    //NSApplication registerServicesMenuSendTypes
    //サービスメニューを登録　動いてない　調査中
    @IBAction func function045(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //送信タイプ
        var sendArray = ["NSPDFPboardType","NSPICTPboardType","NSPostScriptPboardType","NSTIFFPboardType"]
        //リターンタイプ
        var retArray = ["NSPDFPboardType","NSPICTPboardType","NSPostScriptPboardType","NSTIFFPboardType"]
        
        var aMenu : NSMenu = NSMenu(title: "aaa")
        aMenu.addItemWithTitle("aaaaa", action: Selector("serviceMethod:") , keyEquivalent: "e")


        anApplication.servicesMenu = aMenu

        anApplication.registerServicesMenuSendTypes(sendArray,
            returnTypes: retArray)
        
        NSPerformService("aaaaa", NSPasteboard.generalPasteboard())
        
        
        
    }
    //サービスで呼び出されるメソッド
    func readSelectionFromPasteboard(pboard:NSPasteboard) {
        NSLog("serviceMethod")
    }
    
    
    //NSApplication servicesMenu
    //Swift1.2
    @IBAction func function046(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        var aMenu  =  anApplication.servicesMenu
        if ((aMenu) != nil) {
        NSLog("NSApplication aMenu %@",aMenu!)
        }
    }
    //NSApplication active
    @IBAction func function047(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        if (anApplication.active) {
            NSLog("NSApplication active")
            anApplication.hide(self)
            //タイマー作成
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("hideCheck:"), userInfo: nil, repeats: false)
        }else{
            NSLog("NSApplication not active")
        }
    }
    //タイマーが起動した時の実行メソッド
    func hideCheck(timer:NSTimer!) {
        let anApplication = MyApplication.sharedApplication()
        //
        if (anApplication.active) {
            NSLog("NSApplication active")
        }else{
            NSLog("NSApplication not active")
        }
    }
    
    //NSApplication activateIgnoringOtherApps
    @IBAction func function048(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.activateIgnoringOtherApps(true )
    }
    //NSApplication deactivate
    @IBAction func function049(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        if (anApplication.active) {
            NSLog("NSApplication active")
            anApplication.deactivate()
        }else{
            NSLog("NSApplication not active")
        }
    }

    
    //NSApplication hideOtherApplications/unhideAllApplications
    @IBAction func function050(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.hideOtherApplications(self )
        //タイマー作成
        var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("unhideAll:"), userInfo: nil, repeats: false)
    }
    //タイマーが起動した時の実行メソッド
    func unhideAll(timer:NSTimer!) {
        
        let anApplication = NSApplication.sharedApplication()
        //アプリケーション終了
        anApplication.unhideAllApplications(self )
    }
    
    //NSApplication showHelp
    @IBAction func function051(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.showHelp(self)
    }
    //NSApplication activateContextHelpMode
    @IBAction func function052(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        anApplication.activateContextHelpMode(self )
    }
    //NSApplication　helpMenu
    //Swift1.2
    @IBAction func function053(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        var helpMenu = anApplication.helpMenu
        if ((helpMenu) != nil){
        NSLog("%@", helpMenu!)
        }
    }
    //NSApplication　detachDrawingThread:toTarget:withObject:
    @IBAction func function054(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //
        NSApplication.detachDrawingThread(Selector("methodFromFunction054:"),
            toTarget: self,
            withObject: self)
    }
    //別スレッドで動くメソッド
    func methodFromFunction054(info:AnyObject) {
        NSLog("methodFromFunction054")
    }
    
    //NSApplication tryToPerform:with:
    @IBAction func function055(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //このインスタンスの関数function054:を動かしてみる
        var result:Bool = NSApp.tryToPerform(Selector("function054:"), with: self )
        //結果
        if (result){
            NSLog("function055 true")
        }else{
            NSLog("function055 false")
        }
    }
    //NSApplication sendAction:to:from:
    @IBAction func function056(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //このインスタンスの関数function054:を動かしてみる
        var result:Bool = NSApp.sendAction(Selector("function054:"),
            to: self, from: self)
        (Selector("function054:"), with: self )
        //結果
        if (result){
            NSLog("function056 true")
        }else{
            NSLog("function056 false")
        }
    }
    //NSApplication targetForAction
    @IBAction func function057(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //このインスタンスの関数function057:を動かしてみる
        var result:AnyObject? = NSApp.targetForAction(Selector("methodFromFunction057") )
        //表示用
        if ((result) != nil){
        NSLog("obj = %@",result!.description)
        //->obj = <NSApplication.AppDelegate: 0x60800028b130>
        //関数の戻り値には関係なく関数のオブジェクトが返される
        }
    }
    func methodFromFunction057()-> AnyObject {
        NSLog("methodFromFunction057")
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        let windowArray :Array = anApplication.windows
        
        return windowArray
    }
    //NSApplication targetForAction:to:from
    @IBAction func function058(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //このインスタンスの関数function058:を動かしてみる
        var result:AnyObject? = NSApp.targetForAction(Selector("methodFromFunction058"),
            to : self,
            from: self)
        //表示用
        if ((result) != nil){
            NSLog("obj = %@",result!.description)
            //->obj = <NSApplication.AppDelegate: 0x60800028b130>
            //関数の戻り値には関係なく関数のオブジェクトが返される
        }
    }
    func methodFromFunction058()-> AnyObject {
        NSLog("methodFromFunction058")
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        let windowArray :Array = anApplication.windows
        
        return windowArray
    }
    //NSApplication context
    @IBAction func function059(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        var aContext : NSGraphicsContext = anApplication.context!
        
        NSLog("context = %@",aContext)
        var point : NSPoint  = aContext.patternPhase
        NSLog("%f,%f",point.x,point.y)
    }
    
    //NSApplication requestUserAttention
    @IBAction func function060(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        anApplication.requestUserAttention(NSRequestUserAttentionType.CriticalRequest)
        //デアクティベートして
        anApplication.hide(self) //deactivate()
        //3秒後にユーザーアテンションを
        var startTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("requestAttention:"), userInfo: nil, repeats: false)
        //10秒後にユーザーアテンションを
        var stopTimer = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: Selector("cancelAttention:"), userInfo: nil, repeats: false)
        
    }
    //タイマーが起動した時の実行メソッド ドックで跳ねる
    func requestAttention(timer:NSTimer!) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ユーザーアテンションを開始
        NSLog("start attention")
        anApplication.requestUserAttention(NSRequestUserAttentionType.CriticalRequest)
    }
    //タイマーが起動した時の実行メソッド　ドックではねているのをやめる
    func cancelAttention(timer:NSTimer!) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //ユーザーアテンションを停止
        NSLog("stop attention")
        anApplication.cancelUserAttentionRequest(0)
    }
    //NSApplication fullKeyboardAccessEnabled
    @IBAction func function061(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        if anApplication.fullKeyboardAccessEnabled {
            NSLog("fullKeyboardAccessEnabled YES")
        }else{
            NSLog("fullKeyboardAccessEnabled NO")
        }
    }
    //NSApplication currentSystemPresentationOptions/presentationOptions
    @IBAction func function062(sender: AnyObject) {
       //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        window.collectionBehavior = NSWindowCollectionBehavior.FullScreenPrimary
        window.toggleFullScreen(self)
    }
    //NSApplication currentSystemPresentationOptions/presentationOptions
    @IBAction func function063(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        switch anApplication.currentSystemPresentationOptions {
        case NSApplicationPresentationOptions.FullScreen:
            NSLog("system FullScreen YES")
        case NSApplicationPresentationOptions.Default:
            NSLog("system FullScreen NO")
        default:
            break
        }
        switch anApplication.presentationOptions {
        case NSApplicationPresentationOptions.FullScreen:
            NSLog("app FullScreen YES")
        case NSApplicationPresentationOptions.Default:
            NSLog("app FullScreen NO")
        default:
            break
        }
    }
    

    //NSApplication activationPolicy/setActivationPolicy
    @IBAction func function064(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        
        switch anApplication.activationPolicy() {
        case NSApplicationActivationPolicy.Regular:
            NSLog("NSApplicationActivationPolicy.Regular")
            anApplication.setActivationPolicy(NSApplicationActivationPolicy.Accessory)
        case NSApplicationActivationPolicy.Accessory:
            NSLog("NSApplicationActivationPolicy.Accessory")
            anApplication.setActivationPolicy(NSApplicationActivationPolicy.Regular)
        default:
            break
        }
        
    }
    //NSApplication　registerUserInterfaceItemSearchHandler
    @IBAction func function065(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        anApplication.registerUserInterfaceItemSearchHandler(self )
    }
    //NSUserInterfaceItemSearchingプロトコルのメソッド（必須）Helpの検索に文字を入れるとその情報が取得できる
    func searchForItemsWithSearchString(searchString: String, resultLimit: Int, matchedItemHandler handleMatchedItems: ([AnyObject]!) -> Void)
    {
        NSLog("searchForItemsWithSearchString %@",searchString)
        
        //文字列検索
        let anApplication = MyApplication.sharedApplication()
        var range : NSRange = NSMakeRange(0, 1)
        var afterRange : NSRange = NSMakeRange(0, 0)
        
        var result : Bool = anApplication.searchString(searchString,
            inUserInterfaceItemString: "quit",
            searchRange: NSMakeRange(0, count(searchString.utf16)), //Swift1.2
            //searchRange: NSMakeRange(0, searchString.utf16Count), //Swift1.1
            foundRange: &afterRange  )
        NSLog("%d,%d",afterRange.location,afterRange.length)
        if result {
            NSLog("YES")
        }
        
    }
    func localizedTitlesForItem(item: AnyObject) -> [AnyObject]
    {
        NSLog("localizedTitlesForItem")
        var sendArray = ["aaa","bbb","ccc","ddd"]
    return sendArray
    }
    //NSUserInterfaceItemSearchingプロトコルのメソッド　終了
    
    //NSApplication
    //Swift1.2
    @IBAction func function066(sender: AnyObject) {
        //文字列検索
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        var range : NSRange = NSMakeRange(0, 1)
        var afterRange : NSRange = NSMakeRange(0, 0)
        
        var result : Bool = anApplication.searchString("検索",
            inUserInterfaceItemString: "検索される文字列",
            searchRange: NSMakeRange(0, count("検索される文字列".utf16)), //Swift1.2
            //searchRange: NSMakeRange(0, "検索される文字列".utf16Count), //Swift1.1
            
            foundRange: &afterRange  )
        NSLog("%d,%d",afterRange.location,afterRange.length)
        if result {
            NSLog("YES")
        }
    }
    
    //NSApplication unregisterUserInterfaceItemSearchHandler
    @IBAction func function067(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        anApplication.unregisterUserInterfaceItemSearchHandler(self )
    }
    //NSApplication disableRelaunchOnLogin
    @IBAction func function068(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //再ログインした時にアプリケーションが自動起動しないようにする
        anApplication.disableRelaunchOnLogin()
    }
    //NSApplication　enableRelaunchOnLogin
    @IBAction func function069(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        //再ログインした時にアプリケーションが自動起動する
        anApplication.enableRelaunchOnLogin()
    }
    //NSApplication occlusionState
    @IBAction func function070(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        switch anApplication.occlusionState {
        case NSApplicationOcclusionState.Visible:
            NSLog("Visible")
        case NSApplicationOcclusionState.allZeros:
            NSLog("allZeros")
        default:
            NSLog("default")
            break
        }
    }
    //NSApplication　orderedDocuments
    @IBAction func function071(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        NSLog("documents = %d",anApplication.orderedDocuments.count)
        
    }
    //NSApplication orderedWindows
    @IBAction func function072(sender: AnyObject) {
        //共有アプリケーションインスタンスを取得
        let anApplication = MyApplication.sharedApplication()
        NSLog("windows = %d",anApplication.orderedWindows.count)
    }
    //NSApplication
    @IBAction func function073(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func funvtion074(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func function075(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func function076(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func function077(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func function078(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func function079(sender: AnyObject) {
    }
    //NSApplication
    @IBAction func function080(sender: AnyObject) {
    }
    //064,032をクリックすると呼ばれる
    func applicationDidChangeOcclusionState(notification: NSNotification) {
        if (NSApp.occlusionState & NSApplicationOcclusionState.Visible != nil){
            NSLog("foreground")
        }else{
            NSLog("background")
        }
    }
    
    //NSApplication
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("applicationDidFinishLaunching")
        NSLog("NSApplicationDidFinishLaunchingNotification %@",aNotification)
        if (aNotification.name == "NSApplicationDidFinishLaunchingNotification"){
            NSLog("YES")
        }
        
        function001()
        function002()
    }
    //NSApplication
    func applicationWillFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSLog("applicationWillFinishLaunching")
        
    }
    //NSApplication
    func applicationShouldTerminate(sender: NSApplication) -> NSApplicationTerminateReply {
        NSLog("applicationShouldTerminate")
        
        //return .TerminateCancel //アプリケーション終了をキャンセル
        //return .TerminateLater      //あとで
        return .TerminateNow    //アプリケーション終了する
    }

    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
        NSLog("applicationWillTerminate")
        
    }
    
    //アプリケーションが隠れようとする
    func applicationWillHide(notification: NSNotification) {
        // Insert code here to tear down your application
        NSLog("applicationWillHide")
        
    }

    //NSApplication
    //アプリケーションが隠れた
    func applicationDidHide(notification: NSNotification) {
        // Insert code here to tear down your application
        NSLog("applicationDidHide")
        NSLog("NSApplicationDidHideNotification %@",notification)
        if (notification.name == "NSApplicationDidHideNotification"){
            NSLog("YES")
        }
        
    }
    
    //アプリケーションをアップデートしようとする
    func applicationWillUpdate(notification: NSNotification) {
        //度々呼ばれるので使用時のみ
        //NSLog("applicationWillUpdate")
        
    }
    
    //アプリケーションがアップデートされた
    func applicationDidUpdate(notification: NSNotification) {
        //度々呼ばれるので使用時のみ
        //NSLog("applicationDidUpdate")
        
    }
    //NSApplication
    //アクティブになった
    func applicationDidBecomeActive(notification: NSNotification) {
        NSLog("NSApplicationDidBecomeActiveNotification %@",notification)
        if (notification.name == "NSApplicationDidBecomeActiveNotification"){
            NSLog("YES")
        }
        
    }
    //NSApplication
    //スクリーンの属性が変更された
    func applicationDidChangeScreenParameters(notification: NSNotification) {
        NSLog("NSApplicationDidChangeScreenParametersNotification %@",notification)
        if (notification.name == "NSApplicationDidChangeScreenParametersNotification"){
            NSLog("YES")
        }
    }
    //NSApplication
    //アクティブなアプリケーションが他へ移った
    func applicationDidResignActive(notification: NSNotification) {
        NSLog("NSApplicationDidResignActiveNotification %@",notification)
        if (notification.name == "NSApplicationDidResignActiveNotification"){
            NSLog("YES")
        }
    }
    //NSApplication
    //アプリケーションが隠れている状態から戻った
    func applicationDidUnhide(notification: NSNotification) {
        NSLog("NSApplicationDidUnhideNotification %@",notification)
        if (notification.name == "NSApplicationDidUnhideNotification"){
            NSLog("YES")
        }
    }
    //アプリケーションがファイルドロップでOpenされた
    //ターゲット　アプリケーション設定　書類のタイプ　役割Editer 拡張子"*** *" OSタイプ"*** *"を設定してある
    //Swift1.2
    func application(sender: NSApplication, openFiles filenames: [AnyObject]) {
        remoteStateTextField.stringValue = "File drop open"
        
        var firstMissingFile :NSString? = nil ;
        var files : NSMutableArray = NSMutableArray()
        var i : Int
        var count :Int = filenames.count
        for (i = 0 ; i < count ; ++i){
            var name : NSString = (filenames as NSArray).objectAtIndex(i) as! NSString
            if (NSFileManager.defaultManager().fileExistsAtPath(name as String)){
                files.addObject(name)
            }else if ( firstMissingFile != nil ){
               firstMissingFile = name
            }
            
            
        }
        if ( firstMissingFile != nil ){
            var alert : NSAlert = NSAlert()
            alert.addButtonWithTitle("OK")
            
            var text :NSString
            if (files.count >= count-1){
                alert.messageText = "aaaaa"
                text = "Could not open file with"
            }else{
                alert.messageText = "Multiple files not found"
                text = "Could not open file with"
            }
            alert.informativeText = text as String
            alert.alertStyle = NSAlertStyle.CriticalAlertStyle
            
            alert.runModal()
            
            NSApp.replyToOpenOrPrint(NSApplicationDelegateReply.Failure)
            
        }
        
        
    }


}


