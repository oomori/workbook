//
//  ViewController.swift
//  NSDecimalNumberクラス
//
//  Created by air on 2016/03/13.
//  Copyright © 2016 oomori. All rights reserved.
//

import Cocoa

class ViewController: NSViewController  {

    @IBOutlet weak var commentLabel: NSTextField!
    @IBOutlet weak var textField: NSTextField!
    
    //NSDecimalNumber one()
    //http://cocoaapi.hatenablog.com/entry/00150218/Foundation_NSDecimalNumber_one
    @IBAction func function001(sender: AnyObject) {
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        let dNum : NSDecimalNumber = NSDecimalNumber.one()
        numFormat.maximum = dNum    //最大値が1
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function001")
    }
    //NSDecimalNumber zero()
    //http://cocoaapi.hatenablog.com/entry/00130524/Foundation_NSDecimalNumber_zero
    @IBAction func function002(sender: AnyObject) {
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        let dNum : NSDecimalNumber = NSDecimalNumber.zero()
        numFormat.minimum = dNum    //最小値が0
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function002")
    }
    
    //NSDecimalNumber notANumber()
    @IBAction func function003(sender: AnyObject) {
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        let dNum : NSDecimalNumber = NSDecimalNumber.notANumber()
        numFormat.minimum = dNum
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function003")
    }
    
    //NSDecimalNumber notANumber()
    //http://cocoaapi.hatenablog.com/entry/00030403/NSDecimalNumber_notANumber
    @IBAction func function004(sender: AnyObject) {
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        let dNum : NSDecimalNumber = NSDecimalNumber.one()
        numFormat.minimum = dNum    //最小値が1
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function004")
    }
    
    //NSDecimalNumber initWithDecimal:
    //http://cocoaapi.hatenablog.com/entry/00130612/Foundation_NSDecimalNumber_initWithDecimal_
    //NSDecimalNumber decimalValue
    //http://cocoaapi.hatenablog.com/entry/00130609/Foundation_NSDecimalNumber_decimalValue
    @IBAction func function005(sender: AnyObject) {
        let num : NSNumber = NSNumber(float: 23.333)
        let dec : NSDecimal = num.decimalValue
        let dNum : NSDecimalNumber = NSDecimalNumber(decimal: dec)

        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が23.333
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function005")
    }
    
    //NSDecimalNumber initWithMantissa:exponent:isNegative:
    //http://cocoaapi.hatenablog.com/entry/00130613/Foundation_NSDecimalNumber_initWithMantissa_exponent_isNegative_
    @IBAction func function006(sender: AnyObject) {
        let dNum : NSDecimalNumber =
        NSDecimalNumber(mantissa: 3,
            exponent: 2,
            isNegative: false ) //3*10^2 = 300
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function006")
    }
    //NSDecimalNumber initWithString:
    //http://cocoaapi.hatenablog.com/entry/00130614/Foundation_NSDecimalNumber_initWithString_
    @IBAction func function007(sender: AnyObject) {
        let dNum : NSDecimalNumber =
        NSDecimalNumber(string: "300")
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が300
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function007")
    }
    
