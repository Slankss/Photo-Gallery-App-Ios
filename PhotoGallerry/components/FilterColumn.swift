//
//  FilterColumn.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//
import SwiftUI

struct FilterColumn: View {
    
    @State private var isOrientationFilterExpanded = false
    @State private var selectedValue = ""
    var filter: Filter
    
    var body: some View {
        DisclosureGroup(filter.query.capitalized, isExpanded: $isOrientationFilterExpanded) {
            let columns = [GridItem(.adaptive(minimum: 102))]
            LazyVGrid(columns: columns,spacing: 10){
                ForEach(filter.values, id:\.hashValue){ value in
                    FilterBox(text: value, isSelected: value == selectedValue)
                        .onTapGesture{
                            if selectedValue == value {
                                selectedValue = ""
                                return
                            }
                            selectedValue = value
                        }
                }
            }.padding(.top, 10)
        }
        .foregroundStyle(.black)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
}
