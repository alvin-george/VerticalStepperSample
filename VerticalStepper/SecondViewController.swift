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
    @IBOutlet var totalPaymentLabel: UILabel!
    
    var numberOfDishes:Int = Int()
    var currentRow:Int = Int()
    var totalCostPerDish:Int = Int()
    
    var dishItemNameAndPriceDictionary = [Dictionary<String,String>]()
    var dishPriceArray:[Double] = []
    var dishItemTotalPriceArray: [Int] = []
    
    var totalPrice:Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        
    }
    func update() {
        
        dishItemNameAndPriceDictionary.append(["dish_name":"Mutton Biriyani", "dish_price":"25"])
        dishItemNameAndPriceDictionary.append(["dish_name":"Chicken Tikka", "dish_price":"35"])
        dishItemNameAndPriceDictionary.append(["dish_name":"Fish Biriyani", "dish_price":"45"])
        dishItemNameAndPriceDictionary.append(["dish_name":"American Choupsey", "dish_price":"75"])
        dishPriceArray = [25,35,45,75]
        
        
        //setting initial dishItemTotalPriceArray
        for var i in (0..<dishPriceArray.count)
        {
            dishItemTotalPriceArray.append(0)
        }
        
        print("dishItemTotalPriceArray @ beginning: \(dishItemTotalPriceArray)")
        
    }
    
    //Sample Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dishItemNameAndPriceDictionary.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleTableViewCell") as! SampleTableViewCell
        //distItemTotalPriceArray = []
        
        cell.verticalStepper.tag =  indexPath.row
        cell.verticalStepper.customDelegate =  self
        
        cell.dishName.text = dishItemNameAndPriceDictionary[indexPath.row]["dish_name"]
        cell.dishPrice.text =  "$ " + dishItemNameAndPriceDictionary[indexPath.row]["dish_price"]!
        
        if (currentRow ==  indexPath.row){
            totalCostPerDish = Int (dishPriceArray[indexPath.row])*numberOfDishes
            cell.totalDishPrice.text = "$ "+String(totalCostPerDish)
            
            //replacing the price array elements
            dishItemTotalPriceArray[indexPath.row] = totalCostPerDish
            
        }
        
        
        
        // distItemTotalPriceArray Total
        totalPrice = dishItemTotalPriceArray.reduce(0, +)
        totalPaymentLabel.text = "$ "+String(totalPrice)
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
