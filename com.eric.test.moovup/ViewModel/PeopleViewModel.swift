import Foundation
import Alamofire


class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    @Published var requestState: RequestState = .idle
    
    func fetchPeople() {
        NSLog("fetchPeople")
        guard requestState != .loading else { return }
        
        requestState = .loading
        AF.request("\(APIManager.host)/templates/-xdNcNKYtTFG/data",
                   headers: APIManager.authHeaders)
        .responseDecodable(of: [Person].self) { [weak self] response in
            switch response.result {
            case .success(let people):
                self?.requestState = .success
                self?.people = people
            case .failure(let error):
                self?.requestState = .fail
                print(error.localizedDescription)
            }
        }
    }
    
    func findPersion(id: String) -> Person? {
        return people.first(where: { $0.id == id })
    }
}
