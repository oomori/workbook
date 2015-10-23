//
//  AppDelegate.swift
//  NSAlert
//
//  Created by air on 2015/02/08.
//  Copyright (c) 2015年 oomori. All rights reserved.
//  Swift1.2検証済み

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate ,NSAlertDelegate{

    @IBOutlet weak var window: NSWindow!

    
    @IBOutlet weak var accessoryView: NSView!
    
    @IBOutlet weak var sheetWindow: NSWindow!
    //NSAlert init
    @IBAction func function001(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.alertStyle = .CriticalAlertStyle
        //let response:Int = alert.runModal()
    }
    //NSAlert alertWithError
    @IBAction func function002(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        _ = NSError(domain: NSMachErrorDomain,
                                    code: -1,
                                    userInfo: nil)
        //NSAlertの作成
        //let anAlert:NSAlert = NSAlert(error: anError!)
        //let response:Int = anAlert.runModal()
    }
    //NSAlert layout
    //調査中
    //レイアウトをカスタマイズした時にレイアウトする
    @IBAction func function003(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.alertStyle = .CriticalAlertStyle
        alert.layout()
        //let response:Int = alert.runModal()

    }
    //NSAlert alertStyle
    @IBAction func function004(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.alertStyle = .CriticalAlertStyle
        alert.runModal()
        //let response:Int = alert.runModal()
        switch alert.alertStyle {
        case .WarningAlertStyle :
            NSLog("WarningAlertStyle")
            break
        case .InformationalAlertStyle :
            NSLog("InformationalAlertStyle")
            break
        case .CriticalAlertStyle :
            NSLog("CriticalAlertStyle")
            break
        //default :
          //  break
        }
    }
    //NSAlert alertStyle
    @IBAction func function005(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        //alert.alertStyle = .CriticalAlertStyle
        _ = alert.runModal()
        switch alert.alertStyle {
        case .WarningAlertStyle :
            NSLog("WarningAlertStyle")
            break
        case .InformationalAlertStyle :
            NSLog("InformationalAlertStyle")
            break
        case .CriticalAlertStyle :
            NSLog("CriticalAlertStyle")
            break
        //default :
          //  break
        }

    }
    //NSAlert accessoryView
    @IBAction func function006(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.accessoryView = accessoryView
        _ = alert.runModal()
        
    }
    //NSAlert showsHelp
    @IBAction func function007(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.helpAnchor = "Help"
        alert.showsHelp = true
        _ = alert.runModal()
    }
    //NSAlert delegate
    @IBAction func function008(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.delegate = self
        let delegateObj  = alert.delegate//Swift 1.2
        //var delegateObj  = alert.delegate?
        if (delegateObj != nil) {
            if (delegateObj!.conformsToProtocol(NSAlertDelegate)) {
                NSLog("YES")
            }else{
                NSLog("NO")
            }
        }else{
            NSLog("nil")
        }
        _ = alert.runModal()
        
    }
    //NSAlert runModal/addButtonWithTitle
    @IBAction func function009(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.delegate = self
        alert.addButtonWithTitle("First") //ID 1000
        alert.addButtonWithTitle("Second")  //ID 1001
        alert.addButtonWithTitle("Third")  //ID 1001
        let response:NSModalResponse = alert.runModal()
        //モーダル開始
        NSLog("NSModalResponse %u",response)
        //モーダルが閉じられた場合の結果が帰ってくる
        switch response {
        case 1000 :    //一番右のボタン
            NSLog("First")
        case 1001 :    //二番目
            NSLog("Second")
        case 1002 :       //三番目
            NSLog("Third")
        default :
            break
        }
    }
    //NSAlert　beginSheetModalForWindow:completionHandler:
    @IBAction func function010(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:""))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        alert.delegate = self
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
            }
        }
        

    }
    //NSAlert suppressionButton
    @IBAction func function011(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:""))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        
        let aButton :NSButton = alert.suppressionButton!
        NSLog("---%@", aButton.title)
        alert.showsSuppressionButton = true
        alert.delegate = self
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
            }
        }
    }
    //NSAlert informativeText
    @IBAction func function012(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:""))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        
        let aButton :NSButton = alert.suppressionButton!
        NSLog("---%@", aButton.title)
        alert.showsSuppressionButton = true
        alert.delegate = self
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
            }
        }
    }
    //NSAlert　messageText
    @IBAction func function013(sender: AnyObject) {
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        let messageText:String = "Message text" as String
        let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .WarningAlertStyle
        alert.messageText = messageText
        alert.informativeText = informativeText
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:"停止"))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        
        let aButton :NSButton = alert.suppressionButton!
        NSLog("---%@", aButton.title)
        alert.showsSuppressionButton = true
        alert.delegate = self
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
            }
        }
    }
    //NSAlert icon
    
    @IBOutlet weak var imageView: NSImageView!
    @IBAction func function014(sender: AnyObject) {
        NSLog("function014 called")
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        //let messageText:String = "Message text" as String
        //let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        
        //let anApplication = NSApplication.sharedApplication()
        let imageObj:NSImage = NSImage(named: "anIcon")!
        //        var imageObj:NSImage = anApplication.applicationIconImage
        alert.icon = imageObj
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:"停止"))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
                self.imageView.image = imageObj
            }
        }
        
        
        
        
    }
    //NSAlert buttons
    @IBAction func function015(sender: AnyObject) {
        NSLog("function015 called")
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        //let messageText:String = "Message text" as String
        //let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        
        let anApplication = NSApplication.sharedApplication()
        let imageObj:NSImage = anApplication.applicationIconImage
        alert.icon = imageObj
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:"停止"))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
                self.imageView.image = imageObj
            }
        }
        for (index, button) in alert.buttons.enumerate() {
            NSLog("SecondButton %d %@",index,(button ).title ) //Swift 1.2
            //NSLog("SecondButton %d %@",index,(button as NSButton).title )
        }
        
    }
    //NSAlert window
    @IBAction func function016(sender: AnyObject) {
        NSLog("function016 called")
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        //let messageText:String = "Message text" as String
        //let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        
        let anApplication = NSApplication.sharedApplication()
        let imageObj:NSImage = anApplication.applicationIconImage
        alert.icon = imageObj
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:"停止"))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
                self.imageView.image = imageObj
            }
        }
        NSLog("window %@",alert.window.description )
        
    }
    //NSAlert NSAlertStyle
    @IBAction func function017(sender: AnyObject) {
        NSLog("function017 called")
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        //let messageText:String = "Message text" as String
        //let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .CriticalAlertStyle

        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("OK", comment:""))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Cansel", comment:""))
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
            }
        }
        
        
    }

    func alertShowHelps(alert: NSAlert)  { //Swift 1.2
        NSLog("!!")
    }
