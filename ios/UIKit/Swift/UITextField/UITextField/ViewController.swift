//
//  ViewController.swift
//  UITextField
//
//  Created by air on 2015/02/15.
//  Copyright (c) 2015年 oomori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var defaultTF: UITextField!
    //UITextField　text
    //テキスト
    @IBAction func function001(sender: AnyObject) {
        defaultTF.text = "こんにちは"
    }
    //UITextField　placeholder
    //プレースホルダ
    @IBAction func function002(sender: AnyObject) {
        defaultTF.placeholder = "プレースホルダ"
    }
    //UITextField attributedText
    //属性付きテキスト
    @IBAction func function003(sender: AnyObject) {
        var attrs = [NSForegroundColorAttributeName: UIColor.redColor(),
                        NSFontAttributeName : UIFont.systemFontOfSize(19.0)]
        var aText : NSAttributedString = NSAttributedString(string: "属性付き文字",
                                            attributes: attrs)
        defaultTF.attributedText = aText
    }
    //UITextField
    @IBAction func function004(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function005(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function006(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function007(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function008(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function009(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function010(sender: AnyObject) {
    }
    //UITextField
    @IBAction func function011(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

