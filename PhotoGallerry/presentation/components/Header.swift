//
//  Header.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 7.02.2025.
//
import SwiftUI

struct Header: View{
    var openFilterSheet : () -> Void
    var search: (String) -> Void
    var body: some View {
        VStack{
            HStack {
                SearchBar(){ text in
                    search(text)
                }
                
                Image("ic_filter")
                    .resizable()
                    .frame(width: 36,height: 36)
                    .onTapGesture {
                        openFilterSheet()
                    }
                
            }
            .padding([.leading, .trailing], 10)
            .padding([.top,.bottom],5)
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 0.2)
                .background(.gray.opacity(0.2))
        }
        .background(.white)
        .shadow(color: .black.opacity(0.2),radius: 5,x:0,y:5)
    }
}

