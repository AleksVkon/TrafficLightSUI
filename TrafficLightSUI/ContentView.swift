//
//  ContentView.swift
//  TrafficLightSUI
//
//  Created by Aleksey Konchyts on 16.04.24.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "START"
    @State private var buttonPressed = false
    
    @State private var redLightIsOn = false
    @State private var yellowLightIsOn = false
    @State private var greenLightIsOn = false
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(redLightIsOn ? .red : .red.opacity(0.3))
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                
            Circle()
                .foregroundColor(yellowLightIsOn ? .yellow : .yellow.opacity(0.3))
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
            
            Circle()
                .foregroundColor(greenLightIsOn ? .green : .green.opacity(0.3))
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
            
            Spacer()
            
            Button(action: buttonAction, label: {
                Text(buttonText)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150)
                    .background(Color.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                    )
            })
        }
        .padding()
    }
    
    private func buttonAction() {
        if redLightIsOn {
            redLightIsOn = false
            yellowLightIsOn = true
        } else if yellowLightIsOn {
            yellowLightIsOn = false
            greenLightIsOn = true
        } else {
            greenLightIsOn = false
            redLightIsOn = true
        }
        if !buttonPressed {
            buttonText = "NEXT"
            buttonPressed = true
        }
        
    }
}

#Preview {
    ContentView()
}
