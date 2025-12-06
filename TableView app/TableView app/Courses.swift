//
//  Courses.swift
//  TableView app
//
//  Created by Abylai  on 20.11.2025.
//

import UIKit

struct Courses{
    static let items: [FavItem] = [
        FavItem(
            title: "Data Structures & Algorithms",
            subtitle: "CS 201 • Fall 2023",
            review: "Fundamentally changed how I approach problem-solving.",
            image: .course1
        ),
        FavItem(
            title: "Mobile Application Development",
            subtitle: "CS 458 • Spring 2024",
            review: "Building real apps for iOS and Android with practical skills.",
            image: .course2
        ),
        FavItem(
            title: "Artificial Intelligence",
            subtitle: "CS 380 • Fall 2023",
            review: "Exploring machine learning, neural networks, and AI ethics.",
            image: .course3
        ),
        FavItem(
            title: "Database and data structures",
            subtitle: "CS 347 • Spring 2023",
            review: "Understanding how data is structured, stored, and queried.",
            image: .course4
        ),
        FavItem(
            title: "Software Engineering",
            subtitle: "CS 319 • Fall 2022",
            review: "Learning full development lifecycle and team collaboration.",
            image: UIImage(systemName: "hammer")!
        )
    ]
}
