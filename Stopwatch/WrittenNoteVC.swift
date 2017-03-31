//
//  WrittenNoteVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/30/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class WrittenNoteVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    var car: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self

        textView.text = "Please write your Note in this Textfield!"
        textView.textColor = UIColor.lightGray
        // Do any additional setup after loading the view.
        
        if car == nil {
            print("There is no car")
        } else {
            print("We have a car, that is cool")
        }
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
    
    override func viewWillDisappear(_ animated: Bool) {
        let note = Note(context: context)
        note.written = textView.text
        car.addToToNote(note)
        ad.saveContext()
        print(car.toNote!.count)
    }

}
