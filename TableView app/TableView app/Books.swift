//
//  Books.swift
//  TableView app
//
//  Created by Abylai  on 20.11.2025.
//

import UIKit

struct Books {
    static let items: [FavItem] = [
        FavItem(
            title: "1984",
            subtitle: "George Orwell • 1949",
            review: "Chilling prophecy about surveillance and thought control.",
            image: .book1
        ),
        FavItem(
            title: "The Phantom of the Opera",
            subtitle: "Gaston Leroux • 1910",
            review: "A haunting tale of love and obsession in the Paris Opera House.",
            image: .book2
        ),
        FavItem(
            title: "The Headless Horseman",
            subtitle: "Mayne Reid • 1865",
            review: "A Western adventure mystery set in Texas.",
            image: .book3
        ),
        FavItem(
            title: "The Master and Margarita",
            subtitle: "Mikhail Bulgakov • 1967",
            review: "A satirical novel blending fantasy, philosophy, and political critique.",
            image: .book4
        ),
        FavItem(
            title: "The Hobbit",
            subtitle: "J.R.R. Tolkien • 1937",
            review: "Perfect adventure story that sparks love of fantasy.",
            image: .book5
        )
    ]
}
