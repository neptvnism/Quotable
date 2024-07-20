import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteOfTheDay: Quote
    @Published var favoritedQuotes: [Quote] = []

    var fontName: String {
        get { UserDefaults.standard.string(forKey: "fontName") ?? "Arial" }
        set { UserDefaults.standard.set(newValue, forKey: "fontName") }
    }
    var fontSize: Double {
        get { UserDefaults.standard.double(forKey: "fontSize") }
        set { UserDefaults.standard.set(newValue, forKey: "fontSize") }
    }

    private let quotes: [Quote] = [
        Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(text: "Do not wait to strike till the iron is hot; but make it hot by striking.", author: "William Butler Yeats"),
        Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt"),
        Quote(text: "Life is what happens when you're busy making other plans.", author: "John Lennon"),
        Quote(text: "The purpose of our lives is to be happy.", author: "Dalai Lama"),
        Quote(text: "Get busy living or get busy dying.", author: "Stephen King"),
        Quote(text: "You have within you right now, everything you need to deal with whatever the world can throw at you.", author: "Brian Tracy"),
        Quote(text: "The best way to predict your future is to create it.", author: "Peter Drucker"),
        Quote(text: "You miss 100% of the shots you don't take.", author: "Wayne Gretzky"),
        Quote(text: "Believe you can and you're halfway there.", author: "Theodore Roosevelt"),
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
        Quote(text: "Success usually comes to those who are too busy to be looking for it.", author: "Henry David Thoreau"),
        Quote(text: "Don't watch the clock; do what it does. Keep going.", author: "Sam Levenson"),
        Quote(text: "In three words I can sum up everything I've learned about life: it goes on.", author: "Robert Frost"),
        Quote(text: "Life is really simple, but we insist on making it complicated.", author: "Confucius"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "Change your thoughts and you change your world.", author: "Norman Vincent Peale"),
        Quote(text: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "You do not find the happy life. You make it.", author: "Camilla E. Kimball"),
        Quote(text: "Life isn't about finding yourself. Life is about creating yourself.", author: "George Bernard Shaw"),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act, but a habit.", author: "Aristotle"),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson"),
        Quote(text: "If you want to lift yourself up, lift up someone else.", author: "Booker T. Washington"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Everything you’ve ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Opportunities don't happen. You create them.", author: "Chris Grosser"),
        Quote(text: "Do what you can, with what you have, where you are.", author: "Theodore Roosevelt"),
        Quote(text: "You are never too old to set another goal or to dream a new dream.", author: "C.S. Lewis"),
        Quote(text: "To live is the rarest thing in the world. Most people exist, that is all.", author: "Oscar Wilde"),
        Quote(text: "Life is either a daring adventure or nothing at all.", author: "Helen Keller"),
        Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(text: "In the end, we will remember not the words of our enemies, but the silence of our friends.", author: "Martin Luther King Jr."),
        Quote(text: "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more so that we may fear less.", author: "Marie Curie"),
        Quote(text: "We can't help everyone, but everyone can help someone.", author: "Ronald Reagan"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela"),
        Quote(text: "Life is short, and it is up to you to make it sweet.", author: "Sarah Louise Delany"),
        Quote(text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot"),
        Quote(text: "The harder I work, the luckier I get.", author: "Samuel Goldwyn"),
        Quote(text: "It always seems impossible until it is done.", author: "Nelson Mandela"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "I have not failed. I've just found 10,000 ways that won't work.", author: "Thomas Edison"),
        Quote(text: "We don't see things as they are, we see them as we are.", author: "Anaïs Nin"),
        Quote(text: "You must be the change you wish to see in the world.", author: "Mahatma Gandhi"),
        Quote(text: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(text: "Life is what we make it, always has been, always will be.", author: "Grandma Moses"),
        Quote(text: "To handle yourself, use your head; to handle others, use your heart.", author: "Eleanor Roosevelt"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "Change your thoughts and you change your world.", author: "Norman Vincent Peale"),
        Quote(text: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "You do not find the happy life. You make it.", author: "Camilla E. Kimball"),
        Quote(text: "Life isn't about finding yourself. Life is about creating yourself.", author: "George Bernard Shaw"),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act, but a habit.", author: "Aristotle"),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson"),
        Quote(text: "If you want to lift yourself up, lift up someone else.", author: "Booker T. Washington"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Everything you’ve ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Opportunities don't happen. You create them.", author: "Chris Grosser"),
        
        Quote(text: "In the end, we will remember not the words of our enemies, but the silence of our friends.", author: "Martin Luther King Jr."),
        Quote(text: "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more so that we may fear less.", author: "Marie Curie"),
        Quote(text: "We can't help everyone, but everyone can help someone.", author: "Ronald Reagan"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela"),
        Quote(text: "Life is short, and it is up to you to make it sweet.", author: "Sarah Louise Delany"),
        Quote(text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot"),
        Quote(text: "The harder I work, the luckier I get.", author: "Samuel Goldwyn"),
        Quote(text: "It always seems impossible until it is done.", author: "Nelson Mandela"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "I have not failed. I've just found 10,000 ways that won't work.", author: "Thomas Edison"),
        Quote(text: "We don't see things as they are, we see them as we are.", author: "Anaïs Nin"),
        Quote(text: "You must be the change you wish to see in the world.", author: "Mahatma Gandhi"),
        Quote(text: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(text: "Life is what we make it, always has been, always will be.", author: "Grandma Moses"),
        Quote(text: "To handle yourself, use your head; to handle others, use your heart.", author: "Eleanor Roosevelt"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "Change your thoughts and you change your world.", author: "Norman Vincent Peale"),
        Quote(text: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "You do not find the happy life. You make it.", author: "Camilla E. Kimball"),
        Quote(text: "Life isn't about finding yourself. Life is about creating yourself.", author: "George Bernard Shaw"),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act, but a habit.", author: "Aristotle"),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson"),
        Quote(text: "If you want to lift yourself up, lift up someone else.", author: "Booker T. Washington"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Everything you’ve ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Opportunities don't happen. You create them.", author: "Chris Grosser"),
        Quote(text: "Do what you can, with what you have, where you are.", author: "Theodore Roosevelt"),
        Quote(text: "You are never too old to set another goal or to dream a new dream.", author: "C.S. Lewis"),
        Quote(text: "To live is the rarest thing in the world. Most people exist, that is all.", author: "Oscar Wilde"),
        Quote(text: "Life is either a daring adventure or nothing at all.", author: "Helen Keller"),
        Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(text: "In the end, we will remember not the words of our enemies, but the silence of our friends.", author: "Martin Luther King Jr."),
        Quote(text: "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more so that we may fear less.", author: "Marie Curie"),
        Quote(text: "We can't help everyone, but everyone can help someone.", author: "Ronald Reagan"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela"),
        Quote(text: "Life is short, and it is up to you to make it sweet.", author: "Sarah Louise Delany"),
        Quote(text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot"),
        Quote(text: "The harder I work, the luckier I get.", author: "Samuel Goldwyn"),
        Quote(text: "It always seems impossible until it is done.", author: "Nelson Mandela"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "I have not failed. I've just found 10,000 ways that won't work.", author: "Thomas Edison"),
        Quote(text: "We don't see things as they are, we see them as we are.", author: "Anaïs Nin"),
        Quote(text: "You must be the change you wish to see in the world.", author: "Mahatma Gandhi"),
        Quote(text: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(text: "Life is what we make it, always has been, always will be.", author: "Grandma Moses"),
        Quote(text: "To handle yourself, use your head; to handle others, use your heart.", author: "Eleanor Roosevelt"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "Change your thoughts and you change your world.", author: "Norman Vincent Peale"),
        Quote(text: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),


        Quote(text: "You do not find the happy life. You make it.", author: "Camilla E. Kimball"),
        Quote(text: "Life isn't about finding yourself. Life is about creating yourself.", author: "George Bernard Shaw"),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act, but a habit.", author: "Aristotle"),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson"),
        Quote(text: "If you want to lift yourself up, lift up someone else.", author: "Booker T. Washington"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Everything you’ve ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Opportunities don't happen. You create them.", author: "Chris Grosser"),
        Quote(text: "Do what you can, with what you have, where you are.", author: "Theodore Roosevelt"),
        Quote(text: "You are never too old to set another goal or to dream a new dream.", author: "C.S. Lewis"),
        Quote(text: "To live is the rarest thing in the world. Most people exist, that is all.", author: "Oscar Wilde"),
        Quote(text: "Life is either a daring adventure or nothing at all.", author: "Helen Keller"),
        Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(text: "In the end, we will remember not the words of our enemies, but the silence of our friends.", author: "Martin Luther King Jr."),
        Quote(text: "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more so that we may fear less.", author: "Marie Curie"),
        Quote(text: "We can't help everyone, but everyone can help someone.", author: "Ronald Reagan"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela"),
        Quote(text: "Life is short, and it is up to you to make it sweet.", author: "Sarah Louise Delany"),
        Quote(text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot"),
        Quote(text: "The harder I work, the luckier I get.", author: "Samuel Goldwyn"),
        Quote(text: "It always seems impossible until it is done.", author: "Nelson Mandela"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "I have not failed. I've just found 10,000 ways that won't work.", author: "Thomas Edison"),
        Quote(text: "We don't see things as they are, we see them as we are.", author: "Anaïs Nin"),
        Quote(text: "You must be the change you wish to see in the world.", author: "Mahatma Gandhi"),
        Quote(text: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(text: "Life is what we make it, always has been, always will be.", author: "Grandma Moses"),
        Quote(text: "To handle yourself, use your head; to handle others, use your heart.", author: "Eleanor Roosevelt"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(text: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "Change your thoughts and you change your world.", author: "Norman Vincent Peale"),
        Quote(text: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "You do not find the happy life. You make it.", author: "Camilla E. Kimball"),
        Quote(text: "Life isn't about finding yourself. Life is about creating yourself.", author: "George Bernard Shaw"),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act, but a habit.", author: "Aristotle"),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson"),
        Quote(text: "If you want to lift yourself up, lift up someone else.", author: "Booker T. Washington"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Everything you’ve ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Opportunities don't happen. You create them.", author: "Chris Grosser"),
        Quote(text: "Do what you can, with what you have, where you are.", author: "Theodore Roosevelt"),
        Quote(text: "You are never too old to set another goal or to dream a new dream.", author: "C.S. Lewis"),
        Quote(text: "To live is the rarest thing in the world. Most people exist, that is all.", author: "Oscar Wilde"),
        Quote(text: "Life is either a daring adventure or nothing at all.", author: "Helen Keller"),
        Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(text: "In the end, we will remember not the words of our enemies, but the silence of our friends.", author: "Martin Luther King Jr."),
        Quote(text: "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more so that we may fear less.", author: "Marie Curie"),
        Quote(text: "We can't help everyone, but everyone can help someone.", author: "Ronald Reagan"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(text: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela"),
        Quote(text: "Life is short, and it is up to you to make it sweet.", author: "Sarah Louise Delany"),
        Quote(text: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(text: "It is never too late to be what you might have been.", author: "George Eliot"),
        Quote(text: "The harder I work, the luckier I get.", author: "Samuel Goldwyn"),
        Quote(text: "It always seems impossible until it is done.", author: "Nelson Mandela"),
        Quote(text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson"),
        Quote(text: "I have not failed. I've just found 10,000 ways that won't work.", author: "Thomas Edison"),
        Quote(text: "We don't see things as they are, we see them as we are.", author: "Anaïs Nin"),
        Quote(text: "You must be the change you wish to see in the world.", author: "Mahatma Gandhi"),
        Quote(text: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(text: "Life is what we make it, always has been, always will be.", author: "Grandma Moses"),
        Quote(text: "To handle yourself, use your head; to handle others, use your heart.", author: "Eleanor Roosevelt"),
        Quote(text: "The only way to have a friend is to be one.", author: "Ralph Waldo Emerson"),
        Quote(text: "It does not matter how slowly you go as long as you do not stop.", author

    : "Confucius"),
        Quote(text: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(text: "We may encounter many defeats but we must not be defeated.", author: "Maya Angelou"),
        Quote(text: "To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.", author: "Ralph Waldo Emerson"),
        Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
        Quote(text: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(text: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama"),
        Quote(text: "Change your thoughts and you change your world.", author: "Norman Vincent Peale"),
        Quote(text: "Do one thing every day that scares you.", author: "Eleanor Roosevelt"),
        Quote(text: "The only impossible journey is the one you never begin.", author: "Tony Robbins"),
        Quote(text: "You do not find the happy life. You make it.", author: "Camilla E. Kimball"),
        Quote(text: "Life isn't about finding yourself. Life is about creating yourself.", author: "George Bernard Shaw"),
        Quote(text: "We are what we repeatedly do. Excellence, then, is not an act, but a habit.", author: "Aristotle"),
        Quote(text: "The only person you are destined to become is the person you decide to be.", author: "Ralph Waldo Emerson"),
        Quote(text: "If you want to lift yourself up, lift up someone else.", author: "Booker T. Washington"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Everything you’ve ever wanted is on the other side of fear.", author: "George Addair"),
        Quote(text: "Opportunities don't happen. You create them.", author: "Chris Grosser"),
        Quote(text: "Do what you can, with what you have, where you are.", author: "Theodore Roosevelt"),
        Quote(text: "You are never too old to set another goal or to dream a new dream.", author: "C.S. Lewis"),    ]
    
    private let favoritedQuotesKey = "favoritedQuotes"

    init() {
        self.quoteOfTheDay = quotes.randomElement() ?? Quote(text: "No quote available", author: "Unknown")
        loadFavoritedQuotes()
    }
    
    func updateQuoteOfTheDay() {
        self.quoteOfTheDay = quotes.randomElement() ?? Quote(text: "No quote available", author: "Unknown")
    }
    
    func toggleFavorite() {
        if let index = favoritedQuotes.firstIndex(where: { $0.id == quoteOfTheDay.id }) {
            favoritedQuotes.remove(at: index)
        } else {
            favoritedQuotes.append(quoteOfTheDay)
        }
        saveFavoritedQuotes()
    }
    
    func resetFavorites() {
        favoritedQuotes.removeAll()
        saveFavoritedQuotes()
    }
    
    private func saveFavoritedQuotes() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favoritedQuotes) {
            UserDefaults.standard.set(encoded, forKey: favoritedQuotesKey)
        }
    }
    
    private func loadFavoritedQuotes() {
        if let savedData = UserDefaults.standard.data(forKey: favoritedQuotesKey) {
            let decoder = JSONDecoder()
            if let loadedQuotes = try? decoder.decode([Quote].self, from: savedData) {
                favoritedQuotes = loadedQuotes
            }
        }
    }
}
