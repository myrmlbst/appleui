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
                .bold()
            
            Text("A button animation inspired by Apple\nAI's new UI")
                .font(.callout)
                .padding()
                .multilineTextAlignment(.center)
            
            MovingDashPhaseButton()
            
            Button("About this project") {
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
            .tint(.gray)
            .foregroundStyle(.white)
            .padding(-16)
            //.frame(width: 190, height: 50)
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


// button animation:
struct MovingDashPhaseButton: View {
    @State private var isMoving = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 27)
                .frame(width: 190, height: 50)
                .foregroundStyle(.black.gradient)
            RoundedRectangle(cornerRadius: 27)
                .strokeBorder(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [30, 200], dashPhase: isMoving ? 200 : -200))
                .frame(width: 200, height: 60)
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(colors: [.orange, .green, .blue, .white, .cyan]), startPoint: .trailing, endPoint: .leading)
                    )
            
            Button("Kickstart Animation") {
                // this is the button
                // no changes needed
            }
            .foregroundColor(.white)
        }
        .onAppear {
            // infinite loop animation without any delay or pause
            withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                isMoving.toggle()
            }
        }
    }
}
