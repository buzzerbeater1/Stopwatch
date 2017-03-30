//
//  LapTimesTableVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/14/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class LapTimesTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var carToEdit: Car!

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func laptimerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LaptimerVC1", sender: carToEdit)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        tableView.delegate = self
        tableView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if carToEdit.toLaptime != nil {
            return (carToEdit.toLaptime?.count)!
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LapTimeCell", for: indexPath) as? LapTimeCell {
            let time = carToEdit!.toLaptime?.allObjects as! [LapTime]
            if time[indexPath.row].time < 60 {
                cell.lapTimeLabel.text = String(format:"%.04f",	time[indexPath.row].time)
            }else if time[indexPath.row].time < 3600 {
                var combinedTime: String
                let min = Int(round((time[indexPath.row].time / 60)*10)/10)
                let secPre = (time[indexPath.row].time - Double(min*60))
                let sec = String(format:"%2.04f", secPre)
                if secPre < 10 {
                    combinedTime = "\(min):0\(sec)"
                } else {
                    combinedTime = "\(min):\(sec)"
                }
                cell.lapTimeLabel.text = combinedTime
            }else{
                print("Who the fuck takes Laptimes Longer than one hour?!")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
