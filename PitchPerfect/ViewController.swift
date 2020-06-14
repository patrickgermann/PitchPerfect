//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Patrick Germann on 14.06.20.
//  Copyright © 2020 Patrick Germann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    recordingLabel.text = "Recording in Progress"
    recordButton.isEnabled = false
    stopRecordingButton.isEnabled = true
  }
  @IBAction func stopRecording(_ sender: Any) {
    stopRecordingButton.isEnabled = false
    recordButton.isEnabled = true
    recordingLabel.text = "Tap to Record..."
  }
}

