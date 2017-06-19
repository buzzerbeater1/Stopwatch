//
//  NotesVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 17/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class NotesVC: UIViewControllerStatusBar, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentBar: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func segmentBarChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    var car: Car!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        if car != nil {
            print("CAR CAR CAR CAR CAR CAR")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as? NotesCell {
            if segmentBar.selectedSegmentIndex == 0 {
                if car.toWrittenNote?.count != 0 {
                    tableView.rowHeight = 100
                    cell.configureCell(car, at: segmentBar.selectedSegmentIndex, with: indexPath.row)
                    return cell
                }
            } else if segmentBar.selectedSegmentIndex == 1 {
                if car.toPictureNote?.count != 0 {
                    tableView.rowHeight = self.view.frame.width
                    cell.configureCell(car, at: segmentBar.selectedSegmentIndex, with: indexPath.row)
                    return cell
                }
            } else if segmentBar.selectedSegmentIndex == 2 {
                if car.toVoiceNote?.count != 0 {
                    tableView.rowHeight = 100
                    cell.configureCell(car, at: segmentBar.selectedSegmentIndex, with: indexPath.row)
                    return cell
                }
            }
            tableView.rowHeight = 30
            cell.noDataCell(tableView)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentBar.selectedSegmentIndex == 0 {
            if car.toWrittenNote?.count != 0 {
                print("Written?")
                return car.toWrittenNote!.count
            }
        } else if segmentBar.selectedSegmentIndex == 1 {
            if car.toPictureNote?.count != 0 {
                print("PICTURRRRE!")
                return car.toPictureNote!.count
            }
        } else {
            if car.toVoiceNote?.count != 0 {
                print("Voice, maybe....")
                return car.toVoiceNote!.count
            }
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
