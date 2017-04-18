//
//  ViewController.swift
//  VerticalStepper
//
//  Created by Pushpam Group on 18/04/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var incrementButton: UIButton!
    @IBOutlet var decrementButton: UIButton!
    
    @IBOutlet var stepperValueLabel: UILabel!
    
    var stepperValue: Int = 0
    var stepperValueLowerLimit :Int = 0
    var stepperValueUpperLimit :Int = 10
    var stepperStepValue:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incrementButton.addTarget(self, action: #selector(ViewController.stepperValueChanged(_:)), for: UIControlEvents.touchUpInside)
        
        decrementButton.addTarget(self, action: #selector(ViewController.stepperValueChanged(_:)), for: UIControlEvents.touchUpInside)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func stepperValueChanged(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            checkUpperLimitIsCrossed()
        case 1:
            checkLowerLimitIsCrossed()
        default:
            break
        }
        stepperValueLabel.text =  "$ "+String(stepperValue)
    }
    
    func checkUpperLimitIsCrossed()
    {
        if (stepperValue >= stepperValueUpperLimit )
        {
            stepperValue = stepperValueUpperLimit
        }
        else {
            stepperValue += stepperStepValue
        }
        
    }
    func checkLowerLimitIsCrossed()
    {
        if (stepperValue <= stepperValueLowerLimit)
        {
            stepperValue = stepperValueLowerLimit
        }
        else {
            stepperValue -= stepperStepValue
        }
    }
    
}

