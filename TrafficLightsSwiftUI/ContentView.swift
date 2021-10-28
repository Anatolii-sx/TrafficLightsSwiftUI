//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Анатолий Миронов on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var titleOfButton = "START"
    @State private var numberOfLight = 0
    @State private var opacitiesOfLights: [String: Double] = [
        "Red": 0.3,
        "Yellow": 0.3,
        "Green": 0.3
    ]
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ColorCircleView(
                    color: .red,
                    opacity: opacitiesOfLights["Red"] ?? 0.3
                )
                    .padding(.top, 60)
                ColorCircleView(
                    color: .yellow,
                    opacity: opacitiesOfLights["Yellow"] ?? 0.3
                )
                ColorCircleView(
                    color: .green,
                    opacity: opacitiesOfLights["Green"] ?? 0.3
                )
                
                Spacer()
                
                ChangeLightButton(title: titleOfButton) {
                    turnLightButtonTapped()
                }
                .padding(.bottom, 80)
            }
        }
    }
    
    private func turnLightButtonTapped() {
        changeTitleOfButton()
        changeOpacityOfLights()
        changeNumberOfChosenLight()
    }
    
    private func changeTitleOfButton() {
        if titleOfButton == "START" {
            titleOfButton = "NEXT"
        }
    }
    
    private func changeOpacityOfLights() {
        for (light, _) in opacitiesOfLights {
            opacitiesOfLights[light] = 0.3
        }
        
        switch numberOfLight {
        case 0: opacitiesOfLights["Red"] = 1
        case 1: opacitiesOfLights["Yellow"] = 1
        default: opacitiesOfLights["Green"] = 1
        }
    }
    
    private func changeNumberOfChosenLight(){
        if numberOfLight < opacitiesOfLights.count - 1 {
            numberOfLight += 1
        } else {
            numberOfLight = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
