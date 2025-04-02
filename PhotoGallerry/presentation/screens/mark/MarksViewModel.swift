//
//  MarksViewModel.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 2.04.2025.
//
import Foundation

class MarksViewModel : ObservableObject {
    
    @Published var images = [ImageContent]()
    private var coreDataManager: CoreDataManager
    
    init() {
        self.coreDataManager = CoreDataManager()
    }
    
    func getImages(){
        images = coreDataManager.getImages().map{ $0.toImageContent()}
    }
    
}
