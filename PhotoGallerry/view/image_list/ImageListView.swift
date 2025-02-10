//
//  ContentView.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//

import SwiftUI

struct ImageListView: View {
    
    @ObservedObject private var imageListViewModel = ImageListViewModel()
    
    @State private var filterSheetIsPresented: Bool = false
    
    var body: some View {
    
        NavigationStack {
            VStack{
                Header(
                    openFilterSheet: {
                        filterSheetIsPresented.toggle()
                    },
                    search: { searchText in
                        imageListViewModel.getImages(query: searchText)
                    }
                )
                
                ScrollView(.vertical){
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]
                    ){
                        ForEach(imageListViewModel.images, id:\.self.id) { image in
                            ZStack{
                                if let url = image.webformatURL {
                                    NavigationLink(destination:ImageDetailView(image:image)){
                                        ImageBox(url: url)
                                    }
                                }
                            }
                        }
                        
                    }
                }
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned )
                .scrollBounceBehavior(.basedOnSize)
                
            }
            .background(Color("color_bg"))
        }
        .onAppear{
            imageListViewModel.getImages()
        }
        .sheet(isPresented: $filterSheetIsPresented, content: {
            FilterSheet(
                getResults: { filter in
                    imageListViewModel.getImages()
                    filterSheetIsPresented = false
                },
                filterHash: $imageListViewModel.filter,
                filterSelect: { key, value in
                    imageListViewModel.setFilter(key: key, value: value)
                }
            )
        })
    }
}

#Preview {
    ImageListView()
}
