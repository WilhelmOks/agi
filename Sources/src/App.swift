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
            PrototypeView()
        }
        .padding()
    }
}
