//
//  ViewController.swift
//  Photorama
//
//  Created by Ethan Tanner on 11/1/21.
//

import UIKit

class CharacterTableViewController: UITableViewController {

    var store: RANDMStore!
    let dataSource = RANDMDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
        store.fetchCharacters {
            (characterResult) in

            switch characterResult {
            case let .success(characters):
                print("Successfully found \(characters.count) characters..")
                self.dataSource.characters = characters
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.dataSource.characters.removeAll()
                }
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let photo = dataSource.characters[indexPath.row]

        store.fetchImage(for: photo) { (result) -> Void in

            guard let index = self.dataSource.characters.firstIndex(of: photo),
                  case let .success(image) = result
            else {
                return
            }
            let indexPath = IndexPath(item: index, section: 0)

            // When the request finishes, find the current cell for this photo
            if let cell = self.tableView.cellForRow(at: indexPath) as? RANDMCell {
                cell.update(displaying: image)
                    }
                }
            }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showInfo":
            if let row = tableView.indexPathForSelectedRow?.row {
            
            // Get the item associated with this row and pass it along
            let item = dataSource.characters[row]
            let detailViewController
                    = segue.destination as! CharacterInfoViewController
            detailViewController.character = item
            detailViewController.store = store
        }
    default:
        preconditionFailure("Unexpected segue identifier.")
    }
    }
}
