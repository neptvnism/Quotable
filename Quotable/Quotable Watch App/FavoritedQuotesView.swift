import SwiftUI

struct FavoritedQuotesView: View {
    @ObservedObject var viewModel: QuoteViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.favoritedQuotes) { quote in
                HStack {
                    VStack(alignment: .leading) {
                        Text(quote.text)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        Text("- \(quote.author)")
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    Button(action: {
                        if let index = viewModel.favoritedQuotes.firstIndex(where: { $0.id == quote.id }) {
                            viewModel.favoritedQuotes.remove(at: index)
                        }
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                    }
                }
                .padding(.vertical, 8)
            }
        }
    }
}