    //NSDecimalNumber initWithString:locale:　その１
    @IBAction func function008(sender: AnyObject) {
        let localeInfo: Dictionary = [
            "NSDecimalSeparator": "/",  //小数点
            "NSThousandsSeparator":"*"  //桁区切り
            ]
        let dNum : NSDecimalNumber =
        NSDecimalNumber(string: "3000/00", locale: localeInfo)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が3000
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function008")
    }
    //NSDecimalNumber decimalNumberByAdding
    @IBAction func function009(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3000")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "200")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByAdding(dNum2)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が3200
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function009")
        commentLabel.stringValue = "←最小値が3200"
    }
    //NSDecimalNumber decimalNumberBySubtracting:
    @IBAction func function010(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3000")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "200")
        let dNum : NSDecimalNumber = dNum1.decimalNumberBySubtracting(dNum2)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が2800
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function010")
        commentLabel.stringValue = "←最小値が2800"
    }
    //NSDecimalNumber decimalNumberByMultiplyingBy:
    @IBAction func function011(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "30")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "20")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByMultiplyingBy(dNum2)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が600
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function011")
        commentLabel.stringValue = "←最小値が600"
    }
    //NSDecimalNumber decimalNumberByDividingBy:
    //http://cocoaapi.hatenablog.com/entry/00130528/Foundation_NSDecimalNumber_decimalNumberByDividingBy_
    @IBAction func function012(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "600")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "20")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByDividingBy(dNum2)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が30
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function012")
        commentLabel.stringValue = "←最小値が30"
    }
    //NSDecimalNumber decimalNumberByRaisingToPower:
    //http://cocoaapi.hatenablog.com/entry/00130604/Foundation_NSDecimalNumber_decimalNumberByRaisingToPower_
    @IBAction func function013(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "2")
        let dNum2 : Int = 3
        let dNum : NSDecimalNumber = dNum1.decimalNumberByRaisingToPower(dNum2)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が2^3=8
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function013")
        commentLabel.stringValue = "←最小値が2^3=8"
    }
    //NSDecimalNumber　decimalNumberByMultiplyingByPowerOf10
    //http://cocoaapi.hatenablog.com/entry/00130602/Foundation_NSDecimalNumber_decimalNumberByMultiplyingByPowerOf10_
    @IBAction func function014(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "2")
        let dNum2 : Int16 = 3
        let dNum : NSDecimalNumber = dNum1.decimalNumberByMultiplyingByPowerOf10(dNum2)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が2*10^3=2000
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function014")
        commentLabel.stringValue = "←最小値が2*10^3=2000"
    }
    //NSDecimalNumber decimalNumberByAdding:withBehavior:
    //http://cocoaapi.hatenablog.com/entry/00130527/Foundation_NSDecimalNumber_decimalNumberByAdding_withBehavior_
    //NSDecimalNumber defaultBehavior
    //
    @IBAction func function015(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "600")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "20")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByAdding(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が620
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function015")
        commentLabel.stringValue = "←最小値が600+20=620(defaultBehavior)"
    }
    //NSDecimalNumber decimalNumberBySubtracting:withBehavior:
    @IBAction func function016(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3000")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "200")
        let dNum : NSDecimalNumber = dNum1.decimalNumberBySubtracting(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が2800
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function016")
        commentLabel.stringValue = "←最小値が3000-200=2800(defaultBehavior)"
    }
    //NSDecimalNumber decimalNumberByMultiplyingBy:withBehavior:
    @IBAction func function017(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "30")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "20")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByMultiplyingBy(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が600
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function017")
        commentLabel.stringValue = "←最小値が30*20=600(defaultBehavior)"
    }
    //NSDecimalNumber decimalNumberByDividingBy:withBehavior:
    //http://cocoaapi.hatenablog.com/entry/00130529/Foundation_NSDecimalNumber_decimalNumberByDividingBy_withBehavior_
    @IBAction func function018(sender: AnyObject) {
            let dNum1 : NSDecimalNumber =
            NSDecimalNumber(string: "600")
            let dNum2 : NSDecimalNumber =
            NSDecimalNumber(string: "20")
            let dNum : NSDecimalNumber = dNum1.decimalNumberByDividingBy(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
            let numFormat : NSNumberFormatter = NSNumberFormatter()
            numFormat.minimum = dNum    //最小値が30
            numFormat.positiveFormat = "#,##0.00"
            textField.formatter = numFormat
            NSLog("function018")
            commentLabel.stringValue = "←最小値が600/20=30(defaultBehavior)"
    }
        
    //NSDecimalNumber decimalNumberByDividingBy:withBehavior:
    //custom behavior
    //作成中
    func calc019() throws{
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "600")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "0") //<-0で割ってはいけない
        let behavior : NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true) //0で割ったら例外発生をtrueに
        
        let dNum : NSDecimalNumber = dNum1.decimalNumberByDividingBy(dNum2, withBehavior: behavior )
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が30
        numFormat.positiveFormat = "#,##0.00"
        self.textField.formatter = numFormat
        NSLog("function019")
        self.commentLabel.stringValue = "←最小値が600/20=30(custom Behavior)"
    }
    @IBAction func function019(sender: AnyObject) {
        do{
            try calc019()
        } catch {
            NSLog("!!!")
        }
    }
    //NSDecimalNumber decimalNumberByRaisingToPower:withBehavior:
    @IBAction func function020(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "2")
        let dNum2 : Int = 3
        let dNum : NSDecimalNumber = dNum1.decimalNumberByRaisingToPower(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が2^3=8
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function013")
        commentLabel.stringValue = "←最小値が2^3=8"
    }
    //NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:withBehavior:
    //http://cocoaapi.hatenablog.com/entry/00130603/Foundation_NSDecimalNumber_decimalNumberByMultiplyingByPowerOf10_withBehavior_
    @IBAction func function021(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "2")
        let dNum2 : Int16 = 3
        let dNum : NSDecimalNumber = dNum1.decimalNumberByMultiplyingByPowerOf10(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が2*10^3=2000
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function021")
        commentLabel.stringValue = "←最小値が2*10^3=2000"
    }
    //NSDecimalNumber decimalNumberByRoundingAccordingToBehavior:
    //http://cocoaapi.hatenablog.com/entry/00130606/Foundation_NSDecimalNumber_decimalNumberByRoundingAccordingToBehavior_
    @IBAction func function022(sender: AnyObject) {
        //カスタムの丸め挙動　小数点第二位でRoundPlain
        let behavior : NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3.141592")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByRoundingAccordingToBehavior(behavior)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が3.14000
        numFormat.positiveFormat = "#,##0.000000"
        textField.formatter = numFormat
        NSLog("%f",numFormat.minimum!.floatValue)
        commentLabel.stringValue = "←最小値が3.14000"
    }
    //NSDecimalNumber doubleValue
    //http://cocoaapi.hatenablog.com/entry/00130611/Foundation_NSDecimalNumber_doubleValue
    @IBAction func function023(sender: AnyObject) {
        //カスタムの丸め挙動　小数点第二位でRoundPlain
        let behavior : NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3.141592")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByRoundingAccordingToBehavior(behavior)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が3.14000
        numFormat.positiveFormat = "#,##0.000000"
        textField.formatter = numFormat
        NSLog("%f",dNum.doubleValue)
        commentLabel.stringValue = "←最小値が3.14000"
    }
    //NSDecimalNumber　descriptionWithLocale:
    @IBAction func function024(sender: AnyObject) {
        //カスタムの丸め挙動　小数点第二位でRoundPlain
        let behavior : NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3.141592")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByRoundingAccordingToBehavior(behavior)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が3.14000
        numFormat.positiveFormat = "#,##0.000000"
        textField.formatter = numFormat
        let localeInfo: Dictionary = [
            "NSDecimalSeparator": "/",  //小数点
            "NSThousandsSeparator":"*"  //桁区切り
        ]
        NSLog("%@",dNum.descriptionWithLocale(localeInfo))
        //->3/14
        commentLabel.stringValue = "←最小値が3.14000"
    }
    //NSDecimalNumber objCType
    //http://cocoaapi.hatenablog.com/entry/00130616/Foundation_NSDecimalNumber_objCType
    @IBAction func function025(sender: AnyObject) {
        //カスタムの丸め挙動　小数点第二位でRoundPlain
        let behavior : NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3.141592")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByRoundingAccordingToBehavior(behavior)
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が3.14000
        numFormat.positiveFormat = "#,##0.000000"
        textField.formatter = numFormat
        let theType : UnsafePointer<Int8> = dNum.objCType
        NSLog("%s",theType)
        //->d
        commentLabel.stringValue = "←最小値が3.14000"
    }
    //NSDecimalNumber setDefaultBehavior
    @IBAction func function026(sender: AnyObject) {
        //カスタムの丸め挙動　小数点第二位でRoundPlain
        let behavior : NSDecimalNumberHandler = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        
        NSDecimalNumber.setDefaultBehavior(behavior)
        
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3.0")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "0.141295")
        let dNum : NSDecimalNumber = dNum1.decimalNumberByAdding(dNum2, withBehavior: NSDecimalNumber.defaultBehavior())
        let numFormat : NSNumberFormatter = NSNumberFormatter()
        numFormat.minimum = dNum    //最小値が620
        numFormat.positiveFormat = "#,##0.00"
        textField.formatter = numFormat
        NSLog("function026")
        NSLog("%f",dNum.doubleValue)
        //->3.140000
        commentLabel.stringValue = "←最小値が3.14"
    }
    //NSDecimalNumber compare
    //http://cocoaapi.hatenablog.com/entry/00130525/Foundation_NSDecimalNumber_compare_
    @IBAction func function027(sender: AnyObject) {
        let dNum1 : NSDecimalNumber =
        NSDecimalNumber(string: "3.0")
        let dNum2 : NSDecimalNumber =
        NSDecimalNumber(string: "3.141295")
        
        switch dNum1.compare(dNum2) {
        case NSComparisonResult.OrderedAscending:
            NSLog("OrderedAscending")
        case NSComparisonResult.OrderedSame:
            NSLog("OrderedSame")
        case NSComparisonResult.OrderedDescending:
            NSLog("OrderedDescending")
//        default:
//            NSLog("default")
        }
        //->OrderedAscending
    }
    //NSDecimalNumber maximumDecimalNumber
    //NSDecimalNumber minimumDecimalNumber
    @IBAction func function028(sender: AnyObject) {
        NSLog("max %f",NSDecimalNumber.maximumDecimalNumber().doubleValue)
        //->max 3402823669209386527134573422587986984989120495220592886182567909030848074563371292545093099671415093659185923505550104482059460129780644035015876086272801474166652928.000000
        NSLog("min %f",NSDecimalNumber.minimumDecimalNumber().doubleValue)
        //->min -3402823669209386527134573422587986984989120495220592886182567909030848074563371292545093099671415093659185923505550104482059460129780644035015876086272801474166652928.000000
    }
    //NSDecimalNumber
    @IBAction func function029(sender: AnyObject) {
    }
    //NSDecimalNumber
    @IBAction func function030(sender: AnyObject) {
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

