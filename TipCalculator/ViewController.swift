//
//  ViewController.swift

//
//  Created by Liza on 6/16/18.
//  Copyright © 2018 Liza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bill = 0.0
    var tip = 0.0
    var total = 0.0
    public var billHistory:Array<Array<Double>>=[[]]
    let tipOpt=[0.15, 0.18, 0.2]
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var historyBill: UILabel!
    @IBOutlet weak var historyPercentage: UILabel!
    @IBOutlet weak var historyTip: UILabel!
    @IBOutlet weak var historyTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearBill(_ sender: Any) {
        let currentVal = getCurrent()
        billHistory.append(currentVal)
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
    func getCurrent() -> Array<Double> {
        let currentInfo = [bill, tip, total]
        return currentInfo
    }
    
    
    @IBAction func HistoryPressed(_ sender: Any) {
        
        view.endEditing(true)
        for element in billHistory{
            print(element)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHistoryViewControllerSegue"{
            let hist = segue.destination as! HistoryViewController
            hist.array = billHistory
        }
    }//will run for any segue at this view controler
}

