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
            } else {
                let newSetup = Setup(context: context)
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

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        configureLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configureLabels() {
        carNameLabel.text = car.name
        if let carSetup = car.toSetup?.allObjects as? [Setup] {
            if carSetup.indices.contains(0) {
            }
        }
    }
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        //Do shit
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
