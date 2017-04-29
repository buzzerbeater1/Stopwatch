//
//  CarsVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/28/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import CoreData

class CarsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var controller: NSFetchedResultsController<Car>!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //generateTestData()
        attemptFetch()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CarsCell", for: indexPath) as? CarsCell {
            configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func configureCell(cell: CarsCell, indexPath: NSIndexPath) {
        let car = controller.object(at: indexPath as IndexPath)
        cell.configureCell(car: car)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = controller.fetchedObjects , objs.count > 0 {
            let car = objs[indexPath.row]
            performSegue(withIdentifier: "CarDetailsVC", sender: car)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            print(sections.count)
            return sections.count
        }
        return 0
    }
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        //let modelSort = NSSortDescriptor(key: "model", ascending: true)
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
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! CarsCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    
    
    
//    func generateTestData() {
//        let car1 = Cars(image: "1", nameDetails: "CTCC Car 1", model: "BMW M3")
//        let car2 = Cars(image: "2", nameDetails: "TCR Car 4", model: "Subaru BRZ")
//        let car3 = Cars(image: "3", nameDetails: "Formula 4 Car 2", model: "Toyota 43SZ")
//        
//        cars.append(car1)
//        cars.append(car2)
//        cars.append(car3)
//    }
    
    func generateTestData() {
        let car = Car(context: context)
        car.model = "Tesla Model S"
        car.name = "CTCC Car 1"
        car.picture = UIImage(named: "1")
        
        let car2 = Car(context: context)
        car2.model = "Tesla Model X"
        car2.name = "China GT1"
        car2.picture = UIImage(named: "2")
        
        let car3 = Car(context: context)
        car3.model = "Tesla Model 3"
        car3.name = "TCR Asia"
        car3.picture = UIImage(named: "3")
        
        ad.saveContext()
    }
    
    
    
    
    
    
    
    
}
