//
//  SessionPlannerVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 5/3/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SessionPlannerVC: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func debugButtonPressed(_ sender: UIBarButtonItem) {
        print((event.toSession?.count)! as Int)
        print("Do stuff")
        for tv in dayTables {
            tv.reloadData()
        }
    }
    @IBAction func debugPressed(_ sender: UIButton) {
        print((event.toSession?.count)! as Int)
        print("Do stuff")
        for tv in dayTables {
            tv.reloadData()
        }
    }

    @IBAction func sgmentChanged(_ sender: UISegmentedControl) {
        mainScrollView.contentOffset = CGPoint(x: segmentBar.selectedSegmentIndex*375, y: 0)
    }

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var segmentBar: UISegmentedControl!
    @IBOutlet weak var mainScrollView: UIScrollView!
   
    var event: RaceEvent!
    var sessions: [Session]!
    var numberOfDays: Int!
    var dayTables: [UITableView]! = []
    var weekDays: [String]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if event != nil {
            print("We have an event in the planner!")
        }
        
        if event.toSession?.allObjects != nil {
            sessions = event.toSession?.allObjects as! [Session]
            print("We have this many sessions: \(sessions.count)")
        }
        
        numberOfDays = findNumberOfDays()
        weekDays = createWeekdays(from: event.startDate as! Date, to: event.endDate as! Date)
        print("number of week days: \(weekDays)")
        
        mainScrollView.delegate = self
        mainScrollView.contentSize = CGSize(width: numberOfDays*375, height: 550)
        let frame = CGRect(x: 0, y: 0, width: 375, height: 550)
        repeat {
            let x = dayTables.count
            if x == segmentBar.numberOfSegments {
                segmentBar.insertSegment(withTitle: "", at: x, animated: true)
            }
            segmentBar.setTitle(weekDays[x], forSegmentAt: x)
            let tv = UITableView(frame: frame, style: .plain)
            tv.delegate = self
            tv.dataSource = self
            tv.tag = x
            mainScrollView.addSubview(tv)
            tv.frame.origin = CGPoint(x: x*375, y: 0)
            tv.register(SessionCell.self, forCellReuseIdentifier: "SessionCell")
            dayTables.append(tv)
        } while (dayTables.count < numberOfDays)
    }
    
    func findNumberOfDays() -> Int {
        let calendar = NSCalendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: event.startDate as! Date)
        let date2 = calendar.startOfDay(for: event.endDate as! Date)
        
        let components = calendar.dateComponents([.weekday], from: date1, to: date2)
        
        return components.weekday! + 1
    }
    
    func createWeekdays(from start: Date,to end: Date) -> [String] {
        let calendar = NSCalendar.current
        var weekdays: [String]! = []
        var weekday: [String]!
        let numberOfStartDay = calendar.component(.weekday, from: start)
        print("number of start day:\(numberOfStartDay)")
        let numberOfEndDay = calendar.component(.weekday, from: end)
        print("number of end day:\(numberOfEndDay)")
        if numberOfDays < 5 {
            weekday = calendar.weekdaySymbols
        } else {
            weekday = calendar.shortWeekdaySymbols
        }
        for x in numberOfStartDay...numberOfEndDay {
            weekdays.append(weekday[x-1])
        }
        return weekdays
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell", for: indexPath) as? SessionCell {
            for session in sessions {
                if session.eventDay == "Mon" && tableView.tag == 0 {
                    
                    cell.label?.text = "\(indexPath.row)"
                }
                if session.eventDay == "Wed" && tableView.tag == 2 {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "HH"
                    let start = Int(dateFormatter.string(from: session.startTime! as Date))!
                    let end = Int(dateFormatter.string(from: session.endTime!as Date))!
                    dateFormatter.dateFormat = "mm"
                    let startMinute = Int(dateFormatter.string(from: session.startTime! as Date))!
                    let endMinute = Int(dateFormatter.string(from: session.endTime! as Date))!
                    if indexPath.row >= start && indexPath.row <= end {
                        cell.label?.text = "\(indexPath.row)"
                        cell.yellowStrip?.isHidden = false
                        if indexPath.row == start {
                            cell.yellowStrip?.frame = CGRect(x: 30, y: (Double(startMinute)/60)*Double(cell.frame.height), width: 5, height: (1 - (Double(startMinute)/60))*Double(cell.frame.height))
                        }
                        if indexPath.row == end {
                            cell.yellowStrip?.frame = CGRect(x: 30, y: 0, width: 5, height: (Double(endMinute)/60)*Double(cell.frame.height))
                        }
                    }
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            segmentBar.selectedSegmentIndex = (Int(mainScrollView.contentOffset.x)+(375/2))/375
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SessionDetailsVC" {
            if let destination = segue.destination as? SessionDetailsVC {
                destination.event = self.event
                destination.currentDay = self.segmentBar.titleForSegment(at: self.segmentBar.selectedSegmentIndex)
            }
        }
    }
    
    
}
