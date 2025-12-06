//
//  Movies .swift
//  TableView app
//
//  Created by Abylai  on 20.11.2025.
//
import Foundation

    struct Movies {
        static let items: [FavItem] = [
            FavItem(
                title: "Iron Man",
                subtitle: "Dir. Jon Favreau • 2008",
                review: "The film that launched the Marvel Cinematic Universe. Robert Downey Jr.'s charismatic performance as Tony Stark is pitch-perfect, blending humor, arrogance, and vulnerability in a way that defined the character for a generation.",
                image: .ironMan
            ),
            FavItem(
                title: "Attack on Titan: Chronicles",
                subtitle: "Dir. Shinji Higuchi • 2015",
                review: "A live-action adaptation that captures the epic scale and horror of the original anime. The visual representation of the Titans is terrifyingly impressive, and the film does justice to the intense action and emotional stakes of humanity's struggle for survival.",
                image: .attack
            ),
            FavItem(
                title: "Fight Club",
                subtitle: "Dir. David Fincher • 1999",
                review: "A brutal and brilliant critique of consumer culture and modern masculinity. The twist ending remains one of cinema's most shocking revelations, and the film's philosophical undertones continue to provoke discussion decades later.",
                image: .fightClub
            ),
            FavItem(
                title: "Interstellar",
                subtitle: "Dir. Christopher Nolan • 2014",
                review: "Epic in scope and emotion. The combination of hard science fiction and deeply personal father-daughter story creates something truly special. The depiction of black holes and space travel is scientifically grounded yet visually breathtaking.",
                image: .interstellar
            ),
            FavItem(
                title: "Avengers: Endgame",
                subtitle: "Dir. Anthony & Joe Russo • 2019",
                review: "The epic conclusion to 11 years of storytelling in the MCU. A perfect blend of emotional character moments and spectacular action. The final battle is cinematic history, and the sendoffs for original Avengers are both satisfying and heartbreaking.",
                image: .avengers
            )
        ]
    }
