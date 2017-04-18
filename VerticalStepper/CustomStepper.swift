//
//  CustomStepper.swift
//  VerticalStepper
//
//  Created by Pushpam Group on 18/04/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

protocol CustomVerticalStepperDeleagte {
    func getStepperValue(currentStepperValue :String)
}

class CustomVerticalStepper: UIControl {
    
    var incrementButton: UIButton!
    var decrementButton: UIButton!
    var stepperValueLabel: UILabel!
    
    var stepperValue:Int = 0
    var stepperValueLowerLimit :Int = 0
    var stepperValueUpperLimit :Int = 10
    var stepperStepValue:Int = 1
    
    var customDelegate: CustomVerticalStepperDeleagte?
    
    var currentViewFrame: CGRect?
    
    override func draw(_ rect: CGRect){
        super.draw(rect)
        currentViewFrame =  rect
        
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        print("control loaded")
        self.backgroundColor = UIColor.clear
        self.isOpaque = true
        
        stepperValueLabel = UILabel(frame: CGRect( x: self.frame.size.width/2-20, y: 0, width : 40, height: 40))
        stepperValueLabel.font = UIFont.systemFont(ofSize: 25.0)
        stepperValueLabel.textColor = UIColor.red
        stepperValueLabel.textAlignment = .center
        stepperValueLabel.numberOfLines = 1
        stepperValueLabel.text =  String(stepperValue)
        
        
        
        incrementButton = UIButton(frame: CGRect( x: self.frame.size.width/2-20 , y: 40, width : 40, height: 40))
        incrementButton.tag = 0
        incrementButton?.backgroundColor =  UIColor.red
        incrementButton?.setTitle("+", for: .normal)
        incrementButton?.tintColor =  UIColor.white
        incrementButton?.titleLabel?.font =  UIFont.systemFont(ofSize: 35.0)
        incrementButton?.addTarget(self, action: #selector(self.stepperValueChanged(_:)), for: .touchUpInside)
        
        decrementButton = UIButton(frame: CGRect( x: self.frame.size.width/2-20, y:  100, width : 40, height: 40))
        decrementButton.tag = 1
        decrementButton?.backgroundColor =  UIColor.red
        decrementButton?.setTitle("-", for: .normal)
        decrementButton?.tintColor =  UIColor.white
        decrementButton?.titleLabel?.font =  UIFont.systemFont(ofSize: 35.0)
        decrementButton?.addTarget(self, action: #selector(self.stepperValueChanged(_:)), for: .touchUpInside)
        
        self.addSubview(stepperValueLabel)
        self.addSubview(incrementButton)
        self.addSubview(decrementButton)
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func stepperValueChanged(_ sender: UIButton!) {
        
        switch sender.tag {
        case 0:
            checkUpperLimitIsCrossed()
        case 1:
            checkLowerLimitIsCrossed()
        default:
            break
        }
        stepperValueLabel.text =  String(stepperValue)
        customDelegate?.getStepperValue(currentStepperValue: stepperValueLabel.text!)
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
