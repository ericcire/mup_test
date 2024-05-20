import SwiftUI

enum ViewMode {
    case list
    case map
}

struct ContentView: View {
    @ObservedObject var viewModel = PeopleViewModel()
    @State var viewMode = ViewMode.list
    
    var body: some View {
        NavigationStack{
            VStack {
                switch viewMode {
                case .list:
                    PeopleListView(viewModel: viewModel)
                case .map:
                    PeopleMapView(viewModel: viewModel)
                }
                
                HStack() {
                    Button(action: {
                        viewMode = .list
                    }, label: {
                        Text("List View")
                    })
                    .frame(maxWidth: .infinity, minHeight: 44)
                    
                    Button(action: {
                        viewMode = .map
                    }, label: {
                        Text("Map View")
                    })
                    .frame(maxWidth: .infinity, minHeight: 44)
                }
            }
            .padding(0)
            .onAppear(perform: {
                loadData()
            })
        }
    }
    
    func loadData() {
        if viewModel.people.isEmpty {
            Task {
                viewModel.fetchPeople()
            }
        }
    }
}

#Preview {
    ContentView()
}
