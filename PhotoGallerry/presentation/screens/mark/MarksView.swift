//
//  MarksView.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 2.04.2025.
//

import SwiftUI

struct MarksView: View {
    
    @ObservedObject private var marksViewModel = MarksViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack{
                    Text("Marked Images")
                        .padding(8)
                        .font(.system(size:20, weight:.bold))
                }
                .frame(maxWidth:.infinity)
                .background(.white)
                ScrollView(.vertical){
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]
                    ){
                        ForEach(marksViewModel.images, id:\.self.id) { image in
                            ZStack{
                                if let url = image.imageUrl {
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
            .onAppear{
                marksViewModel.getImages()
            }
            .background(Color("color_bg"))
        }
    }
}

#Preview {
    MarksView()
}
