//
//  MBDataController.swift
//  bacon Button
//
//  Created by Mateen Rabbani on 3/20/15.
//  Copyright (c) 2015 RaBallin. All rights reserved.
//

import Foundation

class MBDataController {
    
    init() {
        self.muffinsOwned = 0
        self.muffinMultiplier = 1
        self.muffinMultiplierPrice = 10
        
        self.baconOwned = 0
        self.baconMultiplier = 1
        self.baconMultiplierPrice = 10
        
        self.factoriesOwned = 0

    }
    
    //Muffin
    
    private var muffinsOwned: Int
    private var muffinMultiplier: Int
    private var muffinMultiplierPrice: Double
    
    func buyMuffin() {
        muffinsOwned += 1*getMuffinMultiplier()
    }
    
    func getMuffinsOwned() -> Int {
        return muffinsOwned
    }
    
    func getMuffinMultiplier() -> Int {
        return muffinMultiplier
    }
    
    func addToMuffinMultiplier() {
        muffinMultiplier += 1
    }
    
    /// Adds one to the muffin multiplier, and raises the price of later multipliers.
    func purchaseMuffinMultiplier() {
        if (Double(getbaconOwned()) >= getMuffinMultiplierPrice()) {
            addToMuffinMultiplier()
            muffinMultiplierPrice *= 1.2
            baconOwned -= Int(muffinMultiplierPrice)
        }
    }
    
    func getMuffinMultiplierPrice() -> Double{
        return muffinMultiplierPrice
    }
    
    //Bacon
    
    private var baconOwned: Int
    private var baconMultiplier: Int
    private var baconMultiplierPrice: Double
    
    func buybacon() {
        if (muffinsOwned >= 10){
            baconOwned += 1*getbaconMultiplier()
            muffinsOwned -= 10
        }
    }
    
    func getbaconOwned() -> Int {
        return baconOwned
    }
    
    func getbaconMultiplier() -> Int {
        return baconMultiplier
    }
    
    func addTobaconMultiplier() {
        baconMultiplier += 1
    }
    
    /// Adds one to the bacon multiplier, and raises the price of later multipliers.
    func purchasebaconMultiplier() {
        addTobaconMultiplier()
        baconOwned -= Int(baconMultiplierPrice)
        baconMultiplierPrice *= 1.2
    }
    
    //Factories
    
    private var factoriesOwned: Int
    
    func buyfactory() {
        if (baconOwned >= 10){
            baconOwned -= 10
            factoriesOwned++
        }
    }
    
    func getfactoriesOwned() -> Int {
        return factoriesOwned
    }
    

    //Timers for Factories
    
    func runFactories() {
        if (factoriesOwned >= 1) {
            muffinsOwned += factoriesOwned
        }
        
    }
    
}