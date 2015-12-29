//
//  ViewController.swift
//  tips
//
//  Created by user114577 on 12/8/15.
//  Copyright © 2015 ace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var currentTipVal: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var customValue = 0.18
    var percValue = 0.18

    
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
        let tipPercentages = [0.18, 0.2, 0.22, customValue]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        percValue = tipPercentage
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percValue
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        currentTipVal.text = "\(Int((percValue)*100))%"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        customValue = Double(defaults.integerForKey("PERCENT VALUE")) / 100
        
        let tipPercts = [0.18, 0.2, 0.22, customValue]
        let tipPerct = tipPercts[tipControl.selectedSegmentIndex]
        percValue = tipPerct
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percValue
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        currentTipVal.text = "\(Int((percValue)*100))%"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }
    
}

