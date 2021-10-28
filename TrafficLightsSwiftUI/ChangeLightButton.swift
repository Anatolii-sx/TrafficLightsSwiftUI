//
//  ChangeLightButton.swift
//  TrafficLightsSwiftUI
//
//  Created by Анатолий Миронов on 28.10.2021.
//

import SwiftUI

struct ChangeLightButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(Color.white)
        }
        .padding()
        .frame(width: 125, height: 50)
        .background(Color.blue)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 3)
        )
    }
}

struct ChangeLightButton_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLightButton(title: "START", action: {})
    }
}
