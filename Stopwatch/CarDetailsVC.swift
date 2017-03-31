//
//  CarDetailsVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/28/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit


class CarDetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        
        var car: Car!
        let picture = carImage.image
        
        
        if carToEdit == nil {
            car = Car(context: context)
        } else {
            car = carToEdit
        }
        
        car.picture = picture
        
        if let name = carName.text {
            car.name = name
        }
        
        
        
        if let model = carModel.text {
            car.model = model
        }
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func lapTimesButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LapTimesTableVC", sender: carToEdit)
    }
    
    @IBAction func setupButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SetupVC", sender: carToEdit)
    }
    
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if carToEdit != nil {
            context.delete(carToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func addImage(_ sender: UIButton) {
//        present(imagePicker, animated: true, completion: nil)
//    } 
    
    
    
    @IBOutlet weak var carImageButton: UIButton!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UITextField!
    @IBOutlet weak var carModel: UITextField!
    
    
    var carToEdit: Car!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        configureImageButton()
        
        if carToEdit != nil {
            loadItemData()
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            carImage.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func loadItemData() {
        if let car = carToEdit {
            carName.text = car.name
            carModel.text = car.model
            carImage.image = car.picture as? UIImage
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LapTimesTableVC" {
            if let destination = segue.destination as? LapTimesTableVC {
                if let car = sender as? Car {
                    destination.carToEdit = car
                }
            }
        }
        if segue.identifier == "SetupVC" || segue.identifier == "PopoverSetupVC" {
            if let destination = segue.destination as? SetupVC {
                if let car = sender as? Car {
                    destination.car = car
                }
            }
        }
    }
    
    func tap() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
        print("Tap happend")
    }
    
    func long() {
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
    
    func doubleTap() {
        let alert = UIAlertController(title: "Download Picture", message: "Please Input a valid picture URL!", preferredStyle: .alert)
//        let alertAction = UIAlertAction(title: "Download", style: .default, handler: nil)
        let alertAction = UIAlertAction(title: "Submit", style: .default, handler: { (action) -> Void in
            // Get 1st TextField's text
            let textField = alert.textFields![0]
            self.carName.text = textField.text!
        })
        alert.addAction(alertAction)
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Enter URL:"
//            textField.isSecureTextEntry = true
        })
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func configureImageButton() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CarDetailsVC.tap))  //Tap function will call when user tap on button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(CarDetailsVC.long)) //Long function will call when user long press on button.
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(CarDetailsVC.doubleTap)) //DoubleTap dunction will be called if double tap happens.
        tapGesture.numberOfTapsRequired = 1
        doubleTapGesture.numberOfTapsRequired = 2
        carImageButton.addGestureRecognizer(tapGesture)
        carImageButton.addGestureRecognizer(longGesture)
        carImageButton.addGestureRecognizer(doubleTapGesture)
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
}
