//
//  TipsyModel.swift
//  Tipsy
//
//  Created by Aaron Burns on 2016/08/20.
//  Copyright © 2016 Aaron Burns. All rights reserved.
//

import Foundation

class TipsyModel {
    
    private var _billAmount = 0.0
    
    //changed tipPercent to an Int so that tip and total amounts don't change based on the float value of the slider
    private var _tipPercent = 0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    
    //private variables for the slider set
    private var _splitNum = 0
    private var _eachAmount = 0.0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Int {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    //two split slider variables
    var splitNum: Int {
        get {
            return _splitNum
        } set {
            _splitNum = newValue
        }
    }
    
    var eachAmount: Double {
        return _eachAmount
    }
    
    //tipPercent should be an Int instead of the Double that was set in the tutorials
    init(billAmount: Double, tipPercent: Int, splitNum: Int) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitNum = splitNum
    }
    
    func calculateTip() {
        //casting the tipPercent from Int to Double and dividing by 100 to turn it into a decimal (this must also be changed in the slider attributes in the storyboard.
        _tipAmount = billAmount * (Double(tipPercent) / 100)
        _totalAmount = tipAmount + billAmount
        _eachAmount = totalAmount / Double(splitNum)
    }
}
