//
//  GalleryViewModel.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 4.02.2025.
//
import Foundation

class ImageListViewModel : ObservableObject {
    
    var imageDao: ImageDao
    
    @Published var images = [ImageModel]()
    var currentPage: Int = 1
    let per_page = 50
    var totalHits:Int? = nil
    @Published var filter:[String:String?]=[:]
    
    init() {
        imageDao = ImageDao()
    }
        
    func getImages(query:String? = nil) {
        Task(priority:.background){
            do {
                let data = try await imageDao.getImages(page:currentPage, per_page: per_page,filter: filter, query:query)
                totalHits = data.totalHits
                DispatchQueue.main.async {
                    if let images = data.hits {
                        self.images = images
                    }
                }
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func setFilter(key:String,value:String?){
        filter[key] = value
    }
}
