//
//  DetailViewController.swift
//  RandomizerApp
//
//  Created by Abylai  on 23.10.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let backgroundImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let backButton = UIButton(type: .system)
    
    var artist: (image: UIImage, blurredImage: UIImage, name: String, color: UIColor)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        setupBackgroundImageView()
        setupBackButton()
        setupDescriptionLabel()
        setupDescriptionTextView()
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        addGradientOverlay()
    }
    
    private func setupBackButton() {
        backButton.setTitle("←", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        backButton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backButton.layer.cornerRadius = 25
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.white.withAlphaComponent(0.3).cgColor
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 50),
            backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = "Description"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 28, weight: .bold)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.layer.shadowColor = UIColor.black.cgColor
        descriptionLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        descriptionLabel.layer.shadowRadius = 4
        descriptionLabel.layer.shadowOpacity = 0.8
        
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDescriptionTextView() {
        descriptionTextView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        descriptionTextView.textColor = .white
        descriptionTextView.font = .systemFont(ofSize: 18, weight: .regular)
        descriptionTextView.isEditable = false
        descriptionTextView.isScrollEnabled = true
        descriptionTextView.textAlignment = .center
        descriptionTextView.layer.cornerRadius = 12
        descriptionTextView.clipsToBounds = true
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func addGradientOverlay() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.4).cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor
        ]
        gradientLayer.locations = [0.0, 0.4, 1.0]
        backgroundImageView.layer.addSublayer(gradientLayer)
    }
    
    private func updateUI() {
        guard let artist = artist else { return }
        
        backgroundImageView.image = artist.blurredImage
        descriptionTextView.text = getDescription(for: artist.name)
        descriptionLabel.textColor = artist.color
    }
    
    @objc private func backButtonTapped() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = .push
        transition.subtype = .fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
    
    private func getDescription(for artistName: String) -> String {
        switch artistName {
        case "The Weeknd":
            return "The Weeknd is a Canadian singer, songwriter, and producer. Real name - Abel Tesfaye. Known for hits like 'Blinding Lights', 'Starboy', 'The Hills'. Winner of 4 Grammy Awards."
        case "Asap Rocky":
            return "A$AP Rocky is an American rapper, singer, and producer. Real name - Rakim Mayers. Leader of hip-hop collective A$AP Mob. Known for tracks 'Praise The Lord', 'F**kin Problems'."
        case "Kendrick Lamar":
            return "Kendrick Lamar is an American rapper and songwriter. Considered one of the most influential artists of his generation. Pulitzer Prize winner for album 'DAMN'."
        case "Eminem":
            return "Eminem is an American rapper, producer, and composer. Real name - Marshall Bruce Mathers III. One of the best-selling artists in the world. Known for technical rhymes."
        case "Billie Eilish":
            return "Billie Eilish is an American singer and songwriter. Became famous at a young age thanks to her unique style. Multiple Grammy winner. Known for hit 'Bad Guy'."
        case "Joji":
            return "Joji is a Japanese singer, songwriter, and former YouTuber. Real name - George Kusunoki Miller. Known for melancholic R&B and lo-fi music. Hits: 'Slow Dancing in the Dark', 'Glimpse of Us'."
        case "SZA":
            return "SZA is an American singer and songwriter. Real name - Solána Imani Rowe. One of the most successful contemporary R&B artists. Known for album 'Ctrl'."
        case "Travis Scott":
            return "Travis Scott is an American rapper, singer, and producer. Real name - Jacques Webster. Known for his auto-tune and atmospheric beats. Creator of Astroworld festival."
        case "Mac Miller":
            return "Mac Miller was an American rapper, singer, and producer. Real name - Malcolm McCormick. Known for his musical evolution from funk to deep lyrical tracks."
        case "Frank Ocean":
            return "Frank Ocean is an American singer, songwriter, and producer. Known for his innovative R&B works and lyrics. Album 'Blonde' is considered a modern classic."
        default:
            return "A talented artist with a unique style and influence on modern music."
        }
    }
}
