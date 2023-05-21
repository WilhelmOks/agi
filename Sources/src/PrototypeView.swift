//
//  PrototypeView.swift
//  
//
//  Created by Wilhelm Oks on 21.05.23.
//

import TokamakShim

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
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
        .background {
            RoundedRectangle(cornerRadius: 10)
                //.shadow(radius: 10)
                .foregroundColor(.init(white: 0.965))
        }
        .task {
            await tick()
        }
    }
    
    func tick() async {
        points += pointGenerators
        try? await Task.sleep(nanoseconds: 1_000_000_000 / 10)
        await tick()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PrototypeView()
    }
}
