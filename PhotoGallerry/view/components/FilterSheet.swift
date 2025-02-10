//
//  FilterSheet.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//
import SwiftUI

struct FilterSheet: View {
    
    var getResults: ([String:String?]) -> Void
    @Binding var filterHash: [String:String?]
    var filterSelect: (_ key:String, _ value:String?) -> Void
    var reset: () -> Void = {  }
    
    var body: some View {
        
        VStack{
            HStack(alignment:.top){
                Text("Filter Settings").font(.title)
                Spacer()
                Button("Reset"){
                    reset()
                }
            }.padding()
            
            ForEach(Filter.allCases, id: \.self){ filter in
                FilterColumn(
                    selectedValue: filterHash[filter.query] as? String,
                    filter:filter,
                    onSelect: { selectedValue in
                        filterSelect(filter.query, selectedValue)
                    }
                )
            }
            
            Spacer()
            
            Button("Get Results"){
                getResults(filterHash)
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
