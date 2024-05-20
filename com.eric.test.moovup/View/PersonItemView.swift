import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct PersonItemView: View {
    let person: Person
    var showEmail = false
    
    var body: some View {
        HStack() {
            WebImage(url: URL(string: person.picture)) { image in
                image.image?.resizable()
            }
            .transition(.fade(duration: 0.5))
            .scaledToFill()
            .frame(width: 64, height: 64, alignment: .center)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 1)
            }
            .shadow(radius: 4)
            
            VStack(alignment: .leading) {
                Text(person.name.fullName())
                    .font(.caption)
                    .padding(.leading, 16)
                if showEmail {
                    Text(person.email)
                        .font(.caption)
                        .padding(.leading, 16)
                }
            }
            Spacer()
        }
        .padding(8)
        .background(Color.white)
        .border(.black, width: 1)
    }
}

#Preview {
    PersonItemView(person: Person.mockPerson()!)
}

