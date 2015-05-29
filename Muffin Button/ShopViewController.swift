//
//  ShopViewController.swift
//  Muffin Button
//
//  Created by Mateen Rabbani on 10/17/14.
//  Copyright (c) 2014 RaBallin. All rights reserved.
//

import Foundation

import UIKit


class ShopViewController: UIViewController {
    
    var toPass: MBDataController!
    
    @IBOutlet weak var ShopBackButton: UIBarButtonItem!

    @IBOutlet weak var muffinLabel: UILabel!
    @IBOutlet weak var baconLabel: UILabel!
    @IBOutlet weak var factoryLabel: UILabel!
    @IBOutlet weak var multipliersLabel: UILabel!
    @IBOutlet weak var muffinMultiplierCost: UILabel!
    
    @IBAction func ShopBackButtonWasTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func buyMultiplierButtonWasTapped(sender: AnyObject) {
        toPass.purchaseMuffinMultiplier()
        //NOTE: need to add price here, maybe display and also display current multiplier
        updateLabels()
    }
    
    override func viewDidLoad() {
        updateLabels()
    }
    
    func updateLabels() {
        
        //Muffins
        
        if (toPass.getMuffinsOwned() == 0) {
            muffinLabel.text = "You have no muffins."
        } else if (toPass.getMuffinsOwned() == 1) {
            muffinLabel.text = "You have: \(String(toPass.getMuffinsOwned())) muffin."
        } else if (toPass.getMuffinsOwned() > 1) {
            muffinLabel.text = "You have: \(String(toPass.getMuffinsOwned())) muffins."
        }
        
        //Bacon
        
        if (toPass.getbaconOwned() == 0) {
            baconLabel.text = "You have no bacon."
        } else if (toPass.getbaconOwned() == 1) {
            baconLabel.text = "You have: \(String(toPass.getbaconOwned())) slice of bacon."
        } else if (toPass.getbaconOwned() > 1) {
            baconLabel.text = "You have: \(String(toPass.getbaconOwned())) slices of bacon."
        }
        
        //Factories
        
        if (toPass.getfactoriesOwned() == 0) {
            factoryLabel.text = "You have no factories."
        } else if (toPass.getfactoriesOwned() == 1) {
            factoryLabel.text = "You have: \(String(toPass.getfactoriesOwned())) factory."
        } else if (toPass.getfactoriesOwned() > 1) {
            factoryLabel.text = "You have: \(String(toPass.getfactoriesOwned())) factories."
        }
        
        //Muffin Multipliers
        if (toPass.getMuffinMultiplier() == 0) {
            multipliersLabel.text = "You have no multiplier."
        } else if (toPass.getMuffinMultiplier() == 1) {
            multipliersLabel.text = "You have: \(String(toPass.getMuffinMultiplier())) multiplier."
        } else if (toPass.getMuffinMultiplier() > 1) {
            multipliersLabel.text = "You have: \(String(toPass.getMuffinMultiplier())) multipliers."
        }
        
        //Multiplier Price
            muffinMultiplierCost.text = "You will need " + String(toPass.getMuffinMultiplierPrice()) + " bacon for a multiplier."

        
    }
    
}