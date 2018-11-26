//
//  ViewController.swift
//  Xylophone
//
//  Created by Julien Shim on 11/26/18.
//  Copyright © 2018 Julien Shim. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        
        print(sender.tag)
        
        let note = "note" + String(sender.tag)
        
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            
            print(error.localizedDescription)
            
        }
        
    }
    
    
}

