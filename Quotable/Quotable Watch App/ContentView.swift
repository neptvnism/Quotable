import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuoteViewModel()
    @State private var showAlert = false
    @State private var showAddedMessage = false
    
    var body: some View {
        TabView {
            VStack {
                VStack {
                    Text(viewModel.quoteOfTheDay.text)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                        .onTapGesture(count: 2) {
                            showAlert = true
                        }
                    Text("- \(viewModel.quoteOfTheDay.author)")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing, .bottom])
                        .onTapGesture(count: 2) {
                            showAlert = true
                        }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Add to Favorites"),
                        message: Text("Would you like to add this quote to your favorites?"),
                        primaryButton: .default(Text("Yes")) {
                            viewModel.toggleFavorite()
                            showAddedMessage = true
                        },
                        secondaryButton: .cancel()
                    )
                }
                .padding(.bottom, 50)  // Add space for the message
                
                if showAddedMessage {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 18))
                        Text("Added to favorites")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .transition(.opacity)
                    .padding(.bottom, 16)
                }
            }
            .padding()  // Ensure padding around the content
            .tabItem {
                Label("Quotes", systemImage: "quote.bubble")
            }

            FavoritedQuotesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

