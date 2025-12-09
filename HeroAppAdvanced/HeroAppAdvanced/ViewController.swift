//
//  ViewController.swift
//  HeroAppAdvanced
//
//  Created by Abylai  on 09.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroFullName: UILabel!
    @IBOutlet private weak var heroRace: UILabel!
    @IBOutlet private weak var heroIntelligence: UILabel!
    @IBOutlet private weak var heroIntelligenceProgress: UIProgressView!
    @IBOutlet private weak var heroStrength: UILabel!
    @IBOutlet private weak var heroStrengthProgress: UIProgressView!
    @IBOutlet private weak var heroSpeed: UILabel!
    @IBOutlet private weak var heroSpeedProgress: UIProgressView!
    @IBOutlet private weak var heroDurability: UILabel!
    @IBOutlet private weak var heroDurabilityProgress: UIProgressView!
    @IBOutlet private weak var heroPower: UILabel!
    @IBOutlet private weak var heroPowerProgress: UIProgressView!
    @IBOutlet private weak var heroCombat: UILabel!
    @IBOutlet private weak var heroCombatProgress: UIProgressView!
    
    
    var heroService = HeroService()

    override func viewDidLoad() {
        super.viewDidLoad()
        heroService.delegate = self
    }
    
    @IBAction private func buttonDidTap() {
        heroService.fetchHero()
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(hero: HeroModel) {
        configure(hero: hero)
    }
    private func configure(hero: HeroModel) {
        heroImage.kf.setImage(with: URL(string: hero.images.md))
        
        heroName.text = hero.name
        heroFullName.text = hero.biography.fullName
        heroRace.text = hero.appearance.race
        
        let intelligence = hero.powerstats.intelligence
        heroIntelligence.text = "Intelligence: (\(intelligence))"
        heroIntelligenceProgress.setProgress(Float(intelligence) / 100, animated: true)
        updateProgressViewColor(heroIntelligenceProgress, value: hero.powerstats.intelligence)
        
        let strength = hero.powerstats.strength
        heroStrength.text = "Strength: (\(strength))"
        heroStrengthProgress.setProgress(Float(strength) / 100, animated: true)
        updateProgressViewColor(heroStrengthProgress, value: hero.powerstats.strength)
        
        let speed = hero.powerstats.speed
        heroSpeed.text = "Speed: (\(speed))"
        heroSpeedProgress.setProgress(Float(speed) / 100, animated: true)
        updateProgressViewColor(heroSpeedProgress, value: hero.powerstats.speed)
        
        let durability = hero.powerstats.durability
        heroDurability.text = "Durability: (\(durability))"
        updateProgressViewColor(heroDurabilityProgress, value: hero.powerstats.durability)

        let power = hero.powerstats.power
        heroPower.text = "Power: (\(power))"
        heroPowerProgress.setProgress(Float(power) / 100, animated: true)
        updateProgressViewColor(heroPowerProgress, value: hero.powerstats.power)
        
        let combat = hero.powerstats.combat
        heroCombat.text = "Combat: (\(combat))"
        heroCombatProgress.setProgress(Float(combat) / 100, animated: true)
        updateProgressViewColor(heroCombatProgress, value: hero.powerstats.combat)
    }
    private func updateProgressViewColor(_ progressView: UIProgressView, value: Int) {
        switch value {
        case 0...30:
            progressView.progressTintColor = .systemRed
        case 31...59:
            progressView.progressTintColor = .systemOrange
        case 60...79:
            progressView.progressTintColor = .systemYellow
        case 80...100:
            progressView.progressTintColor = .systemGreen
        default:
            progressView.progressTintColor = .systemBlue
        }
        
    
        UIView.animate(withDuration: 0.3) {
            progressView.layoutIfNeeded()
        }
    }
    private func storeLocally(model: HeroModel) {
            let heroData = try? PropertyListEncoder().encode(model)
            UserDefaults.standard.set(heroData, forKey: "heroData")
        }

        private func setupInitialHeroIfNeeded() {
            guard
                let heroData = UserDefaults.standard.data(forKey: "heroData"),
                let heroModel = try? PropertyListDecoder().decode(HeroModel.self, from: heroData)
            else {
                return
            }

            configure(hero: heroModel)
        }
}
