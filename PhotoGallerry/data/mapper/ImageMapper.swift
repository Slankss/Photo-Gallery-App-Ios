//
//  ImageMapper.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 2.04.2025.
//

extension ImageDto {
    func toImageContent() -> ImageContent {
        return ImageContent(
            id: id,
            pageUrl: pageURL,
            tags: tags,
            imageUrl: webformatURL,
            user: user,
            userImageUrl: userImageURL
        )
    }
}

extension ImageEntity {
    func toImageContent() -> ImageContent {
        return ImageContent(
            id: Int(id),
            pageUrl: pageUrl,
            tags: tags,
            imageUrl: imageUrl,
            user: user,
            userImageUrl: userImageUrl
        )
    }
}
