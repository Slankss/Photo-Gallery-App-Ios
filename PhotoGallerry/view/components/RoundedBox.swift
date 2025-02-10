//
//  FilterBox.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//

import SwiftUI

public struct RoundedBox: View {
    
    var text: String
    var isSelected: Bool = false
    var color: Color = Color(.gray)
    
    public var body: some View {
        ZStack{
            HStack(spacing:5) {
                Text(text)
                    .font(.system(size: 13))
            }.padding(10)
        }
        .foregroundStyle(.white)
        .frame(minWidth: 80)
        .frame(maxWidth: .infinity)
        .background(isSelected ? .blue : color)
        .clipShape(RoundedRectangle(cornerRadius: 24))

    }
}

#Preview {
    RoundedBox(text:"vertical",isSelected: true)
}
