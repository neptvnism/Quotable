import SwiftUI

struct FavoritedQuotesView: View {
    @ObservedObject var viewModel: QuoteViewModel
    
    var body: some View {
        List(viewModel.favoritedQuotes) { quote in
            VStack(alignment: .leading) {
                Text(quote.text)
                    .font(.headline)
                Text("- \(quote.author)")
                    .font(.subheadline)
            }
        }
    }
}
