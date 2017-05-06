//
//  SetupVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupVC: UIViewController, UIPopoverPresentationControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker: UIImagePickerController!
    var car: Car!
    
    
    @IBOutlet weak var tirePressureFLTextfield: UITextField!
    @IBOutlet weak var tirePressureFRTextfield: UITextField!
    @IBOutlet weak var tirePressureRLTextfield: UITextField!
    @IBOutlet weak var tirePressureRRTextfield: UITextField!
    @IBOutlet weak var carNameLabel: UILabel!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let currentSetup = car.toSetup?.allObjects as? [Setup] {
            if currentSetup.indices.contains(0) {
//                currentSetup[0].tirePressureFL = Double(tirePressureFLTextfield.text!)!
//                currentSetup[0].tirePressureFR = Double(tirePressureFRTextfield.text!)!
//                currentSetup[0].tirePressureRR = Double(tirePressureRRTextfield.text!)!
//                currentSetup[0].tirePressureRL = Double(tirePressureRLTextfield.text!)!
            } else {
                let newSetup = Setup(context: context)
//                newSetup.tirePressureFL = Double(tirePressureFLTextfield.text!)!
//                newSetup.tirePressureFR = Double(tirePressureFRTextfield.text!)!
//                newSetup.tirePressureRR = Double(tirePressureRRTextfield.text!)!
//                newSetup.tirePressureRL = Double(tirePressureRLTextfield.text!)!
                car.addToToSetup(newSetup)
                ad.saveContext()
            }
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pictureButtonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker,animated: true,completion: nil)
            print("Long press")
        } else {
            noCamera()
        }
    }
    
    @IBAction func voiceButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "VoiceNoteVC", sender: car)
    }
    
    @IBAction func writeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "WrittenNoteVC", sender: car)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if car == nil {
            print("There is no car")
        } else {
            print("We have a car, that is cool")
        }
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        configureLabels()
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

    func configureLabels() {
        carNameLabel.text = car.name
        if let carSetup = car.toSetup?.allObjects as? [Setup] {
            if carSetup.indices.contains(0) {
//                tirePressureFLTextfield.text = String(carSetup[0].tirePressureFL)
//                tirePressureFRTextfield.text = String(carSetup[0].tirePressureFR)
//                tirePressureRRTextfield.text = String(carSetup[0].tirePressureRR)
//                tirePressureRLTextfield.text = String(carSetup[0].tirePressureRL)
            }
        }
    }
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        //Do shit
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue for the popover configuration window
        if segue.identifier == "VoiceNoteVC" {
            if let controller = segue.destination as? VoiceNoteVC {
                controller.popoverPresentationController!.delegate = self
                controller.modalPresentationStyle = UIModalPresentationStyle.popover
                if let car = sender as? Car {
                    controller.car = car
                }
            }
        }
        if segue.identifier == "WrittenNoteVC" {
            if let controller = segue.destination as? WrittenNoteVC {
                controller.popoverPresentationController!.delegate = self
                controller.modalPresentationStyle = UIModalPresentationStyle.popover
                if let car = sender as? Car {
                    controller.car = car
                }
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            let note = Note(context: context)
//            note.picture = img
//            car.addToToNote(note)
//            ad.saveContext()
//            print(car.toNote!.count)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
