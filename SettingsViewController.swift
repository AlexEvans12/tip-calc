//
//  SettingsViewController.swift
//  tips
//
//  Created by user114577 on 12/13/15.
//  Copyright © 2015 ace. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func percentChanged(sender: AnyObject) {
        let pValue = Int(percentSlider.value)
        percentLabel.text = "\(pValue)%"
        
        defaults.setInteger(pValue, forKey: "PERCENT VALUE")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        percentLabel.text = "\(defaults.integerForKey("PERCENT VALUE"))%"
        percentSlider.value = Float(defaults.integerForKey("PERCENT VALUE"))
    }
    
    
    /*
    // MARK: - Navigation
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
