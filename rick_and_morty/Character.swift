//
//  Photo.swift
//  Photorama
//
//  Created by Ethan Tanner on 11/1/21.
//

import UIKit

class Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image_url: URL?
    //let location: String?
    var characterImage: UIImage?
    
    enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case status = "status"
            case species = "species"
            case gender = "gender"
            
            //case characterImage = "image"
            case image_url = "image"
      //      case location = "location"
    }
}
/*
 "location": {
         "name": "Citadel of Ricks",
 */
extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        // Two Photos are the same if they have the same photoID
        return lhs.id == rhs.id
    }
}
