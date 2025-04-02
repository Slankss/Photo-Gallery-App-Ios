//
//  PhotoDetailViewModel.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 9.02.2025.
//
import Foundation
class ImageDetailViewModel: ObservableObject {
    
    var fileService:FileService
    var coreDataManager:CoreDataManager
    @Published var isMark:Bool = false
    
    init() {
        self.fileService = FileService()
        self.coreDataManager = CoreDataManager()
    }
    
    var notificationPermission:Bool {
        let ud = UserDefaults.standard
        return ud.bool(forKey: "notificationPermission")
    }
    
    
    func convertTagsToList(tags:String?) -> [String]? {
        if tags == nil {
            return nil
        }
        let tags = tags!.trimmingCharacters(in: .whitespaces)
            .split(separator: ",")
            .map{ String($0) }

        return Array(Set(tags))
    }
    
    func downloadImage(url:String){
        fileService.downloadImage(url: url)
    }
    
    func isFavorite(id: Int){
        isMark = coreDataManager.getImage(id: id) != nil
    }
    
    func setMarkImage(image: ImageContent){
        print("setMarkImage funct")
        if isMark {
            print("is mark true")
            coreDataManager.unMarkImage(id: image.id)
        } else {
            print("is mark false")
            coreDataManager.markImage(image: image)
        }
        isMark = !isMark
    }
}
