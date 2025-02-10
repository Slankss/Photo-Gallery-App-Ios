//
//  PhotoDao.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 7.02.2025.
//
import Foundation

class ImageDao {
    
    let BASE_URL = "https://pixabay.com/api/"
    let API_KEY = "48294149-9e5d9aec4e5a24e180366df48"
    
    func getImages(page:Int = 1, per_page:Int = 3, filter:[String:String?]? = nil,query:String? = nil) async throws -> ImageResponse{
        do {
        var components = URLComponents(string:BASE_URL)!
        components.queryItems = [
            URLQueryItem(name:"key", value:API_KEY),
            URLQueryItem(name:"page", value:String(page)),
            URLQueryItem(name:"per_page", value: String(per_page))
        ]
    
        if let filter = filter {
            for (key, value) in filter {
                if let value = value {
                    components.queryItems?.append(URLQueryItem(name:key,value:value))
                }
            }
        }
            
        if let query = query {
            components.queryItems?.append(URLQueryItem(name:"q",value:query))
        }
       
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(ImageResponse.self, from: data)
    
        return result
        } catch {
            throw error
        }
    }
}
