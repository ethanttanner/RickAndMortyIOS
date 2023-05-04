import Foundation

struct RANDM_Response: Codable {
    let characters: [Character]

    enum CodingKeys: String, CodingKey {
        case characters = "results"
        }
}
    /*
struct FlickrPhotosResponse: Codable {
    let photos: [Photo]

    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}

enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
}
     */

struct RANDM_API {

    private static let baseURLString = "https://rickandmortyapi.com/api/character"
    
    private static func RANDM_URL(parameters: [String:String]?) -> URL {
        
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()

        let baseParams = [
            "method": "GET",
            "format": "json",
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        if let additionalParams = parameters {
        for (key, value) in additionalParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!

    }
    
            
    static var RANDMURL: URL {
        return RANDM_URL(parameters: [:])
    }
    static func Characters(fromJSON data: Data) -> Result<[Character], Error> {
        do {
            let decoder = JSONDecoder()
            
            let RANDM_Response = try decoder.decode(RANDM_Response.self, from: data)
            
            return .success(RANDM_Response.characters)
            } catch {
                return .failure(error)
            }
        }
}
