//
//  SessionDetailsVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 10/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import CoreData

class SessionDetailsVC: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        if let name = nameTextfield.text {
            session.name = name
        }
        
        if let details = descriptionTextView.text {
            session.details = details
        }
        
        if let eventDay = currentDay {
            session.eventDay = eventDay
        }
        
        if session.name != nil && session.name != "" {
            event.addToToSession(session)
            ad.saveContext()
            print("We will save it!!")
        }
        
        
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIBarButtonItem) {
        if session != nil {
            context.delete(session)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.none
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        let strDate = dateFormatter.string(from: datePicker.date)
        if step == 0 {
            startDateLabel.text = strDate
        } else {
            endDateLabel.text = strDate
        }
    }
    
    @IBAction func datePickerButtonPressed(_ sender: UIButton) {
        if showDatePicker {
            hideDatePicker(false)
            navigationBar.topItem?.title = "Set Start Date!"
        } else {
            hideDatePicker(true)
        }
    }
    
    @IBAction func addCarButtonPressed(_ sender: UIButton) {
        if addCarsMode {
            self.cars = session.toCar?.allObjects as! [Car]!
            addCarsMode = false
            tableViewLabel.text = "Participating Cars"
            addCarButton.titleLabel?.text = "Add"
        } else {
            addCarsMode = true
            var tempCars = controller.fetchedObjects
            tempCars?.removeObjectsInArray(array: session.toCar?.allObjects as! [Car])
            cars = tempCars
            tableViewLabel.text = "Please choose a car!"
            addCarButton.setTitle("Cancel", for: .normal)
        }
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addCarButton: UIButton!
    @IBOutlet weak var datePickerBackground: UIView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewLabel: UILabel!
    
    var session: Session!
    var currentDay: String!
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
        //TEST DATA DELETE IT AGAIN
    //   let sessionArray = event.toSession?.allObjects as? [Session]
    //    session = sessionArray?[0]
        tableView.delegate = self
        tableView.dataSource = self
        
        if event != nil {
            print("we have an event")
        }
        
        if session != nil {
            loadSessionData()
            print("We have a session")
        } else {
            session = Session(context: context)
            print("We will create a session")
        }
        print(currentDay)
        
        configurePickerButton()
        cars = session.toCar?.allObjects as! [Car]
        attemptFetch()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSessionData() {
        if let session = session {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.none
            dateFormatter.timeStyle = DateFormatter.Style.short
            nameTextfield.text = session.name
            navigationBar.topItem?.title = session.name
            if let start = session.startTime {
                startDateLabel.text = dateFormatter.string(from: start as Date)
            }
            if let end = session.endTime {
                endDateLabel.text = dateFormatter.string(from: end as Date)
            }
        }
    }
    
    func configurePickerButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EventDetailsVC.tap))  //Tap function will call when user tap on button
        tapGesture.delegate = self
        //        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(CarDetailsVC.long)) //Long function will call when user long press on button.
        //        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(CarDetailsVC.doubleTap)) //DoubleTap dunction will be called if double tap happens.
        tapGesture.numberOfTapsRequired = 1
        //        doubleTapGesture.numberOfTapsRequired = 2
        datePicker.addGestureRecognizer(tapGesture)
        //        carImageButton.addGestureRecognizer(longGesture)
        //        carImageButton.addGestureRecognizer(doubleTapGesture)
    }
    
    func tap() {
        if step == 0 {
            session.startTime = datePicker.date as NSDate?
            step += 1
            datePicker.minimumDate = session.startTime as Date?
            navigationBar.topItem?.title = "Set End Date!"
        }else if step == 1 {
            session.endTime = datePicker.date as NSDate?
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
            navigationBar.topItem?.title = session.name
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
                session.addToToCar(car)
                self.cars = session.toCar?.allObjects as! [Car]!
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
