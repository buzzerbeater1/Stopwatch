//
//  NotesCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 29/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import AVFoundation

class NotesCell: UITableViewCell, AVAudioPlayerDelegate {

    var voiceNotePlayer: AVAudioPlayer!
    var isPlaying = false
    var playButton: UIButton!
    var slider: UISlider!
    var sliderTimer: Timer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(_ car: Car, at index: Int, with row: Int) {
        if index == 0 {
            let textView = UITextView(frame: CGRect(x: 5, y: 5, width: self.frame.width - 10, height: 90))
            let notes = car.toWrittenNote?.allObjects as! [WrittenNote]
            textView.isEditable = false
            textView.text = notes[row].written
            self.addSubview(textView)
        } else if index == 1 {
            let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: self.frame.width - 10, height: self.frame.width - 10))
            let imageNotes = car.toPictureNote?.allObjects as! [PictureNote]
            let image = imageNotes[row].picture as! UIImage
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            self.addSubview(imageView)
        } else if index == 2 {
            var voiceNotes = car.toVoiceNote?.allObjects as! [VoiceNote]
            voiceNotes = voiceNotes.sorted(by: { ($0.created?.timeIntervalSince1970)! > ($1.created?.timeIntervalSince1970)! })
            let fileURLAppend = voiceNotes[row].filePath
            let fileURL = getDocumentsDirectory().appendingPathComponent(fileURLAppend!)
            
            do {
                voiceNotePlayer = try AVAudioPlayer(contentsOf: fileURL, fileTypeHint: "m4a")
                voiceNotePlayer.delegate = self
            } catch {
                let error = error as NSError
                print("\(error)")
                print("FAIL FAIL FAIL FAIL")
            }
            voiceNotePlayer.prepareToPlay()
            let durationLabel = UILabel(frame: CGRect(x: self.bounds.width - 100, y: 10, width: 90, height: 20))
            durationLabel.text = format(voiceNotePlayer.duration)
            durationLabel.textAlignment = .right
            self.addSubview(durationLabel)
            playButton = UIButton(frame: CGRect(x: 10, y: 10, width: 80, height: 80))
            playButton.setBackgroundImage(UIImage(named: "PlayButton"), for: .normal)
            playButton.addTarget(self, action: #selector(controlSound), for: .touchUpInside)
            self.addSubview(playButton)
            slider = UISlider(frame: CGRect(x: 100, y: 40, width: self.bounds.width - 120, height: 20))
            slider.maximumValue = Float(voiceNotePlayer.duration)
            slider.value = 0.0
            slider.addTarget(self, action: #selector(setTime), for: .valueChanged)
            self.addSubview(slider)
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sliderTap))
            slider.addGestureRecognizer(tapGestureRecognizer)
            let longGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(buttonLong))
            playButton.addGestureRecognizer(longGestureRecognizer)
        }
    }
    
    func noDataCell(_ tableView: UITableView) {
        let noDataLabel = UILabel(frame: CGRect(x: 5, y: 5, width: self.bounds.width - 10, height: 20))
        noDataLabel.text = "There is no Data, sorry."
        self.addSubview(noDataLabel)
        //tableView.rowHeight = 30
    }
    
    override func prepareForReuse() {
        let subViews = self.subviews
        for sv in subViews {
            sv.removeFromSuperview()
        }
    }
    
    func controlSound() {
        if voiceNotePlayer != nil {
            if isPlaying {
                isPlayingSwitch(false)
            } else {
                isPlayingSwitch(true)
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            slider.value = 0.0
            isPlayingSwitch(false)
        }
    }
    
    func isPlayingSwitch(_ state: Bool) {
        if state {
            voiceNotePlayer.play()
            sliderTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateSlider), userInfo: nil, repeats: true)
            playButton.setBackgroundImage(UIImage(named: "PauseButton"), for: .normal)
        } else {
            sliderTimer.invalidate()
            voiceNotePlayer.stop()
            playButton.setBackgroundImage(UIImage(named: "PlayButton"), for: .normal)
        }
        isPlaying = state
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func updateSlider() {
        slider.setValue(Float(voiceNotePlayer.currentTime), animated: true)
    }
    
    func setTime(_ sender: UISlider) {
        voiceNotePlayer.currentTime = TimeInterval(sender.value)
    }
    
    func sliderTap(gestureRecognizer: UIGestureRecognizer) {
        let pointTapped: CGPoint = gestureRecognizer.location(in: self)
        
        let positionOfSlider: CGPoint = slider.frame.origin
        let widthOfSlider: CGFloat = slider.frame.size.width
        let newValue = ((pointTapped.x - positionOfSlider.x) * CGFloat(slider.maximumValue) / widthOfSlider)
        
        slider.setValue(Float(newValue), animated: true)
        voiceNotePlayer.currentTime = TimeInterval(Float(newValue))
    }
    
    func buttonLong() {
        isPlayingSwitch(false)
        slider.value = 0.0
        voiceNotePlayer.currentTime = 0.0
    }
    
    func format(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        
        if duration >= 3600 {
            formatter.allowedUnits.insert(.hour)
        }
        
        return formatter.string(from: duration)!
    }
}
