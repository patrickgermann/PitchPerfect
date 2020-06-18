//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Patrick Germann on 14.06.20.
//  Copyright © 2020 Patrick Germann. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

  var audioRecorder: AVAudioRecorder!
  
  @IBOutlet weak var recordingLabel: UILabel!
  @IBOutlet weak var recordButton: UIButton!
  @IBOutlet weak var stopRecordingButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear called")
    stopRecordingButton.isEnabled = false
  }

  @IBAction func recordAudio(_ sender: Any) {
    toggleRecButton(true)
    
    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
    let recordingName = "recordedVoice.wav"
    let pathArray = [dirPath, recordingName]
    let filePath = URL(string: pathArray.joined(separator: "/"))

    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

    try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
    audioRecorder.delegate = self
    audioRecorder.isMeteringEnabled = true
    audioRecorder.prepareToRecord()
    audioRecorder.record()
    
  }
  @IBAction func stopRecording(_ sender: Any) {
    toggleRecButton(false)
    
    audioRecorder.stop()
    let audioSession = AVAudioSession.sharedInstance()
    try! audioSession.setActive(false)
  }
  
  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    if flag {
      performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
    } else {
      print("recording was not successful")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "stopRecording" {
      let playSoundsVC = segue.destination as! PlaySoundsViewController
      let recordedAudioURL = sender as! URL
      playSoundsVC.recordedAudioURL = recordedAudioURL
    }
  }
  
  func toggleRecButton(_ isRecording: Bool) {
    if isRecording {
      recordingLabel.text = "Recording in Progress"
      recordButton.isEnabled = false
      stopRecordingButton.isEnabled = true
    } else {
      recordingLabel.text = "Tap to Record..."
      recordButton.isEnabled = true
      stopRecordingButton.isEnabled = false
    }
  }
}

