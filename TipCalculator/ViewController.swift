//
//  ViewController.swift
//  TipCalculator
//
//  Created by Liza on 6/16/18.
//  Copyright © 2018 Liza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func keyboardHide(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let tipOpt=[0.15, 0.18, 0.2]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipOpt[tipControl.selectedSegmentIndex]
        let total = bill+tip
        print(tip)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
}

