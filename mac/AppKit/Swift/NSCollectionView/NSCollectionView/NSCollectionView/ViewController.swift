//
//  ViewController.swift
//  NSCollectionView
//
//  Created by air on 2015/03/22.
//  Copyright (c) 2015年 oomori. All rights reserved.
//
//Swift2.0

import Cocoa

class ViewController: NSViewController {

    var hoge: Hoge!
    var hogeArray: NSMutableArray!
    
    @IBOutlet weak var hogeCollectionView: NSCollectionView!
    @IBOutlet var arrayController: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemPrototype = self.storyboard?.instantiateControllerWithIdentifier("collectionViewItem")
            as! NSCollectionViewItem
        hogeCollectionView.itemPrototype = itemPrototype
        hoge = Hoge()
        hogeArray = NSMutableArray(array:[hoge, hoge, hoge])
        //hogeCollectionView.content = accountArray
    }


    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

