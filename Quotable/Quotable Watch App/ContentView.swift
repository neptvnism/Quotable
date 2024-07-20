import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuoteViewModel()
    @State private var showAlert = false
    @State private var showAddedMessage = false
    @State private var selectedTab = 0

    @State private var theme: Theme = Theme(rawValue: UserDefaults.standard.string(forKey: "theme") ?? "light") ?? .light
    @State private var fontName: String = UserDefaults.standard.string(forKey: "fontName") ?? "Arial"
    @State private var fontSize: Double = UserDefaults.standard.double(forKey: "fontSize")
    
    init() {
        if fontSize == 0 {
            fontSize = 16.0
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                VStack {
                    Text(viewModel.quoteOfTheDay.text)
                        .font(.custom(fontName, size: CGFloat(fontSize)))
                        .foregroundColor(theme.textColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .onTapGesture(count: 2) {
                            showAlert = true
                        }
                    Text("- \(viewModel.quoteOfTheDay.author)")
                        .font(.custom(fontName, size: CGFloat(fontSize) * 0.8))
                        .foregroundColor(theme.textColor)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .onTapGesture(count: 2) {
                            showAlert = true
                        }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Add to Favorites")
                            .foregroundColor(theme.textColor),
                        message: Text("Would you like to add this quote to your favorites?")
                            .foregroundColor(theme.textColor),
                        primaryButton: .default(Text("Yes")
                                                .foregroundColor(theme.buttonColor)) {
                            viewModel.toggleFavorite()
                            showAddedMessage = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showAddedMessage = false
                            }
                        },
                        secondaryButton: .cancel(Text("Cancel")
                                                .foregroundColor(theme.buttonColor))
                    )
                }
                
                if showAddedMessage {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 18))
                        Text("Added to favorites")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .transition(.opacity)
                    .padding(.bottom, 16)
                }
            }
            .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))
            .tabItem {
                Label("Quotes", systemImage: "quote.bubble")
            }
            .tag(0)
            .gesture(DragGesture()
                        .onEnded { value in
                            if value.translation.width < -100 {
                                withAnimation {
                                    selectedTab = 2  // Switch to Settings tab
                                }
                            }
                        })

            FavoritedQuotesView(viewModel: viewModel, theme: theme)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .tag(1)
                .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))

            SettingsView(viewModel: viewModel, theme: $theme, fontName: $fontName, fontSize: $fontSize)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
                .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))
        }
        .preferredColorScheme(theme.colorScheme)
        .onChange(of: theme) { newTheme in
            UserDefaults.standard.set(newTheme.rawValue, forKey: "theme")
        }
        .onChange(of: fontName) { newFontName in
            UserDefaults.standard.set(newFontName, forKey: "fontName")
        }
        .onChange(of: fontSize) { newFontSize in
            UserDefaults.standard.set(newFontSize, forKey: "fontSize")
        }
    }
}
