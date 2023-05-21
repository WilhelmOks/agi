import TokamakShim
import srcLibrary

@main
struct TokamakApp: App {
    var body: some Scene {
        WindowGroup("Tokamak App") {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This is a basic Web Assembly prototype app built with Swift, using Tokamak for UI, which uses a SwiftUI like API.")
            
            PrototypeView()
        }
        .padding()
    }
}
