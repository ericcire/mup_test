import Foundation
import Alamofire

class APIManager {
    static let host = "https://api.json-generator.com"
    static let authHeaders: HTTPHeaders = [.authorization(bearerToken: "b2atclr0nk1po45amg305meheqf4xrjt9a1bo410")]
}

enum RequestState {
    case idle
    case loading
    case success
    case fail
}

