import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuoteViewModel()
    
    var body: some View {
        TabView {
            VStack {
                Spacer()  // Push the content up
                
                VStack {
                    Text(viewModel.quoteOfTheDay.text)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("- \(viewModel.quoteOfTheDay.author)")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing, .bottom])
                }
                .padding(.bottom, 50)  // Add space for the button
                
                HStack {
                    Spacer()  // Push the button to the right
                    
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        Image(systemName: viewModel.favoritedQuotes.contains(where: { $0.id == viewModel.quoteOfTheDay.id }) ? "star.fill" : "star")
                            .foregroundColor(viewModel.favoritedQuotes.contains(where: { $0.id == viewModel.quoteOfTheDay.id }) ? .yellow : .gray)
                            .font(.system(size: 18))  // Smaller size for the button
                    }
                    .padding(8)  // Small padding around the button
                }
                .padding(.bottom, 16)  // Additional padding from the bottom
            }
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
