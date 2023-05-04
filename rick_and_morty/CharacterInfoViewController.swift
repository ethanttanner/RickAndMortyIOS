//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Ethan Tanner on 11/1/21.
//

import UIKit

class CharacterInfoViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var charInfo: UILabel!

    /*
     Outlets
     */
    
    var character: Character! {
            didSet {
                navigationItem.title = character.name
            }
        }
    var store: RANDMStore!
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if character.characterImage == nil {
            store.fetchImage(for: character) { (result) -> Void in
                switch result {
                case let .success(image):
                    self.photo.image = image
                case let .failure(error):
                    print("Error fetching image: \(error)")
                }
            }
        } else {
            photo.image = character.characterImage
        }
        
        name.text = character.name
        charInfo.text = character.gender + "/" + character.species + "/" + character.status
        //print(character.location)
    }

    }

    
    
    /*
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Clear first responder
            view.endEditing(true)

        // "Save" changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text

        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }
     
     */
    /*
     override func viewDidLoad() {
        super.viewDidLoad()

        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
     */

