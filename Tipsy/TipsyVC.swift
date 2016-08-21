//
//  ViewController.swift
//  Tipsy
//
//  Created by Aaron Burns on 2016/08/18.
//  Copyright © 2016 Aaron Burns. All rights reserved.
//

import UIKit

class TipsyVC: UIViewController {

    // MARK: - @IBOutlets
    
    @IBOutlet weak var tipsyTitleView: UIView!
    @IBOutlet weak var tipsyTitleLbl: UILabel!
    @IBOutlet weak var billAmountTF: UITextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var splitNumLbl: UILabel!
    @IBOutlet weak var splitNumSlider: UISlider!
    @IBOutlet weak var eachAmountLbl: UILabel!
    
    
    // MARK: - @Properties
    
    var tipsyModel = TipsyModel(billAmount: 0.0, tipPercent: 0, splitNum: 0)
    
    
    // MARK: - Initialize Views
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentValue()
        splitNumValue()
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func billAmountChanges(_ sender: AnyObject) {
        calcTip()
    }
    
    //changes the tip percentage lable based on the slider value
    @IBAction func tipPercentChanges(_ sender: AnyObject) {
        tipPercentValue()
        calcTip()
    }
    
    //changes the number next to the split slider
    @IBAction func splitNumChanges(_ sender: AnyObject) {
        splitNumValue()
        calcTip()
    }
    
    
    // MARK: - Functions
    
    func calcTip() {
        tipsyModel.tipPercent = Int(tipPercentSlider.value)
        tipsyModel.billAmount = ((billAmountTF.text)! as NSString).doubleValue
        tipsyModel.splitNum = Int(splitNumSlider.value)
        tipsyModel.calculateTip()
        updateUI()
    }

    func updateUI() {
        tipAmountLbl.text = String(format: "$%0.2f", tipsyModel.tipAmount)
        totalAmountLbl.text = String(format: "$%0.2f", tipsyModel.totalAmount)
        eachAmountLbl.text = String(format: "$%0.2f", tipsyModel.eachAmount)
    }
    
    func tipPercentValue() {
        tipPercentLbl.text = "TIP \(Int(tipPercentSlider.value))%"
    }
    
    func splitNumValue() {
        splitNumLbl.text = "SPLIT \(Int(splitNumSlider.value))"
    }
    
}

