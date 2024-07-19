import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteOfTheDay: Quote
    @Published var favoritedQuotes: [Quote] = []
    
    
    init() {
        self.quoteOfTheDay = quotes.randomElement()!
        self.updateQuoteOfTheDay()
    }
    
    func updateQuoteOfTheDay() {
        self.quoteOfTheDay = quotes.randomElement()!
    }
    
    func toggleFavorite() {
        if let index = favoritedQuotes.firstIndex(where: { $0.id == quoteOfTheDay.id }) {
            favoritedQuotes.remove(at: index)
        } else {
            favoritedQuotes.append(quoteOfTheDay)
        }
        
    }
}
