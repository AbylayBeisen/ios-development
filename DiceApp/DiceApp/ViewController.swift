//
//  ViewController.swift
//  DiceApp
//
//  Created by Abylai  on 22.10.2025.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet weak var thirdDice: UIImageView!

    @IBOutlet weak var lhsDice: UIImageView!
    @IBOutlet weak var rolButton: UIButton!
    @IBOutlet weak var rhsDice: UIImageView!

    
    let diceArray: [UIImage] = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    
        override func viewDidLoad() {
            super.viewDidLoad()

            lhsDice.image = diceArray[0]
            rhsDice.image = diceArray[0]
            thirdDice.image = diceArray[0]
            }
        
    @IBAction func rolButton(_ sender: UIButton) {
        lhsDice.image = diceArray.randomElement()
        rhsDice.image = diceArray.randomElement()
        thirdDice.image = diceArray.randomElement()
    }
    
}
