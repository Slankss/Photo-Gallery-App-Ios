//
//  PhotoDialog.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 4.02.2025.
//
import SwiftUI

struct PhotoDialog: View {
    
    var dismissClick: () -> Void
    var openWebPageClick: () -> Void
    var shareClick: () -> Void
    var downloadClick: () -> Void
 
    var body: some View {
        Color.black.opacity(0.3)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                dismissClick()
            }
        
        ZStack{
            HStack{
                VStack(spacing:20){
                    Image("ic_web")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 40,height: 40)
                        .foregroundStyle(.black)
                        .onTapGesture {
                            
                        }
                    Text("Web Sitesi")
                }
                
                Spacer()
                
                VStack(spacing:20){
                    Image("ic_share")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.black)
                        .frame(width: 40,height: 40)
                        .onTapGesture {
                            
                        }
                    Text("Paylaş")
                }
                
                Spacer()
                
                VStack(spacing:20){
                    Image("ic_download")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(.black)
                        .frame(width: 40,height: 40)
                        .onTapGesture {
                            
                        }
                    Text("İndir")
                }
            }.padding(50)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .padding([.trailing,.leading], 25)
        
    }
}
