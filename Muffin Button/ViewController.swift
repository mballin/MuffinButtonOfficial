//
//  ViewController.swift
//  Muffin Button
//
//  Created by Mateen Rabbani on 10/3/14.
//  Copyright (c) 2014 RaBallin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MuffinCounter: UILabel!
    
    @IBOutlet weak var BaconCounter: UILabel!
    
    @IBOutlet weak var MuffinButton: UIButton!
    
    @IBOutlet weak var BaconButton: UIButton!
    
    @IBOutlet weak var FactoryButton: UIButton!

    @IBOutlet weak var FactoryCounter: UILabel!
    
    @IBOutlet weak var ShopButton: UIButton!
    
    var muffinNum = 0
    
    var baconNum = 0
    
    var factoryNum = 0
    
    @IBAction func muffinButtonWasTapped(sender: AnyObject) {
        
        muffinNum++
        updateLabels()
    }
    
    @IBAction func baconButtonWasTapped(sender: AnyObject) {
        if (muffinNum >= 10) {
            muffinNum -= 10
            baconNum++
            updateLabels()
            
        }
    }
    
    @IBAction func factoryButtonWasTapped(sender: AnyObject) {
        if (baconNum >= 10) {
            baconNum -= 10
            factoryNum++
            updateLabels()
        }
    }
    
    func updateLabels() {
        if (factoryNum == 0) {
            FactoryCounter.text = "You have no factories."
        } else if (factoryNum == 1) {
            FactoryCounter.text = "You have: 1 factory."
        } else if (factoryNum > 1) {
            FactoryCounter.text = "You have: \(String(factoryNum)) factories."
        }
        
        if (baconNum == 0) {
            BaconCounter.text = "You have no bacon."
        } else if (baconNum == 1) {
            BaconCounter.text = "You have: 1 slice of bacon."
        } else if (baconNum > 1) {
            BaconCounter.text = "You have: \(String(baconNum)) slices of bacon."
        }
        
        if (muffinNum == 0) {
            MuffinCounter.text = "You have no muffins."
        } else if (muffinNum == 1) {
            MuffinCounter.text = "You have: 1 muffin."
            
        } else if (muffinNum > 1) {
            MuffinCounter.text = "You have: \(String(muffinNum)) muffins."
        }
    }
    
    func factoryTimer () {
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("upgradeTimer"), userInfo: nil, repeats: true)
    }
    
    func upgradeTimer() {
        if factoryNum>=1 {
        muffinNum+=factoryNum
        updateLabels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factoryTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.......
    }


}