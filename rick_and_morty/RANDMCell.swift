//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Ethan Tanner on 11/1/21.
//
import UIKit

class RANDMCell: UITableViewCell {

    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet weak var imagee: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var species_status: UILabel!
    
    /*
     outlets to add
     
    cell.name?.text = item.name
    cell.status?.text = item.status
    cell.species?.text = "$\(item.species)"
    cell.gender?.text
     */
    
    
    func update(displaying image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imagee.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imagee.image = nil
        }
    }
}
