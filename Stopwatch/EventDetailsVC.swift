//
//  EventDetailsVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/26/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import CoreData

class EventDetailsVC: UIViewControllerStatusBar, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBAction func sessionPlannerButtonPressed(_ sender: UIButton) {
        if event.startDate != nil && event.endDate != nil {
            performSegue(withIdentifier: "SessionPlannerVC", sender: event)
        } else {
            let alert = UIAlertController(title: "Warning!", message: "Session Planner only available if a start and end date is set!!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK!", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {

        if let name = nameTextfield.text {
            event.name = name
        }
        if let location = locationTextfield.text {
            event.location = location
        }
        if let circuit = circuitTextfield.text {
            event.circuit = circuit
        }
        
        if event.name != nil && event.name != "" && event.startDate != nil && event.endDate != nil {
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        if event != nil {
            context.delete(event)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        if step == 0 {
            startDateLabel.text = strDate
        } else {
            endDateLabel.text = strDate
        }
    }
    
    @IBAction func startDateButtonPressed(_ sender: UIButton) {
        if showDatePicker {
            step = 0
            hideDatePicker(false)
            navigationBar.topItem?.title = "Set Start Date!"
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            startDateLabel.text = dateFormatter.string(from: datePicker.date)
        } else {
            hideDatePicker(true)
            if step == 0 {
                event.startDate = datePicker.date as NSDate?
            } else {
                event.endDate = datePicker.date as NSDate?
            }
        }
    }
    
    @IBAction func endDateButtonPressed(_ sender: UIButton) {
        if showDatePicker {
            step = 1
            hideDatePicker(false)
            navigationBar.topItem?.title = "Set End Date!"
            datePicker.minimumDate = event.startDate as Date?
        } else {
            hideDatePicker(true)
            if step == 0 {
                event.startDate = datePicker.date as NSDate?
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = DateFormatter.Style.short
                dateFormatter.timeStyle = DateFormatter.Style.short
                startDateLabel.text = dateFormatter.string(from: datePicker.date)
            } else {
                event.endDate = datePicker.date as NSDate?
            }
        }
    }
    
    
    
    @IBAction func addCarButtonPressed(_ sender: UIButton) {
        if addCarsMode {
            self.cars = event.toCar?.allObjects as! [Car]!
            addCarsMode = false
            tableViewLabel.text = "Participating Cars"
            addCarButton.titleLabel?.text = "Add"
        } else {
            addCarsMode = true
            var tempCars = controller.fetchedObjects
            tempCars?.removeObjectsInArray(array: event.toCar?.allObjects as! [Car])
            cars = tempCars
            tableViewLabel.text = "Please choose a car!"
            addCarButton.setTitle("Cancel", for: .normal)
        }
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var addCarButton: UIButton!
    @IBOutlet weak var datePickerBackground: UIView!
    @IBOutlet weak var circuitTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewLabel: UILabel!
    @IBOutlet weak var sessionPlannerButton: UIButton!
    @IBOutlet weak var weatherButton: UIButton!
    
    
    var event: RaceEvent!
    var startDate: NSDate!
    var endDate: NSDate!
    var showDatePicker: Bool = true
    var step = 0
    var cars: [Car]!
    var controller: NSFetchedResultsController<Car>!
    var addCarsMode: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        if event != nil {
            if event.startDate != nil && event.endDate != nil {
                
            } else {
                sessionPlannerButton.isEnabled = false
                weatherButton.isEnabled = false
            }
            loadEventData()
        } else {
            event = RaceEvent(context: context)
            sessionPlannerButton.isEnabled = false
            weatherButton.isEnabled = false
        }
        
        cars = event.toCar?.allObjects as! [Car]
        attemptFetch()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadEventData() {
        if let event = event {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            nameTextfield.text = event.name
            locationTextfield.text = event.location
            circuitTextfield.text = event.circuit
            navigationBar.topItem?.title = event.name
            if let start = event.startDate {
                startDateLabel.text = dateFormatter.string(from: start as Date)
            }
            if let end = event.endDate {
                endDateLabel.text = dateFormatter.string(from: end as Date)
            }
        }
    }
    
    func tap() {
        if step == 0 {
            event.startDate = datePicker.date as NSDate?
            datePicker.minimumDate = event.startDate as Date?
            navigationBar.topItem?.title = "Set End Date!"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            startDateLabel.text = dateFormatter.string(from: datePicker.date)
        }else if step == 1 {
            event.endDate = datePicker.date as NSDate?
            hideDatePicker(true)
            step = 0
            datePicker.minimumDate = nil
        }else {
            
        }
    }
    
    func hideDatePicker(_ hide: Bool) {
        datePicker.isHidden = hide
        showDatePicker = hide
        datePickerBackground.isHidden = hide
        if hide {
            navigationBar.topItem?.title = event.name
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarsCell", for: indexPath) as? CarsCell {
            configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if addCarsMode {
            if let cars = cars, cars.count > 0 {
                let car = cars[indexPath.row]
                event.addToToCar(car)
                self.cars = event.toCar?.allObjects as! [Car]!
                addCarsMode = false
                tableViewLabel.text = "Participating Cars"
                addCarButton.setTitle("Add", for: .normal)
                tableView.reloadData()
            }
        } else {
            if let cars = cars , cars.count > 0 {
                let car = cars[indexPath.row]
                performSegue(withIdentifier: "CarDetailsVC", sender: car)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CarDetailsVC" {
            if let destination = segue.destination as? CarDetailsVC {
                if let car = sender as? Car {
                    destination.carToEdit = car
                }
            }
        }
        if segue.identifier == "WeatherVC" {
            if let destination = segue.destination as? WeatherVC {
                destination.event = self.event
            }
        }
        if segue.identifier == "SessionPlannerVC" {
            if let destination = segue.destination as? SessionPlannerVC  {
                destination.event = event
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cars = cars {
            return cars.count
        }
        return 0
    }
    
    func configureCell(cell: CarsCell, indexPath: NSIndexPath) {
        let car = cars[indexPath.row]
        cell.configureCell(car: car)  
    }
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
}
