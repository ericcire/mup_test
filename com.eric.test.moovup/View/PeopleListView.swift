import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PeopleListView: View {
    @ObservedObject var viewModel: PeopleViewModel
    
    var body: some View {
        switch viewModel.requestState {
        case .loading:
            Text("Loading...").font(.largeTitle)
            Spacer()
        case .fail:
            Text("Load Data Fail").font(.largeTitle)
            Spacer()
        default:
            if viewModel.people.isEmpty {
                Text("No Content").font(.largeTitle)
                Spacer()
            } else {
                List(viewModel.people) { person in
                    NavigationLink {
                        PersonDetailView(person: person)
                    } label: {
                        PersonItemView(person: person).accessibilityIdentifier(person.name.fullName())
                    }
                }
            }
        }
    }
}

#Preview {
    PeopleListView(viewModel: PeopleViewModel())
}

