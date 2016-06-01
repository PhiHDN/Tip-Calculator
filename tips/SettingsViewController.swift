//
//  SettingsViewController.swift
//  tips
//
//  Created by Phi Hoang on 5/31/16.
//  Copyright © 2016 Phi Hoang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageDefault: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tipPercentages = [0.18, 0.2, 0.22]
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipdef = defaults.doubleForKey("tipPercentageDef")
        if tipdef > 0 {
            let indexTmp = tipPercentages.indexOf(tipdef)
            tipPercentageDefault.selectedSegmentIndex = indexTmp!
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func defaultValueChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentages[tipPercentageDefault.selectedSegmentIndex], forKey: "tipPercentageDef")
        defaults.synchronize()
    }
}
