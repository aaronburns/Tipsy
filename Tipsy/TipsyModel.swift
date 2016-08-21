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
    private var _tipPercent = 0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    
    //second slider set
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
    
    init(billAmount: Double, tipPercent: Int, splitNum: Int) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
    }
    
    func calculateTip() {
        _tipAmount = billAmount * (Double(tipPercent) / 100)
        _totalAmount = tipAmount + billAmount
        _eachAmount = totalAmount / Double(splitNum)
    }
}
