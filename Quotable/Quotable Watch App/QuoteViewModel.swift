import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteOfTheDay: Quote

    init() {
        self.quoteOfTheDay = quotes.randomElement()!
        self.updateQuoteOfTheDay()
    }

    func updateQuoteOfTheDay() {
        self.quoteOfTheDay = quotes.randomElement()!
    }
}
