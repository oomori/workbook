//
//  AppDelegate.swift
//  NSAnimation
//
//  Created by air on 2015/02/11.
//  Copyright (c) 2015年 oomori. All rights reserved.
//  convert Swift 1.1 -> 2.0 2015/10/23

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSAnimationDelegate {

    //Swift 2.0
    @IBOutlet weak var window: NSWindow!
    var theAnim001: NSAnimation?
    var theAnim002: NSAnimation?
    var theAnim003: NSAnimation?
    var theAnim004: NSAnimation?
    var theAnim005: NSAnimation?
    var theAnim006: NSAnimation?
    var theAnim007: NSAnimation?
    var theAnim008: NSAnimation?
    var theAnim009: NSAnimation?
    var theAnim010: NSAnimation?
    var theAnim011: NSAnimation?
    var theAnim012: NSAnimation?
    var theAnim012sub: NSAnimation!
    
    //NSAnimation init
    //Swift2.0
    @IBAction func function001(sender: AnyObject) {
        
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim001 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim001!.frameRate = 20.0
        theAnim001!.delegate = self
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim001!.addProgressMark(progMarks[i])
            NSLog("bbb %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim001!.startAnimation()
        }
    }
    //アニメーション
    func animation(animation: NSAnimation, didReachProgressMark progress: NSAnimationProgress) {
        
        if (animation == theAnim001){
            NSLog("theAnim001")
        }
        if (animation == theAnim002){
            NSLog("theAnim002")
        }
        if (animation == theAnim003){
            NSLog("theAnim003")
        }
        
        if (animation == theAnim004){
            NSLog("theAnim004")
        }
        if (animation == theAnim005){
            NSLog("theAnim005")
        }
        if (animation == theAnim006){
            NSLog("theAnim006")
        }
        if (animation == theAnim007){
            NSLog("theAnim007")
        }
        if (animation == theAnim008){
            NSLog("theAnim008")
        }
        if (animation == theAnim008){
            NSLog("theAnim008")
        }
        if (animation == theAnim009){
            NSLog("theAnim009 %.1f",theAnim009!.currentProgress)
            if (theAnim009!.currentProgress > 0.5){
                theAnim009!.stopAnimation()
                NSLog("end")
            }
        }
        if (animation == theAnim010){
            NSLog("theAnim010 %.1f",theAnim010!.currentProgress)
            if (theAnim010!.currentProgress > 0.5){
                theAnim010!.stopAnimation()
                NSLog("end")
            }
        }
        if (animation == theAnim011){
            NSLog("theAnim011 %.2f %.2f ",theAnim011!.currentValue,progress)
            if (theAnim011!.currentProgress > 0.8){
                theAnim011!.stopAnimation()
                NSLog("end")
            }
        }
        if (animation == theAnim012){
            NSLog("theAnim012 %.2f",theAnim012!.currentValue,progress)
        }

        
        
    }

    //NSAnimation animationBlockingMode
    //Swift 2.0
    @IBAction func function002(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim002 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim002!.frameRate = 20.0
        theAnim002!.delegate = self
        theAnim002!.animationBlockingMode = NSAnimationBlockingMode.Blocking

        //登録
        for (i = 0 ; i<count ; i++){
            theAnim002!.addProgressMark(progMarks[i])
            NSLog("bbb %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim002!.startAnimation()
        }

        
    }
    //NSAnimation runLoopModesForAnimating
    //Swift 2.0
    @IBAction func function003(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim003 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim003!.frameRate = 20.0
        theAnim003!.delegate = self
        theAnim003!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim003!.addProgressMark(progMarks[i])
            NSLog("bbb %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim003!.startAnimation()
        }
        
    }
    //NSAnimation　animationCurve
    //Swift 2.0
    @IBAction func function004(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim004 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim004!.frameRate = 20.0
        theAnim004!.delegate = self
        theAnim004!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim004!.animationCurve = NSAnimationCurve.EaseInOut
        
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim004!.addProgressMark(progMarks[i])
            NSLog("theAnim004 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim004!.startAnimation()
        }
    }
    //NSAnimation duration
    //Swift 2.0
    @IBAction func function005(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim005 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim005!.frameRate = 20.0
        theAnim005!.delegate = self
        theAnim005!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim005!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim005!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim005!.addProgressMark(progMarks[i])
            NSLog("theAnim005 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim005!.startAnimation()
        }
    }
    //NSAnimation frameRate
    //Swift 2.0
    @IBAction func function006(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim006 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim006!.frameRate = 20.0
        theAnim006!.delegate = self
        theAnim006!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim006!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim006!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim006!.addProgressMark(progMarks[i])
            NSLog("theAnim006 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim006!.startAnimation()
        }
    }
    //NSAnimation　delegate
    //Swift 2.0
    @IBAction func function007(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim007 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim007!.frameRate = 20.0
        theAnim007!.delegate = self
        theAnim007!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim007!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim007!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim007!.addProgressMark(progMarks[i])
            NSLog("theAnim006 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim007!.startAnimation()
        }

    }
    //NSAnimation startAnimation
    //Swift 2.0
    @IBAction func function008(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim008 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim008!.frameRate = 20.0
        theAnim008!.delegate = self
        theAnim008!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim008!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim008!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim008!.addProgressMark(progMarks[i])
            NSLog("theAnim006 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim008!.startAnimation()
        }
    }
    //NSAnimation stopAnimation
    //Swift 2.0
    @IBAction func function009(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim009 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim009!.frameRate = 20.0
        theAnim009!.delegate = self
        theAnim009!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim009!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim009!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim009!.addProgressMark(progMarks[i])
            NSLog("theAnim006 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim009!.startAnimation()
        }
        
    }
    //NSAnimation currentProgress
    //Swift 2.0
    @IBAction func function010(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim010 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim010!.frameRate = 20.0
        theAnim010!.delegate = self
        theAnim010!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim010!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim010!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim010!.addProgressMark(progMarks[i])
            NSLog("theAnim006 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim010!.startAnimation()
        }
    }
    //NSAnimation currentValue
    //Swift 2.0
    @IBAction func function011(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        //アニメーション設定
        theAnim011 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim011!.frameRate = 20.0
        theAnim011!.delegate = self
        theAnim011!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim011!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim011!.duration = 5.0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim011!.addProgressMark(progMarks[i])
            NSLog("theAnim006 %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.theAnim011!.startAnimation()
        }
    }
    //NSAnimation　startWhenAnimation:reachesProgress
    //NSAnimation　addProgressMark
    //Swift 2.0
    @IBAction func function012(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        
        //アニメーション設定
        theAnim012 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim012!.frameRate = 20.0
        theAnim012!.delegate = self
        
        theAnim012!.animationBlockingMode = NSAnimationBlockingMode.Blocking
        //theAnim012.animationBlockingMode = NSAnimationBlockingMode.Nonblocking
        
        theAnim012!.animationCurve = NSAnimationCurve.EaseInOut
        theAnim012!.duration = 5.0
        let mark:NSAnimationProgress = 0.3
        theAnim012!.addProgressMark(mark)
        
        //
        theAnim012sub = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        theAnim012sub.frameRate = 20.0
        theAnim012sub.delegate = self
        theAnim012sub.animationBlockingMode = NSAnimationBlockingMode.Blocking
        //theAnim012.animationBlockingMode = NSAnimationBlockingMode.Nonblocking
        
        theAnim012sub.animationCurve = NSAnimationCurve.EaseInOut
        theAnim012sub.duration = 5.0
        
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim012!.addProgressMark(progMarks[i])
            //NSLog("theAnim012 %f",progMarks[i])
        }
        for (i = 0 ; i<count ; i++){
            theAnim012sub.addProgressMark(progMarks[i])
            //NSLog("theAnim012sub %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            //theAnim012のアニメーションが進捗状況0.3まで来たらtheAnim012subをスタート
            self.theAnim012sub.startWhenAnimation(self.theAnim012!,reachesProgress:mark)
            self.theAnim012!.startAnimation()
            //self.theAnim012sub.startAnimation()
        }
    }

    //NSAnimation addProgressMark
    //NSAnimation removeProgressMark
    //NSAnimation progressMarks
    //Swift 2.0
    var theAnim013: NSAnimation!
    @IBAction func function013(sender: AnyObject) {
        //NSAnimationProgress
        //var progMarks : [NSAnimationProgress] =  [
        //    0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
        //    0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        //var i :Int
        //var count :Int = 20
        
        //アニメーション設定
        theAnim013 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        theAnim013.frameRate = 20.0
        theAnim013.delegate = self
        theAnim013.animationBlockingMode = NSAnimationBlockingMode.Blocking
        theAnim013.animationCurve = NSAnimationCurve.EaseInOut
        theAnim013.duration = 5.0
        
        let mark1:NSAnimationProgress = 0.3
        theAnim013.addProgressMark(mark1)
        NSLog("progressMarks a %@", theAnim013.progressMarks.description)
        //->progressMarks a [0.300000011920929]
        
        let mark2:NSAnimationProgress = 0.4
        theAnim013.addProgressMark(mark2)
        NSLog("progressMarks b %@", theAnim013.progressMarks.description)
        //->progressMarks b [0.300000011920929, 0.4000000059604645]
        
        let mark3:NSAnimationProgress = 0.5
        theAnim013.addProgressMark(mark3)
        NSLog("progressMarks c %@", theAnim013.progressMarks.description)
        //->progressMarks c [0.300000011920929, 0.4000000059604645, 0.5]
        
        theAnim013.removeProgressMark(mark3)
        NSLog("progressMarks d %@", theAnim013.progressMarks.description)
        //->progressMarks d [0.300000011920929, 0.4000000059604645]
        
        let mark4:NSAnimationProgress = 0.7
        let mark5:NSAnimationProgress = 0.8
        let mark6:NSAnimationProgress = 0.9
        theAnim013.progressMarks = [mark4,mark5,mark6]
        NSLog("progressMarks e %@", theAnim013.progressMarks.description)
        //->progressMarks e [0.7, 0.8, 0.9]
       
        
    }

    //NSAnimation
    //Swift 2.0
    var theAnim014: NSAnimation!
    var theAnim014sub: NSAnimation!
    @IBOutlet weak var indicator014: NSProgressIndicator!
    @IBOutlet weak var indicator014sub: NSProgressIndicator!
    
    @IBOutlet weak var label014: NSTextField!
    @IBOutlet weak var label014sub: NSTextField!
    @IBAction func function014(sender: AnyObject) {
        //NSAnimationProgress
        var progMarks : [NSAnimationProgress] =  [
            0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5,
            0.55, 0.6, 0.65, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95, 1.0  ]
        var i :Int
        let count :Int = 20
        
        //アニメーション設定
        theAnim014 = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        
        theAnim014.frameRate = 20.0
        theAnim014.delegate = self
        
        theAnim014.animationBlockingMode = NSAnimationBlockingMode.Blocking
        //theAnim014.animationBlockingMode = NSAnimationBlockingMode.Nonblocking
        
        theAnim014.animationCurve = NSAnimationCurve.EaseInOut
        theAnim014.duration = 15.0
        let mark1:NSAnimationProgress = 0.3
        //var mark2:NSAnimationProgress = 0.5
        theAnim014.addProgressMark(mark1)
        
        //
        theAnim014sub = NSAnimation(duration: 10.0, animationCurve: NSAnimationCurve.EaseInOut)
        theAnim014sub.frameRate = 20.0
        theAnim014sub.delegate = self
        theAnim014sub.animationBlockingMode = NSAnimationBlockingMode.Blocking
        //theAnim014sub.animationBlockingMode = NSAnimationBlockingMode.Nonblocking
        
        theAnim014sub.animationCurve = NSAnimationCurve.EaseInOut
        theAnim014sub.duration = 15.0
        
        indicator014.doubleValue = 0
        //登録
        for (i = 0 ; i<count ; i++){
            theAnim014.addProgressMark(progMarks[i])
            //NSLog("theAnim014 %f",progMarks[i])
        }
        for (i = 0 ; i<count ; i++){
            theAnim014sub.addProgressMark(progMarks[i])
            //NSLog("theAnim014sub %f",progMarks[i])
        }
        dispatch_async(dispatch_get_main_queue()) {
            //theAnim014のアニメーションが進捗状況0.3まで来たらtheAnim014subをスタート
            self.theAnim014sub.startWhenAnimation(self.theAnim014,reachesProgress:mark1)
            self.theAnim014sub.stopWhenAnimation(self.theAnim014,reachesProgress:progMarks[10])
            self.theAnim014.startAnimation()
        }
        dispatch_async(dispatch_get_main_queue()) {
            //theAnim014のアニメーションが進捗状況0.3まで来たらtheAnim012subをスタート
            
        }

    }
    //NSAnimation
    //Swift 2.0
    @IBAction func function015(sender: AnyObject) {
        //indicator014.doubleValue = 0.5//Double( theAnim014.currentValue*100.0 )
        
    }
    //NSAnimation
    @IBAction func function016(sender: AnyObject) {
    }
    //NSAnimation
    @IBAction func function017(sender: AnyObject) {
    }
    //NSAnimation
    @IBAction func function018(sender: AnyObject) {
    }
    //NSAnimation
    @IBAction func function019(sender: AnyObject) {
    }
    //NSAnimation
    @IBAction func function020(sender: AnyObject) {
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

