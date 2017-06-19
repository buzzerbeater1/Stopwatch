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
    var currentSetupRun: SetupRun!
    var currentSetup: Setup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.text = "Please write your Note in this Textfield!"
        textView.textColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Please write your Note in this Textfield!"
            textView.textColor = UIColor.lightGray
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if textView.text != "Please write your Note in this Textfield!" && textView.text != "" {
            let note = WrittenNote(context: context)
            note.written = textView.text
            car.addToToWrittenNote(note)
            if currentSetupRun != nil {
                currentSetupRun.addToToWrittenNote(note)
            }
            if currentSetup != nil {
                currentSetup.addToToWrittenNote(note)
            }
            ad.saveContext()
        }
    }
}
