//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Patrick Germann on 14.06.20.
//  Copyright © 2020 Patrick Germann. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
  
  @IBOutlet weak var snailButton: UIButton!
  @IBOutlet weak var chipmunkButton: UIButton!
  @IBOutlet weak var rabbitButton: UIButton!
  @IBOutlet weak var vaderButton: UIButton!
  @IBOutlet weak var echoButton: UIButton!
  @IBOutlet weak var reverbButton: UIButton!
  @IBOutlet weak var stopButton: UIButton!
  
  var recordedAudioURL: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
