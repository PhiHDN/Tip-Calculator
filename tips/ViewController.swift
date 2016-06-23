//
//  ViewController.swift
//  tips
//
//  Created by Phi Hoang on 5/7/16.
//  Copyright © 2016 Phi Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = Constant.tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(billAmount, forKey: "savedBill")
        defaults.synchronize()
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        //let tipPercentages = [0.18, 0.2, 0.22]
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipdef = defaults.doubleForKey("tipPercentageDef")
        if tipdef > 0 {
            let indexTmp = Constant.tipPercentages.indexOf(tipdef)
            tipControl.selectedSegmentIndex = indexTmp!
        }
        let previousBill = defaults.doubleForKey("savedBill")
        if previousBill > 0 {
            billField.text = String(previousBill)
        }
        onEditingChanged(self)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }

}

