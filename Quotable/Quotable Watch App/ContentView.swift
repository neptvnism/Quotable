import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuoteViewModel()
    
    var body: some View {
        TabView {
            VStack {
                HStack {
                    Text(viewModel.quoteOfTheDay.text)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        Image(systemName: viewModel.favoritedQuotes.contains(where: { $0.id == viewModel.quoteOfTheDay.id }) ? "star.fill" : "star")
                            .foregroundColor(viewModel.favoritedQuotes.contains(where: { $0.id == viewModel.quoteOfTheDay.id }) ? .yellow : .gray)
                            .font(.title)
                    }
                }
                Text("- \(viewModel.quoteOfTheDay.author)")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing, .bottom])
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
