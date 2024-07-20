import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuoteViewModel()
    @State private var showAlert = false
    @State private var showAddedMessage = false
    @State private var selectedTab = 0
    @AppStorage("theme") private var theme: Theme = .light
    @AppStorage("fontName") private var fontName: String = "Arial"
    @AppStorage("fontSize") private var fontSize: Double = 16.0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                VStack {
                    Text(viewModel.quoteOfTheDay.text)
                        .font(.custom(fontName, size: CGFloat(fontSize)))
                        .foregroundColor(theme.textColor)
                        .multilineTextAlignment(.center)
                        .onTapGesture(count: 2) {
                            showAlert = true
                        }
                    Text("- \(viewModel.quoteOfTheDay.author)")
                        .font(.custom(fontName, size: CGFloat(fontSize) * 0.8))
                        .foregroundColor(theme.textColor)
                        .multilineTextAlignment(.center)
                        .onTapGesture(count: 2) {
                            showAlert = true
                        }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Add to Favorites"),
                        message: Text("Would you like to add this quote to your favorites?"),
                        primaryButton: .default(Text("Yes")) {
                            viewModel.toggleFavorite()
                            showAddedMessage = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showAddedMessage = false
                            }
                        },
                        secondaryButton: .cancel()
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
            .padding(.horizontal)  // Minimize padding around the content
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

            FavoritedQuotesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .tag(1)
                .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))

            SettingsView(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
                .background(theme.backgroundColor.edgesIgnoringSafeArea(.all))
        }
        .preferredColorScheme(theme.colorScheme)
    }
}
