import Foundation
import MapKit

/**
 {
 "_id": "ae736d8f-5a08-4bab-8e30-1eb2079e5dc2",
 "name": {
 "last": "Bass",
 "first": "Bradley"
 },
 "email": "aida.griffith@sybixtex.show",
 "picture": "https://placebear.com/225/210",
 "location": {
 "latitude": 22.38,
 "longitude": null
 }
 },
 */

struct Person: Codable, Identifiable {
    let id: String
    let name: Name
    let email: String
    let picture: String
    let location: Location
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case email
        case picture
        case location
    }
}

extension Person {
    static func mockPerson() -> Person? {
        let jsonResponse = """
{
        "_id": "ae61bba4-4110-45a7-84c5-ab1c08a86a1d",
        "name": {
            "last": "Calhoun",
            "first": "Amparo"
        },
        "email": "sue.patterson@exoteric.press",
        "picture": "https://placebear.com/60/121",
        "location": {
            "latitude": 22.37,
            "longitude": 113.34
        }
}
""".data(using: .utf8)
        // Decode the JSON response into a Swift struct
        return try? JSONDecoder().decode(Person.self, from: jsonResponse!)
    }
}

struct Name: Codable {
    let first: String
    let last: String
    
    func fullName() -> String {
        return "\(first) \(last)"
    }
    
    func nameInitials() -> String {
        return "\(first[first.startIndex])\(last[last.startIndex])"
    }
}

struct Location: Codable {
    let latitude: Double?
    let longitude: Double?
    
    func isValid() -> Bool {
        return latitude != nil && longitude != nil
    }
    
    func geoLocation() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
    }
}


