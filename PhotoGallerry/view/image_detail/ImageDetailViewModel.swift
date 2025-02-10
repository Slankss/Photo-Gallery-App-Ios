//
//  PhotoDetailViewModel.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 9.02.2025.
//
import Foundation
class ImageDetailViewModel: ObservableObject {
    
    var fileService:FileService
    
    init() {
        self.fileService = FileService()
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
}
