//
//  ViewController.swift
//  TableView app
//
//  Created by Abylai  on 20.11.2025.
//

import UIKit

struct FavItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}

enum FavSection: CaseIterable {
    case movies
    case music
    case books
    case courses
    
    var title: String {
        switch self {
        case .movies: return "Movies"
        case .music: return "Music"
        case .books: return "Books"
        case .courses: return "Courses"
        }
    }
    
    var items: [FavItem] {
        switch self {
        case .movies: return Movies.items
        case .music: return Music.items
        case .books: return Books.items
        case .courses: return Courses.items
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var sections: [FavSection] = FavSection.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEWLOADED")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = sections[indexPath.section].items[indexPath.row]
        print("Selected: \(selectedItem.title)")
        print("Review: \(selectedItem.review)")
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? FavCell else {
                    
                  
        let defaultCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let currentItem = sections[indexPath.section].items[indexPath.row]
        defaultCell.textLabel?.text = currentItem.title
        defaultCell.detailTextLabel?.text = currentItem.subtitle
        defaultCell.imageView?.image = currentItem.image
        return defaultCell
                }
        
        let currentItem = sections[indexPath.section].items[indexPath.row]

        cell.configure(with: currentItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    
}
