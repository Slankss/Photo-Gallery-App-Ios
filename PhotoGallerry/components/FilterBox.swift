//
//  FilterBox.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//

import SwiftUI

public struct FilterBox: View {
    
    var text: String
    var isSelected: Bool
    
    public var body: some View {
        ZStack{
            HStack(spacing:5) {
                Text(text)
                    .font(.system(size: 13))
            }.padding(10)
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(isSelected ? .blue : .gray)
        .clipShape(RoundedRectangle(cornerRadius: 24))

    }
}

#Preview {
    FilterBox(text:"vertical",isSelected: true)
}
