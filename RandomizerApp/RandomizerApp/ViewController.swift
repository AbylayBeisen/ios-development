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
    @IBOutlet weak var detailArrowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showRandomArtist()
        
    }
    
    private var currentArtist: (image: UIImage, blurredImage: UIImage, name: String, color: UIColor)?
    
    private let ArtistsArray: [(image: UIImage,blurredImage: UIImage, name: String, color: UIColor)] = [
            (#imageLiteral(resourceName: "TheWeeknd"),#imageLiteral(resourceName: "TheWeekndBlurred") ,"The Weeknd", .systemRed),
            (#imageLiteral(resourceName: "Asap Rocky"),#imageLiteral(resourceName: "Asap RockyBlurred") ,"Asap Rocky", .black),
            (#imageLiteral(resourceName: "Kendrick Lamar"),#imageLiteral(resourceName: "Kendrick LamarBlurred") ,"Kendrick Lamar", .black),
            (#imageLiteral(resourceName: "Eminem"),#imageLiteral(resourceName: "EminemBlurred") ,"Eminem", .systemYellow),
            (#imageLiteral(resourceName: "Billie Eilish"),#imageLiteral(resourceName: "Billie EilishBlurred") ,"Billie Eilish", .systemBlue),
            (#imageLiteral(resourceName: "Joji"),#imageLiteral(resourceName: "JojiBlurred"), "Joji", .systemRed),
            (#imageLiteral(resourceName: "SZA"),#imageLiteral(resourceName: "SZABlurred") ,"SZA", .systemTeal),
            (#imageLiteral(resourceName: "Travis Scott"),#imageLiteral(resourceName: "Travis ScottBlurred") ,"Travis Scott", .systemIndigo),
            (#imageLiteral(resourceName: "MacMiller"),#imageLiteral(resourceName: "MacMillerBlurred") ,"Mac Miller", .systemBrown),
            (#imageLiteral(resourceName: "Frank Ocean"),#imageLiteral(resourceName: "Frank OceanBlurred") ,"Frank Ocean", .systemMint)
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
            detailArrowButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
            detailArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            detailArrowButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            detailArrowButton.widthAnchor.constraint(equalToConstant: 50),
            detailArrowButton.heightAnchor.constraint(equalToConstant: 50)
                ])
            detailArrowButton.setTitle("→", for: .normal)
            detailArrowButton.setTitleColor(.white, for: .normal)
            detailArrowButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
            detailArrowButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            detailArrowButton.layer.cornerRadius = 25
            detailArrowButton.layer.borderWidth = 1
            detailArrowButton.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        
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
    
    
    
    @IBAction func detailArrowButtonTapped(_ sender: Any) {
        showArtistDetail()
    }
    
    private func showRandomArtist() {
            let randomArtist = ArtistsArray.randomElement()!
            currentArtist = randomArtist
            
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
    
    private func showArtistDetail() {
           guard let currentArtist = currentArtist else { return }
           
           let detailVC = DetailViewController()
           detailVC.artist = currentArtist
           detailVC.modalPresentationStyle = .fullScreen
           
           
           let transition = CATransition()
           transition.duration = 0.5
           transition.type = .push
           transition.subtype = .fromRight
           view.window?.layer.add(transition, forKey: kCATransition)
           
           present(detailVC, animated: false)
       }
    
}

