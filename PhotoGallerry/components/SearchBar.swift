//
//  SearchBar.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//
import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    var onClick: (String) -> Void
    
    var body: some View {
        HStack{
            TextField("Search photos",text: $searchText)
                .padding(10)
                .foregroundStyle(.black)
            ZStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 24,height: 24)
                    .padding([.leading, .trailing],20)
                    .padding([.top, .bottom],10)
                    
            }
            .background(Color("primary_color"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                onClick(searchText)
            }
        }
        .background(.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(maxWidth:.infinity)

    }
}

#Preview() {
    SearchBar() { text in
        
    }
}
