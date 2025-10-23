//
//  ViewController.swift
//  Xylophone
//
//  Created by Abylai  on 02.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let sname = sender.titleLabel?.text ?? ""
        playSound(soundName: sname)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func playSound(soundName: String) {
        guard let sound = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        player = try? AVAudioPlayer(contentsOf: sound)
        player?.play()
        
    }
}

