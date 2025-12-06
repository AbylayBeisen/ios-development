//
//  CourseViewController.swift
//  TabBar
//
//  Created by Abylai  on 06.12.2025.
//

import UIKit

class CourseViewController: UIViewController {

    
    @IBOutlet weak var CoursetableView: UITableView!
    
    var favCourses:[FavItem]=[
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
            image: .course5
        )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        CoursetableView.dataSource=self
        CoursetableView.delegate=self
       
    }
  

}
extension CourseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouriteTableViewCell
        let currentItem = favCourses[indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        dvc.favObject = favCourses[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
