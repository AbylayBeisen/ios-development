//
//  Music.swift
//  TableView app
//
//  Created by Abylai  on 20.11.2025.
//

import Foundation

struct Music {
    static let items: [FavItem] = [
        FavItem(
            title: "Money Trees",
            subtitle: "Kendrick Lamar • 2012",
            review: "A masterpiece from 'good kid, m.A.A.d city' with one of the most iconic beats in hip-hop. Kendrick's storytelling about economic struggles and Jay Rock's explosive verse create pure magic.",
            image: .track1
        ),
        FavItem(
            title: "Les",
            subtitle: "Childish Gambino • 2020",
            review: "A hauntingly beautiful track from '3.15.20' that blends electronic elements with raw emotion. Gambino's vulnerable lyrics about love and loss create an intimate, atmospheric experience.",
            image: .track2
        ),
        FavItem(
            title: "Collard Greens",
            subtitle: "Schoolboy Q • 2013",
            review: "An instant classic from 'Oxymoron' with an infectious beat that makes you want to move. The chemistry between Schoolboy Q and Kendrick Lamar is undeniable, creating pure West Coast energy.",
            image: .track3
        ),
        FavItem(
            title: "LVL",
            subtitle: "A$AP Rocky • 2013",
            review: "A hypnotic, atmospheric track from 'LONG.LIVE.A$AP' that showcases Rocky's unique style. The Clams Casino production creates a dreamy soundscape that perfectly complements the laid-back flow.",
            image: .track4
        ),
        FavItem(
            title: "Timeless",
            subtitle: "The Weeknd • 2023",
            review: "A standout from 'The Highlights' that embodies The Weeknd's signature blend of dark R&B and pop sensibilities. The emotional depth and polished production make it feel truly eternal.",
            image: .track5
        )
    ]
}
