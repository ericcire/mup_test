import SwiftUI
import MapKit

struct PeopleMapView: View {
    @ObservedObject var viewModel: PeopleViewModel
    @State private var selectedTag: String?
    
    var body: some View {
        Map(selection: $selectedTag) {
            ForEach(viewModel.people) { person in
                if person.location.isValid() {
                    let showTitle = selectedTag == person.id ? Visibility.visible : .hidden
                    let shortName = person.name.nameInitials()
                    Marker(person.name.fullName(),
                           monogram: Text(shortName),
                           coordinate: person.location.geoLocation())
                    .tag(person.id)
                    .annotationTitles(showTitle)
                }
            }
        }
        .onAppear(perform: {
            if viewModel.people.isEmpty {
                viewModel.fetchPeople()
            }
        })
    }
}

#Preview {
    PeopleMapView(viewModel: PeopleViewModel())
}

