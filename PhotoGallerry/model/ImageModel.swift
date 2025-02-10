//
//  Photo.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 7.02.2025.
//
class ImageModel: Codable {
    var id:Int?
    var pageURL:String?
    var type:String?
    var tags:String?
    var previewURL:String?
    var previewWidth:Int?
    var previewHeight:Int?
    var webformatURL:String?
    var webFormatWidth:Int?
    var webFormatHeight:Int?
    var largeImageURL:String?
    var imageWidth:Int?
    var imageHeight:Int?
    var imageSize:Int?
    var views:Int?
    var downloads:Int?
    var collections:Int?
    var likes:Int?
    var comments:Int?
    var user_id:Int?
    var user:String?
    var userImageURL:String?
    
    init(id: Int? = nil, pageURL: String? = nil, type: String? = nil, tags: String? = nil, previewURL: String? = nil, previewWidth: Int? = nil, previewHeight: Int? = nil, webformatURL: String? = nil, webFormatWidth: Int? = nil, webFormatHeight: Int? = nil, largeImageURL: String? = nil, imageWidth: Int? = nil, imageHeight: Int? = nil, imageSize: Int? = nil, views: Int? = nil, downloads: Int? = nil, collections: Int? = nil, likes: Int? = nil, comments: Int? = nil, user_id: Int? = nil, user: String? = nil, userImageURL: String? = nil) {
        self.id = id
        self.pageURL = pageURL
        self.type = type
        self.tags = tags
        self.previewURL = previewURL
        self.previewWidth = previewWidth
        self.previewHeight = previewHeight
        self.webformatURL = webformatURL
        self.webFormatWidth = webFormatWidth
        self.webFormatHeight = webFormatHeight
        self.largeImageURL = largeImageURL
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.imageSize = imageSize
        self.views = views
        self.downloads = downloads
        self.collections = collections
        self.likes = likes
        self.comments = comments
        self.user_id = user_id
        self.user = user
        self.userImageURL = userImageURL
    }
}
