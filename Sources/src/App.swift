import TokamakDOM
//import srcLibrary

@main
struct TokamakApp: App {
    var body: some Scene {
        WindowGroup("AGI Test App") {
            ContentView()
                //.background(.green)
        }
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("This is a basic Web Assembly prototype app built with Swift, using Tokamak for UI, which uses a SwiftUI like API.")
                    .multilineTextAlignment(.center)
                
                PrototypeView()
            }
            .padding()
        }
        //.background(Color.yellow)
        //.frame(maxHeight: .infinity)
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
