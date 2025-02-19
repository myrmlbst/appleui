//
//  ContentView.swift
//  apple-intelligence-ui
//
//  Created by Macintosh on 19/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    
    private var descriptiveText = "This animation button was developed while studying Apple Intelligence's user interface design, specifically the animations that happen once Apple Intelligence is triggered. You can check the source code on my GitHub account :)"
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Apple Intelligence Animation")
                .font(.title2)
            Text("A mesh animation developed in Swift and SwiftUI, inspired by Apple AI's new UI")
                .font(.callout)
                .padding()
                .multilineTextAlignment(.center)
            Button("Kickstart Animation") {
                isShowingAlert = true
            }
            .alert(descriptiveText, isPresented: $isShowingAlert) {
                Button("Check Code") {
                    // redirect to the repo
                }
                Button("Cancel", role: .cancel) {
                    // exit the popup
                }
            }
            .cornerRadius(20)
            .buttonStyle(.borderedProminent)
            .tint(.teal)
            .padding()
            // potentially look into these:
            // .accessibilityHint(<#T##hint: Text##Text#>)
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
