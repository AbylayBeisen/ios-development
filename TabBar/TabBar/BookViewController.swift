//
//  BookViewController.swift
//  TabBar
//
//  Created by Abylai  on 06.12.2025.
//

import UIKit

class BookViewController: UIViewController {
    
    @IBOutlet weak var BooktableView: UITableView!
    
        var favBooks: [FavItem] = [
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
        
        override func viewDidLoad() {
            super.viewDidLoad()
            BooktableView.dataSource = self
            BooktableView.delegate = self
        }
    }
    
    extension BookViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favBooks.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouriteTableViewCell
            let currentItem = favBooks[indexPath.row]
            cell.configure(favObject: currentItem)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let dvc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            dvc.favObject = favBooks[indexPath.row]
            navigationController?.pushViewController(dvc, animated: true)
        }
    }
