//
//  ViewController.swift
//  Xylophone
//
//  Created by Julien Shim on 11/26/18.
//  Copyright © 2018 Julien Shim. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        let SelectedSoundFileName: String = "note\(sender.tag)"
        
        UIView.animate(withDuration: 0.0) {
            sender.alpha = 0.5
        }
        
        playSound(soundFileName: SelectedSoundFileName)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            UIView.animate(withDuration: 0.0) {
                sender.alpha = 1.0
            }
        }
        
    }
    
    func playSound(soundFileName: String) {
        
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        
        catch {
            print(error)
        }
        
        audioPlayer.play()
        
    }
    
}
