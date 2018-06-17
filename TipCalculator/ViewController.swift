//
//  ViewController.swift
//  TipCalculator
//
//  Created by Liza on 6/16/18.
//  Copyright © 2018 Liza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bill = 0.0
    var tip = 0.0
    var total = 0.0
    var billHistory:Array<Double>=[0]
    let tipOpt=[0.15, 0.18, 0.2]
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var historyBill: UILabel!
    @IBOutlet weak var historyPercentage: UILabel!
    @IBOutlet weak var historyTip: UILabel!
    @IBOutlet weak var historyTotal: UILabel!
    
    
//    @IBOutlet weak var historyPercentage: UILabel!
//    @IBOutlet weak var historyTip: UILabel!
//    @IBOutlet weak var historyTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearBill(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        billHistory.append(bill)
        reset()
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        bill = Double(billField.text!) ?? 0
//        billHistory.append(bill)
        tip = bill * tipOpt[tipControl.selectedSegmentIndex]
        total = bill+tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    func reset (){
         billField.text = ""
         tipControl.selectedSegmentIndex = 0
         tipLabel.text = "$0.00"
         totalLabel.text = "$0.00"
    }
    
    @IBAction func HistoryPressed(_ sender: Any) {
        view.endEditing(true)
//        let bh = "test"
//        billField.text? = bh
        for element in billHistory{
//            let elementHistory = element
//            historyBill.text = String(element)
            print(element)
        }
    }
    
    
}

