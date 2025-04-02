//
//  Image.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 2.04.2025.
//

class ImageContent{
    var id:Int
    var pageUrl:String?
    var tags:[String]?
    var imageUrl:String?
    var user:String?
    var userImageUrl:String?
    
    init(
        id: Int,
        pageUrl: String? = nil,
        tags: String? = nil,
        imageUrl: String? = nil,
        user: String? = nil,
        userImageUrl: String? = nil
    ) {
        self.id = id
        self.pageUrl = pageUrl
        self.tags = tags?.trimmingCharacters(in: .whitespaces).split(separator: ",").map{ String($0) }
        self.imageUrl = imageUrl
        self.user = user
        self.userImageUrl = userImageUrl
    }
}
