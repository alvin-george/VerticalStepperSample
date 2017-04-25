//
//  SecondViewController.swift
//  VerticalStepper
//
//  Created by Pushpam Group on 25/04/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, CustomVerticalStepperOnTableDeleagte {

    @IBOutlet var sampleTableView: UITableView!
    
    var dishcartTotalCost:String = ""
    var numberOfDishes:Int = Int()
    var currentRow:Int = Int()
    
    var totalCostPerDish:Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Sample Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleTableViewCell") as! SampleTableViewCell
        cell.verticalStepper.customDelegate =  self
        cell.verticalStepper.tag =  indexPath.row
        
        
        if (currentRow ==  indexPath.row){
            
            totalCostPerDish = 25*numberOfDishes
            cell.totalDishPrice.text = String(totalCostPerDish)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        print(btn.tag)
        
    }
    //Button Actions
    func viewKitchenButtonClicked ( _ sender : UIButton){

    }
    func billHistoryButtonClicked ( _ sender :  UIButton){

    }
    //CustomVerticalStepperOnTableDeleagte
    func getStepperValue(currentStepperValue: String) {
        print("currentStepperValue : \(currentStepperValue)")
       numberOfDishes = Int(currentStepperValue)!
        
        self.sampleTableView.reloadData()
        
    }
    func getStepperViewTag(tag: Int) {
        print("getStepperViewTag : \(tag)")
        currentRow =  tag
        self.sampleTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
