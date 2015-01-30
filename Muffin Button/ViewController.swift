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
    
    @IBOutlet weak var FactoryUpgradeButton: UIButton!
    
    @IBOutlet weak var ShopButton: UIButton!
    
    @IBOutlet weak var SuperConverterMB: UIButton!
    
    @IBOutlet weak var MuffinToBaconFactoryButton: UIButton!
    
    //@IBOutlet weak var ShopButton: UIButton!
    
    var muffinNum = 0
    
    var baconNum = 0
    
    var factoryNum = 0
    
    var factoryInterval = 1.0
    
    var factoryIntervalTappedNumber = 0
    
    var muffinToBaconConverterBoolean = true
    
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
    
    @IBAction func factoryUpgradeButtonWasTapped(sender: AnyObject) {
        if (factoryIntervalTappedNumber <= 50) {
            if (baconNum >= 100) {
                baconNum -= 100
                factoryInterval = factoryInterval - factoryInterval/10
                factoryIntervalTappedNumber++
                factoryTimer()
            }
        } else {
            FactoryUpgradeButton.enabled = false
        }
        updateLabels()
    }
    
    @IBAction func SuperConverterMBWasTapped(sender: AnyObject) {
        if (muffinNum >= 20) {
            var baconNumTwo = baconNum
            baconNum = muffinNum/10 + baconNum
            baconNum -= baconNumTwo/2
            muffinNum = muffinNum % 10
            updateLabels()
        }
    }
    
    @IBAction func MuffinToBaconFactoryButtonWasTapped(sender: AnyObject) {
        if (baconNum >= 10000) {
            baconNum -= 10000
        muffinToBaconConverterBoolean = false
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
        buttonHiding()
    }
    
    func factoryTimer () {
        NSTimer.scheduledTimerWithTimeInterval(factoryInterval, target: self, selector: Selector("upgradeTimer"), userInfo: nil, repeats: true)
    }
    
    func upgradeTimer() {
        if (muffinToBaconConverterBoolean) {
            if (factoryNum>=1) {
                muffinNum+=factoryNum
                updateLabels()
            }
            } else if (muffinToBaconConverterBoolean == false) {
                if (factoryNum>=1) {
                    baconNum+=factoryNum
                    updateLabels()
                    MuffinToBaconFactoryButton.enabled = false
            }
        }
    }
    
    func buttonHiding () {
        if (muffinNum >= 10) {
            BaconButton.enabled = true
        } else {
            BaconButton.enabled = false
        }
        if (baconNum >= 10) {
            FactoryButton.enabled = true
        } else {
            FactoryButton.enabled = false
        }
        if (baconNum >= 100) {
            FactoryUpgradeButton.enabled = true
        } else {
            FactoryUpgradeButton.enabled = false
        }
        if (baconNum >= 10000) {
            MuffinToBaconFactoryButton.enabled = true
        } else {
            MuffinToBaconFactoryButton.enabled = false
        }
        if (muffinNum >= 20) {
            SuperConverterMB.enabled = true
        } else {
            SuperConverterMB.enabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factoryTimer()
        updateLabels()
        buttonHiding()
        BaconButton.enabled = false
        FactoryButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.......
    }


}