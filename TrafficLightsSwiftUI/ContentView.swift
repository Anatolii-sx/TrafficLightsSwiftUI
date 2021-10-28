//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Анатолий Миронов on 26.10.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green, noColor
}

struct ContentView: View {
    
    @State private var titleOfButton = "START"
    @State private var currentLight = CurrentLight.noColor

    private func nextLight() {
        switch currentLight {
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        default: currentLight = .red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                ColorCircleView(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                ColorCircleView(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                ColorCircleView(color: .green, opacity: currentLight == .green ? 1 : 0.3)

                Spacer()

                ChangeLightButton(title: titleOfButton) {
                    if titleOfButton == "START" {
                        titleOfButton = "NEXT"
                    }
                    nextLight()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
