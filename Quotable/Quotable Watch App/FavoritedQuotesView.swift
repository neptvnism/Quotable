import SwiftUI

struct FavoritedQuotesView: View {
    @ObservedObject var viewModel: QuoteViewModel
    @AppStorage("theme") private var theme: Theme = .light
    
    var body: some View {
        List {
            ForEach(viewModel.favoritedQuotes) { quote in
                HStack {
                    VStack(alignment: .leading) {
                        Text(quote.text)
                            .font(.custom(viewModel.fontName, size: CGFloat(viewModel.fontSize)))
                            .foregroundColor(theme.textColor)
                            .multilineTextAlignment(.leading)
                        Text("- \(quote.author)")
                            .font(.custom(viewModel.fontName, size: CGFloat(viewModel.fontSize) * 0.8))
                            .foregroundColor(theme.textColor)
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
        .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))
        .foregroundColor(theme.textColor)
    }
}
