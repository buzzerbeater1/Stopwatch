//
//  LapTimerVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import CoreData

class LapTimerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var rows = 1
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        rows += 1
        tableView.reloadData()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if rows != 0 {
            rows -= 1
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
      
        
       
        
//        carPicker.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StopwatchCell", for: indexPath) as? StopwatchCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

protocol pickerChangedDelegate{
    func updateName(car: String)
}
