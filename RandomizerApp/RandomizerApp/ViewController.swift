//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Abylai  on 22.10.2025.
//

import UIKit

struct Artist{
    let name: String
    let image: String
    
}

class ViewController: UIViewController {

    @IBOutlet weak var ArtistName: UILabel!
    @IBOutlet weak var ArtistPhoto: UIImageView!
    @IBOutlet weak var ShuffleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showRandomArtist()
        
    }
    private let ArtistsArray: [(image: UIImage, name: String, color: UIColor)] = [
            (#imageLiteral(resourceName: "TheWeeknd"), "The Weeknd", .systemRed),
            (#imageLiteral(resourceName: "Asap Rocky"), "Asap Rocky", .black),
            (#imageLiteral(resourceName: "Kendrick Lamar"), "Kendrick Lamar", .black),
            (#imageLiteral(resourceName: "Eminem"), "Eminem", .systemYellow),
            (#imageLiteral(resourceName: "Billie Eilish"), "Billie Eilish", .systemBlue),
            (#imageLiteral(resourceName: "Joji"), "Joji", .systemRed),
            (#imageLiteral(resourceName: "SZA"), "SZA", .systemTeal),
            (#imageLiteral(resourceName: "Travis Scott"), "Travis Scott", .systemIndigo),
            (#imageLiteral(resourceName: "MacMiller"), "Mac Miller", .systemBrown),
            (#imageLiteral(resourceName: "Frank Ocean"), "Frank Ocean", .systemMint)
        ]

    
    
    private func setupUI(){
            ArtistPhoto.contentMode = .scaleAspectFill
            ArtistPhoto.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
            ArtistPhoto.topAnchor.constraint(equalTo: view.topAnchor),
            ArtistPhoto.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ArtistPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ArtistPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
            ArtistName.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
            ArtistName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            ArtistName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ArtistName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
                ])
            
            ShuffleButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
            ShuffleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            ShuffleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            ShuffleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            ShuffleButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
            ArtistName.layer.shadowColor = UIColor.black.cgColor
            ArtistName.layer.shadowRadius = 3
            ArtistName.layer.shadowOpacity = 0.8
            ArtistName.layer.shadowOffset = CGSize(width: 1, height: 1)
        }
    
    @IBAction func ShuffleButton(_ sender: Any) {
        UIView.animate(withDuration: 0.1, animations: {
                   self.ShuffleButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
               }) { _ in
                   UIView.animate(withDuration: 0.1) {
                       self.ShuffleButton.transform = CGAffineTransform.identity
                   }
               }
               showRandomArtist()
    }
    private func showRandomArtist() {
            let randomArtist = ArtistsArray.randomElement()!
            
            UIView.transition(with: ArtistPhoto,
                            duration: 0.5,
                            options: .transitionCrossDissolve,
                            animations: {
                                self.ArtistPhoto.image = randomArtist.image
                            },
                            completion: nil)
            
            
            ArtistName.text = randomArtist.name
            ArtistName.textColor = randomArtist.color
        }
    
}

