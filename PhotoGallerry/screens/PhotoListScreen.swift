//
//  ContentView.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//

import SwiftUI

struct PhotoListScreen: View {
    
    @State private var filterSheetIsPresented: Bool = false
    @State private var photoDialogVisibility = false
    
    var body: some View {
        GeometryReader{ geometry in
            let width = geometry.size.width * 0.7
            
            ZStack{
                ScrollView{
                    HStack {
                        SearchBar(){ text in
                            // Search
                        }
                        Image("ic_filter")
                            .resizable()
                            .frame(width: 50,height: 50)
                            .onTapGesture {
                                filterSheetIsPresented.toggle()
                            }
        
                    }.padding([.leading, .trailing], 20)
                    
                    LazyVStack{
                        Image("icardi")
                            .resizable()
                            .frame(width: width,height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(.tint)
                            .onLongPressGesture {
                                photoDialogVisibility = true
                            }
                    }
                }
                
                if photoDialogVisibility {
                    PhotoDialog(
                        dismissClick: {
                            photoDialogVisibility = false
                        },
                        openWebPageClick: {
                            
                        },
                        shareClick: {
                            
                        },
                        downloadClick: {
                            
                        }
                    )
                }
            }
            .background(Color("bg_color"))
            .sheet(isPresented: $filterSheetIsPresented, content: { FilterSheet() })
            }
    }
}

#Preview {
    PhotoListScreen()
}
