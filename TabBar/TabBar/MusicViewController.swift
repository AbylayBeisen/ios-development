//
//  MusicViewController.swift
//  TabBar
//
//  Created by Abylai  on 05.12.2025.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var MusictableView: UITableView!
    
    var favMusics: [FavItem] = [
            FavItem(
                title: "Money Trees",
                subtitle: "Kendrick Lamar • 2012",
                review: "5/5 absolutely legendary track.",
                image: .track1,
            ),
            FavItem(
                title: "Les",
                subtitle: "Childish Gambino • 2020",
                review: "5/5 one of my favorite songs.",
                image: .track2,
            ),
            FavItem(
                title: "Collard Greens",
                subtitle: "Schoolboy Q • 2013",
                review: "4.5/5 great track",
                image: .track3,
            ),
            FavItem(
                title: "LVL",
                subtitle: "A$AP Rocky • 2013",
                review: "3/5 did not like it",
                image: .track4,
            ),
            FavItem(
                title: "Timeless",
                subtitle: "The Weeknd • 2023",
                review: "4/5 one of the popular and best new songs.",
                image: .track5,
            )
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            MusictableView.dataSource = self
            MusictableView.delegate = self
           
        }
      
    }

    extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return favMusics.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavouriteTableViewCell
            let currentItem = favMusics[indexPath.row]
            cell.configure(favObject: currentItem)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let dvc = storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
            dvc.favObject = favMusics[indexPath.row]
            navigationController?.pushViewController(dvc, animated: true)
        }
    
}
