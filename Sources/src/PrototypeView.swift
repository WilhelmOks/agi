//
//  PrototypeView.swift
//  
//
//  Created by Wilhelm Oks on 21.05.23.
//

import TokamakDOM
//import JavaScriptKit

struct PrototypeView: View {
    @State private var points = 0
    @State private var pointGenerators = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Points: \(points)")
            
            HStack {
                Text("Point Generators: \(pointGenerators)")
                
                Button("+1") {
                    pointGenerators += 1
                }
                
                Button("-1") {
                    if pointGenerators > 0 {
                        pointGenerators -= 1
                    }
                }
                
                //Spacer()
            }
            
            /*
            Button("save") {
                save()
            }
            
            Button("load") {
                load()
            }*/
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.primary)
                //.padding(-11)
        }
        .task {
            load()
            await tick()
        }
    }
    
    func save() {
        LocalStorage.standard.store(key: "points", value: points)
        LocalStorage.standard.store(key: "pointGenerators", value: pointGenerators)
    }
    
    func load() {
        points = Int(LocalStorage.standard.read(key: "points") ?? 0.0)
        pointGenerators = Int(LocalStorage.standard.read(key: "pointGenerators") ?? 0.0)
    }
    
    @MainActor func tick() async {
        points += pointGenerators
        save()
        try? await Task.sleep(nanoseconds: 1_000_000_000 / 3)
        await tick()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PrototypeView()
    }
}
