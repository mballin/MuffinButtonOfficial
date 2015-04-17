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
    
    let data = MBDataController()
    
    @IBAction func muffinButtonWasTapped(sender: AnyObject) {
        data.buyMuffin()
        updateLabels()
    }
    
    @IBAction func baconButtonWasTapped(sender: AnyObject) {
        data.buybacon()
        updateLabels()
    }
    
    
    @IBAction func factoryButtonWasTapped(sender: AnyObject) {
        data.buyfactory()
        updateLabels()
    }
    
    func updateLabels() {
        
        //Muffins
        
        if (data.getMuffinsOwned() == 0) {
            MuffinCounter.text = "You have no muffins."
        } else if (data.getMuffinsOwned() == 1) {
            MuffinCounter.text = "You have: \(String(data.getMuffinsOwned())) muffin."
        } else if (data.getMuffinsOwned() > 1) {
            MuffinCounter.text = "You have: \(String(data.getMuffinsOwned())) muffins."
        }

        //Bacon
        
        if (data.getbaconOwned() == 0) {
            BaconCounter.text = "You have no bacon."
        } else if (data.getbaconOwned() == 1) {
            BaconCounter.text = "You have: \(String(data.getbaconOwned())) slice of bacon."
        } else if (data.getbaconOwned() > 1) {
            BaconCounter.text = "You have: \(String(data.getbaconOwned())) slices of bacon."
        }
        
        //Factories
        
        if (data.getfactoriesOwned() == 0) {
            FactoryCounter.text = "You have no factories."
        } else if (data.getfactoriesOwned() == 1) {
            FactoryCounter.text = "You have: \(String(data.getfactoriesOwned())) factory."
        } else if (data.getfactoriesOwned() > 1) {
            FactoryCounter.text = "You have: \(String(data.getfactoriesOwned())) factories."
        }
        
    }
    
    
    //timers
    
    func factoryTimer () {
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timerFunction"), userInfo: nil, repeats: true)
    }
    
    func timerFunction() {
        data.runFactories()
        updateLabels()
    }
    
    //Passing Data to other View Controllers
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueToShop") {
            var shopViewController = segue.destinationViewController as! ShopViewController
            shopViewController.toPass = data
        }
    }

    
    //Boiler Plate for View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factoryTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.......
    }


}