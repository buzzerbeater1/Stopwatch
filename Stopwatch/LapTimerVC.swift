//
//  LapTimerVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit


class LapTimerVC: UIViewControllerStatusBar, UITableViewDelegate, UITableViewDataSource {

    var rows = 1
    var preselectedCar: Car!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        rows += 1
        tableView.reloadData()
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        if rows != 0 {
            rows -= 1
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StopwatchCell", for: indexPath) as? StopwatchCell {
            if preselectedCar != nil {
                cell.carPicker.isHidden = true
                cell.carNameLabel.text = preselectedCar.name
            }
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
