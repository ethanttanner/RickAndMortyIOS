//
//  ImageStore.swift
//  Photorama
//
//  Created by Ethan Tanner on 11/1/21.
//

import UIKit

enum PhotoError: Error {
    case imageCreationError
    case missingImageURL
}

class RANDMStore {
    var allItems = [Character]()
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
        }()
    
    
    func fetchCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {

        let url = RANDM_API.RANDMURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in

        let result = self.processCharacters(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processCharacters(data: Data?,  error: Error?) -> Result<[Character], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return RANDM_API.Characters(fromJSON: jsonData)
   }
    
    
    
    
    func fetchImage(for character: Character, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        guard let imageURL = character.image_url else {
            completion(.failure(PhotoError.missingImageURL))
            print("YEs")
            return
        }
        print(imageURL)
        
        let request = URLRequest(url: imageURL)

        let task = session.dataTask(with: request) {
            (data, response, error) in
            
        let result = self.processImageRequest(data: data, error: error)

        OperationQueue.main.addOperation {
            completion(result)
            }
        }
        task.resume()
    }
    

    
    
    
    
    private func processImageRequest(data: Data?, error: Error?) -> Result<UIImage, Error> {
        guard let imageData = data, let image = UIImage(data: imageData) else {

                // Couldn't create an image
                if data == nil {
                    print("data == nil")
                    return .failure(error!)
                    
                } else {
                    print("failure")
                    return .failure(PhotoError.imageCreationError)
                }
              }
        return .success(image)
    }
}


