//
//  ViewController.swift
//  HeroRandomizer
//
//  Created by Abylai  on 04.12.2025.
//


import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var heroPlaceOfBirth: UILabel!
    @IBOutlet weak var heroIntelligence: UILabel!
    @IBOutlet weak var heroStrength: UILabel!
    @IBOutlet weak var heroSpeed: UILabel!
    @IBOutlet weak var heroDurability: UILabel!
    @IBOutlet weak var heroPower: UILabel!
    @IBOutlet weak var heroCombat: UILabel!
    @IBOutlet weak var heroIntelligenceProgress: UIProgressView!
    @IBOutlet weak var heroStrenghtProgress: UIProgressView!
    @IBOutlet weak var heroSpeedProgress: UIProgressView!
    @IBOutlet weak var heroDurabilityProgress: UIProgressView!
    @IBOutlet weak var heroPowerProgress: UIProgressView!
    @IBOutlet weak var heroCombatProgress: UIProgressView!
    
    var service = HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        Task { @MainActor in
            guard let model = try? await service.fetchHero() else { return }
            
            heroName.text = model.name
            
            heroImage.kf.setImage(with: URL(string: model.images.md))
            
            heroFullName.text = "Full Name: \(model.biography.fullName)"
            heroPlaceOfBirth.text = "Place of Birth: \(model.biography.placeOfBirth)"
            
            heroIntelligence.text = "Intelligence: \(model.powerstats.intelligence)"
            heroIntelligenceProgress.setProgress(Float(model.powerstats.intelligence) / 100, animated: true)
            updateProgressViewColor(heroIntelligenceProgress, value: model.powerstats.intelligence)
            
            heroStrength.text = "Strength: \(model.powerstats.strength)"
            heroStrenghtProgress.setProgress(Float(model.powerstats.strength) / 100, animated: true)
            updateProgressViewColor(heroStrenghtProgress, value: model.powerstats.strength)
            
            heroSpeed.text = "Speed: \(model.powerstats.speed)"
            heroSpeedProgress.setProgress(Float(model.powerstats.speed) / 100, animated: true)
            updateProgressViewColor(heroSpeedProgress, value: model.powerstats.speed)
            
            heroDurability.text = "Durability: \(model.powerstats.durability)"
            heroDurabilityProgress.setProgress(Float(model.powerstats.durability) / 100, animated: true)
            updateProgressViewColor(heroDurabilityProgress, value: model.powerstats.durability)
            
            heroPower.text = "Power: \(model.powerstats.power)"
            heroPowerProgress.setProgress(Float(model.powerstats.power) / 100, animated: true)
            updateProgressViewColor(heroPowerProgress, value: model.powerstats.power)
            
            heroCombat.text = "Combat: \(model.powerstats.combat)"
            heroCombatProgress.setProgress(Float(model.powerstats.combat) / 100, animated: true)
            updateProgressViewColor(heroCombatProgress, value: model.powerstats.combat)
        }

    }
    private func updateProgressViewColor(_ progressView: UIProgressView, value: Int) {
        switch value {
        case 0...30:
            progressView.progressTintColor = .systemRed
        case 31...60:
            progressView.progressTintColor = .systemOrange
        case 60...80:
            progressView.progressTintColor = .systemYellow
        case 81...100:
            progressView.progressTintColor = .systemGreen
        default:
            progressView.progressTintColor = .systemBlue
        }
        
    
        UIView.animate(withDuration: 0.3) {
            progressView.layoutIfNeeded()
        }
    }
}

