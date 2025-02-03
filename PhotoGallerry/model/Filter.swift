//
//  FilterSettings.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//
enum Filter: CaseIterable {
    case orientation
    case category
    case order
    case color
    
    var query: String {
        switch self {
        case .orientation: return "orientation"
        case .category: return "category"
        case .order: return "order"
        case .color: return "color"
        }
    }
    
    var values: [String] {
        switch self {
            case .orientation: return ["all", "vertical", "horizontal"]
            case .order: return ["popular","latest"]
            case .color: return ["black","white","red","yellow","green","blue","purple","orange","brown","gray","pink","turquoise","lilac"]
            case .category: return ["backgrounds","fashion","nature","science","education","feelings","health","people","religion","places","animals","industry","computer","sports","travel","buildings","music"]
        }
    }
}
