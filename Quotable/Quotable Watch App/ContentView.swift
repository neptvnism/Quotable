import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuoteViewModel()
    
    var body: some View {
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
        .onAppear {
            viewModel.updateQuoteOfTheDay()
        }
    }
}

#Preview {
    ContentView()
}
