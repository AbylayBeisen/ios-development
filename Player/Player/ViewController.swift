//
//  ViewController.swift
//  Player
//
//  Created by Abylai  on 02.11.2025.
//

import UIKit
import AVFoundation

struct TrackItems{
  let image: UIImage?
  let title: String
  let soundname: String
  let artistname: String
}

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var currentItem = 0
    var playing = false
    var timer: Timer?
    
    
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var ArtistName: UILabel!
    @IBOutlet weak var playback: UILabel!
    @IBOutlet weak var totalduration: UILabel!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var Label: UILabel!
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        //        let buttonname = sender.titleLabel?.text
        //
        //        switch buttonname {
        //        case "Prev":
        //            if currentItem > 0 {
        //                currentItem -= 1
        //                updateTrack()
        //                playSound()
        //            }else if currentItem == 0{
        //                currentItem = track.count - 1
        //                updateTrack()
        //                playSound()
        //            }
        //
        //        case "Play":
        //            if playing == true{
        //                player?.pause()
        //                playing = false
        //            }else{
        //                playSound()
        //                playing = true
        //            }
        //
        //        case "Next":
        //            if currentItem < track.count - 1 {
        //                currentItem += 1
        //                updateTrack()
        //                playSound()
        //            }else if currentItem == track.count - 1{
        //                currentItem = 0
        //                updateTrack()
        //                playSound()
        //            }
        //
        //        default:
        //            break
        //        }
        
        switch sender.tag {
        case 1:
            prevtrack()
        case 2:
            if playing == true {
                player?.pause()
                playing = false
                stopProgressTimer()
            }else if playing == false {
                playSound()
                playing = true
                startProgressTimer()
            }
        case 3:
            nexttrack()
        default:
            break
        }
    }
    

    @IBAction func progressSlider(_ sender: UISlider) {
        let time = Double(sender.value) * (player?.duration ?? 0)
        player?.currentTime = time
    }
    

    let track: [TrackItems] = [
        TrackItems(image: #imageLiteral(resourceName: "track1"), title: "Money Trees", soundname: "track1", artistname: "Kendrick Lamar"),
        TrackItems(image: #imageLiteral(resourceName: "track2"), title: "Les", soundname: "track2", artistname: "Childish Gambino"),
        TrackItems(image: #imageLiteral(resourceName: "track3"), title: "Collard Greens", soundname: "track3", artistname: "Schoolboy Q"),
        TrackItems(image: #imageLiteral(resourceName: "track4"), title: "LVL", soundname: "track4", artistname: "A$AP Rocky"),
        TrackItems(image: #imageLiteral(resourceName: "track5"), title: "Timeless", soundname: "track5", artistname: "TheWeeknd"),
        TrackItems(image: #imageLiteral(resourceName: "track6"), title: "Deboshir", soundname:"track6", artistname: "Ivan Dorn")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTrack()
    }
    
    func updateTrack(){
        Label.text = track[currentItem].title
        trackImage.image = track[currentItem].image
        ArtistName.text = track[currentItem].artistname
        
        progressSlider.value = 0
        playback.text = "0:00"
        totalduration.text = "0:00"
    }
    func playSound(){
        let soundname = track[currentItem].soundname
        let url = Bundle.main.url(forResource: soundname, withExtension: "mp3")
        player = try? AVAudioPlayer(contentsOf: url!)
        player?.delegate = self
        player?.play()
        
        if let duration = player?.duration {
        totalduration.text = formatTime(duration)
        }
    }
    func nexttrack(){
        currentItem = (currentItem + 1) % track.count
        updateTrack()
        if playing {
            playSound()
        }
    }
    func prevtrack(){
        currentItem = (currentItem - 1 + track.count) % track.count
        updateTrack()
        if playing {
            playSound()
        }
    }
    func startProgressTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
        [weak self] _ in
        self?.updateProgress()
            }
        }
    func stopProgressTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    func updateProgress() {
        guard let player = player
        else {
            return
        }
        let progress = Float(player.currentTime / player.duration)
        progressSlider.value = progress.isNaN ? 0 : progress
        updateTimeLabels()
        }
    func updateTimeLabels() {
        guard let player = player
        else {
            return
        }
        playback.text = formatTime(player.currentTime)
        }
}
extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        nexttrack()
        playSound()
    }
}
