//
//  PhotoResponse.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 7.02.2025.
//

class ImageResponseDto: Codable {
    var total:Int?
    var totalHits:Int?
    var hits:[ImageDto]?
}
