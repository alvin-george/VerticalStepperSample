//
//  VeritcalStepperOnTableView.swift
//  VerticalStepper
//
//  Created by Pushpam Group on 25/04/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

protocol CustomVerticalStepperOnTableDeleagte {
    func getStepperValue(currentStepperValue :String)
    func getStepperViewTag(tag:Int)
}

class VeritcalStepperOnTableView: UIControl {
    
    var incrementButton: UIButton!
    var decrementButton: UIButton!
    var stepperValueLabel: UILabel!
    
    var stepperValue:Int = 0
    var stepperValueLowerLimit :Int = 0
    var stepperValueUpperLimit :Int = 10
    var stepperStepValue:Int = 1
    
    var customDelegate: CustomVerticalStepperOnTableDeleagte?
    
    var currentViewFrame: CGRect?
    
    override func draw(_ rect: CGRect){
        super.draw(rect)
        currentViewFrame =  rect
        
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        print("control loaded on tableview")
        self.backgroundColor = UIColor.white
        self.isOpaque = true
       
        
        incrementButton = UIButton(frame: CGRect( x: self.frame.size.width/2-15 , y: 0, width : 30, height: 30))
        incrementButton.makeRoundedCornerEdge(button: incrementButton, cornerRadius: 3.0)
        incrementButton.tag = 0
        incrementButton?.backgroundColor =  UIColor.red
        incrementButton?.setTitle("+", for: .normal)
        incrementButton?.tintColor =  UIColor.white
        incrementButton?.titleLabel?.font =  UIFont.systemFont(ofSize: 30.0)
        incrementButton?.addTarget(self, action: #selector(self.stepperValueChanged(_:)), for: .touchUpInside)
        
        decrementButton = UIButton(frame: CGRect( x: self.frame.size.width/2-15, y:  40, width : 30, height: 30))
        decrementButton.makeRoundedCornerEdge(button: decrementButton, cornerRadius: 3.0)
        decrementButton.tag = 1
        decrementButton?.backgroundColor =  UIColor.red
        decrementButton?.setTitle("-", for: .normal)
        decrementButton?.tintColor =  UIColor.white
        decrementButton?.titleLabel?.font =  UIFont.systemFont(ofSize: 35.0)
        decrementButton?.addTarget(self, action: #selector(self.stepperValueChanged(_:)), for: .touchUpInside)

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
        //stepperValueLabel.text =  String(stepperValue)
        customDelegate?.getStepperValue(currentStepperValue: String(stepperValue))
        customDelegate?.getStepperViewTag(tag: self.tag)
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


extension UIButton {
    func makeRoundedCornerEdge(button:UIButton, cornerRadius : CGFloat)
    {
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = 1
        button.backgroundColor =  UIColor.clear
        button.layer.borderColor = button.backgroundColor?.cgColor
    }
    
}

