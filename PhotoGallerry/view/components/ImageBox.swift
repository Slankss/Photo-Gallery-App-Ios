//
//  ImageBox.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 7.02.2025.
//
import SwiftUI

struct ImageBox: View {
    
    var url:String
    var height: CGFloat = 200
    var imageLoadedSuccess: () -> Void = { }
    
    var body: some View {
        
        AsyncImage(url:URL(string: url)){ phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(5)
                    .frame(maxWidth:.infinity)
                    .frame(height:height)
                    .onAppear{
                        imageLoadedSuccess()
                    }
                
            case .failure:
                EmptyView()
                
            @unknown default:
                EmptyView()
            }
        }
    }
}
