//
//  HeroService.swift
//  HeroAppAdvanced
//
//  Created by Abylai  on 09.12.2025.
//

import Foundation
import Alamofire

nonisolated
struct HeroModel: Codable {
    let id: Int
    
    let images: HeroImage
    struct HeroImage: Codable {
        let md: String
    }
    
    let name: String
    
    let biography: HeroBiography
    struct HeroBiography: Codable {
        let fullName: String
    }
    
    let appearance: HeroAppearance
    struct HeroAppearance: Codable {
        let race: String
    }
    
    let powerstats: HeroStats
    struct HeroStats: Codable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
}

protocol HeroServiceDelegate {
    func onHeroDidUpdate(hero: HeroModel)
}

struct HeroService {

    var delegate: HeroServiceDelegate?

    func fetchHero() {
        let randomId = Int.random(in: 1...564)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        AF.request(urlString).responseDecodable(of: HeroModel.self) { response in
            switch response.result {
            case .success(let hero):
                delegate?.onHeroDidUpdate(hero: hero)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
