//
//  CarDetailsVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/28/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit


class CarDetailsVC: UIViewControllerStatusBar, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverPresentationControllerDelegate, UITextViewDelegate {
    
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
        
        if let make = carMake.text {
            car.make = make
        }
        
        if let number = carNumber.text {
            car.number = number
        }
        
        if textView != nil {
            if let jobList = textView.text {
                car.joblist = jobList
            }
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
        performSegue(withIdentifier: "ChooseSetupVC", sender: carToEdit)
    }
    
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if carToEdit != nil {
            context.delete(carToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindToCarDetailsVC(segue: UIStoryboardSegue, sender: Any) {
        // Completion code not working: Bug attaches to dismissed VC
        if let segue = segue as? UIStoryboardSegueWithCompletion {
            segue.completion = {
                self.segueSetup()
            }
        }
        // This solution isnt working either. Reason unknown
//        let setupScrollVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetupScrollVC") as? SetupScrollVC
//        setupScrollVC?.car = carToEdit
//        self.navigationController?.viewControllers.append(setupScrollVC!)
//        self.navigationController?.show(setupScrollVC!, sender: self)
    }
    
//    @IBAction func addImage(_ sender: UIButton) {
//        present(imagePicker, animated: true, completion: nil)
//    } 
    
    
    
    @IBOutlet weak var carImageButton: UIButton!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UITextField!
    @IBOutlet weak var carModel: UITextField!
    @IBOutlet weak var lapTimesButton: UIButton!
    @IBOutlet weak var setupsButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var carNumber: UITextField!
    @IBOutlet weak var carMake: UITextField!
    @IBOutlet weak var toggleView: UIView!
    @IBOutlet var toggleImageCollection: [UIImageView]!
    
    
    
    
    var carToEdit: Car!
    var imagePicker: UIImagePickerController!
    var wantSetup: Bool!
    var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        configureButtons()
        
        if carToEdit != nil {
            loadItemData()
        } else {
            lapTimesButton.isEnabled = false
            setupsButton.isEnabled = false
            notesButton.isEnabled = false
            carImageButton.setTitle("Press here for Car Picture", for: .normal)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            carImage.image = img
            carImageButton.setTitle("", for: .normal)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func loadItemData() {
        if let car = carToEdit {
            carName.text = car.name
            carModel.text = car.model
            carImage.image = car.picture as? UIImage
            carMake.text = car.make
            carNumber.text = car.number
            
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
        if segue.identifier == "SetupScrollVC" {
            if let destination = segue.destination as? SetupScrollVC {
                if let sender = sender as? CarDetailsVC {
                    destination.car = sender.carToEdit
                }
            }
        }
        if segue.identifier == "ChooseSetupVC" {
            if let controller = segue.destination as? ChooseSetupVC {
                controller.popoverPresentationController!.delegate = self
                controller.modalPresentationStyle = UIModalPresentationStyle.popover
            }
        }
    }
    
    func segueSetup() {
        if self.wantSetup == true {
            let setupScrollVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SetupScrollVC") as? SetupScrollVC
            setupScrollVC?.car = carToEdit
            self.navigationController?.viewControllers.append(setupScrollVC!)
            self.present(setupScrollVC!, animated: true, completion: nil)
        } else {
            let inRaceSetupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InRaceSetupVC") as? InRaceSetupVC
            inRaceSetupVC?.car = carToEdit
            self.navigationController?.viewControllers.append(inRaceSetupVC!)
            self.present(inRaceSetupVC!, animated: true, completion: nil)
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
    
    func notesTap() {
        if textView == nil {
            textView = UITextView(frame: CGRect(x: 0, y: navigationBar.frame.origin.y + navigationBar.frame.height, width: super.view.bounds.width, height: toggleView.frame.origin.y - (navigationBar.frame.origin.y + navigationBar.frame.height)))
            textView.layer.cornerRadius = 5
            textView.layer.borderColor = UIColor.black.cgColor
            textView.layer.borderWidth = 2
            self.view.addSubview(textView)
            navigationBar.topItem?.title = "Job List"
            textView.delegate = self
            if carToEdit.joblist == nil {
                setText()
            } else {
                textView.text = carToEdit.joblist
            }
            showArrowForJobList(true)
        } else {
            if textView.isHidden {
                textView.isHidden = false
                navigationBar.topItem?.title = "Job List"
                //setText()
                showArrowForJobList(true)
            } else {
                textView.isHidden = true
                navigationBar.topItem?.title = carToEdit.name
                showArrowForJobList(false)
            }
        }
    }
    
    func notesLong(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
        performSegue(withIdentifier: "NotesVC", sender: carToEdit)
        }
    }
    
    func configureButtons() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CarDetailsVC.tap))  //Tap function will call when user tap on button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(CarDetailsVC.long)) //Long function will call when user long press on button.
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(CarDetailsVC.doubleTap)) //DoubleTap dunction will be called if double tap happens.
        let notesTapGesture = UITapGestureRecognizer(target: self, action: #selector(CarDetailsVC.notesTap))
        let notesLongGesture = UILongPressGestureRecognizer(target: self, action: #selector(CarDetailsVC.notesLong))
        print(notesTapGesture.numberOfTapsRequired)
        tapGesture.numberOfTapsRequired = 1
        doubleTapGesture.numberOfTapsRequired = 2
        carImageButton.addGestureRecognizer(tapGesture)
        carImageButton.addGestureRecognizer(longGesture)
        carImageButton.addGestureRecognizer(doubleTapGesture)
        notesButton.addGestureRecognizer(notesTapGesture)
        notesButton.addGestureRecognizer(notesLongGesture)
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
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        //Do shit
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func setText() {
        if textView.text.isEmpty {
            textView.text = "Please write your Job List in this Textfield!"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func showArrowForJobList(_ want: Bool) {
        for view in toggleImageCollection {
            view.isHighlighted = want
        }
    }
    
}
