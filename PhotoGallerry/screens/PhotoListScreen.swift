//
//  ContentView.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//

import SwiftUI

struct PhotoListScreen: View {
    var body: some View {
        GeometryReader{ geometry in
            var width = geometry.size.width * 0.7
            ScrollView{
                LazyVStack{
                    Image("icardi")
                        .resizable()
                        .frame(width: width,height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .foregroundStyle(.tint)
                }
            }
            VStack {
                

            }
        }
        
    }
}

#Preview {
    PhotoListScreen()
}