//    func alertShowHelp(alert: NSAlert)  {
//        NSLog("!!")
//    }
    //NSAlert Button Return Values
    @IBAction func function018(sender: AnyObject) {
        NSLog("function018 called")
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        //let messageText:String = "Message text" as String
        //let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .CriticalAlertStyle
        
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Stop", comment:"停止"))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Continue", comment:""))
        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            if NSAlertSecondButtonReturn == responseCode {
                NSLog("SecondButton")
            }
        }
    }
    //NSAlert Button Return Values2
    @IBAction func function019(sender: AnyObject) {
        NSLog("function019 called")
        //なにかモーダルがあっても終わり
        NSApp.abortModal()
        
        //テキストの作成
        //let messageText:String = "Message text" as String
        //let informativeText:String = "Information text" as String
        //NSAlertの作成
        let alert:NSAlert = NSAlert()
        alert.alertStyle = .CriticalAlertStyle
        
        //1つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("First", comment:"1"))
        //2つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Second", comment:"2"))
        //3つめのボタン
        alert.addButtonWithTitle(NSLocalizedString("Third", comment:"3"))

        //シートを出す
        alert.beginSheetModalForWindow(window) { responseCode in
            switch(responseCode) {
            case NSAlertFirstButtonReturn:
                NSLog("SecondButton")
                break;
            case NSAlertSecondButtonReturn:
                NSLog("SecondButton")
                break;
            default:
                NSLog("OtherButton")
            }
        }
        
    }
    
    @IBAction func function020(sender: AnyObject) {
    }
    
    @IBAction func function021(sender: AnyObject) {
    }
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

