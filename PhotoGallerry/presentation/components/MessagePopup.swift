//
//  MessagePopup.swift
//  PersonsApp
//
//  Created by Okan Kukul on 4.02.2025.
//
import SwiftUI

struct MessagePopup: View {
    let message:String
    var body: some View {
        Text(message)
            .padding()
            .background(Color.black.opacity(0.8))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .animation(.easeInOut, value: message)
    }
}
