//
//  VoiceNoteVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/30/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceNoteVC: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordButton: UIButton!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var car: Car!
    var currentSetupRun: SetupRun!
    var currentSetup: Setup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        print("Failed to load")
                    }
                }
            }
        } catch {
            let error = error as NSError
            print("\(error) Nothing going on here")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadRecordingUI() {
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
    }
    
    func startRecording() {
        let note = VoiceNote(context: context)
        let pathComponent = "recording\(note.created as! Date).m4a"
        let audioFilename = getDocumentsDirectory().appendingPathComponent(pathComponent)
        note.filePath = pathComponent
        car.addToToVoiceNote(note)
        
        if currentSetup != nil {
            currentSetup.addToToVoiceNote(note)
        }
        if currentSetupRun != nil {
            currentSetupRun.addToToVoiceNote(note)
        }
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            ad.saveContext()
        } else {
            // recording failed :(
        }
        recordButton.setTitle("Tap to Record", for: .normal)
    }
    
    func recordTapped() {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
}
