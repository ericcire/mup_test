import SwiftUI
import MapKit

struct PersonDetailView: View {
    let person: Person
    
    @State private var showingAlert = false
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position){
            if person.location.isValid() {
                Marker(person.name.fullName(), coordinate: person.location.geoLocation())
            }
        }.safeAreaInset(edge: .bottom, content: {
            PersonItemView(person: person, showEmail: true)
        })
        .onAppear {
            showingAlert = !person.location.isValid()
            position = .item(MKMapItem(placemark: .init(coordinate: person.location.geoLocation())))
        }
        .alert("Invalid Location", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    return PersonDetailView(person: Person.mockPerson()!)
}

