import Foundation

struct Quote: Identifiable {
    var id = UUID()
    var text: String
    var author: String
}

let quotes = [
    Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
    Quote(text: "Do not wait to strike till the iron is hot; but make it hot by striking.", author: "William Butler Yeats"),
    Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt"),
    // Add more quotes as desired
]
