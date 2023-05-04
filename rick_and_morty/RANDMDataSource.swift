//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by Ethan Tanner on 11/1/21.
//

import UIKit

class RANDMDataSource: NSObject, UITableViewDataSource {
    var characters = [Character]()

    /*override*/func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    /*override*/ func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RANDMCell", for: indexPath) as! RANDMCell

       
        let item = characters[indexPath.row]
        
        cell.name?.text = item.name
        cell.species_status?.text = item.species + "/" + item.status
        //print("$\(item.species)" + "$\(item.status)")
        
        /*
        if cell.character.status == "dead" {
            self.name.textColor = .red
        }
         */
        
        /*
         
         @IBOutlet var spinner: UIActivityIndicatorView!
         @IBOutlet weak var imagee: UIImageView!
         @IBOutlet weak var name: UILabel!
         @IBOutlet weak var location_species: UILabel!
         
         
         "id": 2,
                     "name": "Morty Smith",
                     "status": "Alive",
                     "species": "Human",
                     "type": "",
                     "gender": "Male",
         
        "location": {
                        "name": "Citadel of Ricks",*/
        cell.update(displaying: nil)

        return cell
    }
    


}

