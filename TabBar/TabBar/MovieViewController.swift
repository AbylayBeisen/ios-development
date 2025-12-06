//
//  MovieViewController.swift
//  TabBar
//
//  Created by Abylai  on 06.12.2025.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var MovietableView: UITableView!
    
    var favMovies:[FavItem]=[
        FavItem(
            title: "Iron Man",
            subtitle: "Dir. Jon Favreau • 2008",
            review: "5/5 the beginning of the greatest cinematic universe.",
            image: .ironman
        ),
        FavItem(
            title: "Attack on Titan",
            subtitle: "Dir. Shinji Higuchi • 2015",
            review: "4.5/5 Every time watching it you  realize how much more there is to this story.",
            image: .attack
        ),
        FavItem(
            title: "Fight Club",
            subtitle: "Dir. David Fincher • 1999",
            review: "4/5 First rule of the club is you do not talk about it.",
            image: .fightclub
        ),
        FavItem(
            title: "Interstellar",
            subtitle: "Dir. Christopher Nolan • 2014",
            review: "5/5 Absolute Cinema.",
            image: .interstellar
        ),
        FavItem(
            title: "Avengers: Endgame",
            subtitle: "Dir. Anthony & Joe Russo • 2019",
            review: "5/5 absolute cinema.",
            image: .avengers
        )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        MovietableView.dataSource=self
        MovietableView.delegate=self
       
    }
  

}
extension MovieViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath) as! FavouriteTableViewCell
        let currentItem=favMovies[indexPath.row]
        cell.configure(favObject: currentItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc=storyboard?.instantiateViewController(identifier:"DetailViewController" ) as! DetailViewController
        dvc.favObject = favMovies[indexPath.row]
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}
