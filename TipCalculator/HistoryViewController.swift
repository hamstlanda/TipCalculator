//
//  HistoryViewController.swift
//  TipCalculator
//
//  Created by Liza Liutova on 7/4/18.
//  Copyright © 2018 Liza. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {

    var array:Array<Array<Double>> = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let (historyItem) = array[indexPath.row]
        if(historyItem.count > 1){
            let a = String(format: "$%.2f", historyItem[0])
            let b = String(format: "$%.2f", historyItem[1])
            let c = String(format: "$%.2f", historyItem[2])
            cell.textLabel?.text = "\(a), \(b), \(c)"
        }else{
            let string = "bill, tip amount, total"
            
            cell.textLabel?.text = string
        }
        
       
        return cell
    }
    
    @IBOutlet weak var historyTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History"
        print("from table", array[2])
        // Do any additional setup after loading the view.
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
