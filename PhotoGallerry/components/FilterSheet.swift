//
//  FilterSheet.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//
import SwiftUI

struct FilterSheet: View {
    
    @State private var isOrientationFilterExpanded = false
    
    var body: some View {
        
        VStack{
            HStack(alignment:.top){
                Text("Filter Settings").font(.title)
                Spacer()
                Button("Reset"){
                    
                }
            }.padding()
            
            ForEach(Filter.allCases, id: \.self){ filter in
                FilterColumn(filter:filter)
            }
            
            Spacer()
            
            Button("Get Results"){
                
            }
            .foregroundStyle(.white)
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(.blue)
            .cornerRadius(24)
            .padding(20)
                                            
        }.frame(maxHeight:.infinity, alignment: .top)        
    }
}

#Preview {
    FilterSheet()
}
