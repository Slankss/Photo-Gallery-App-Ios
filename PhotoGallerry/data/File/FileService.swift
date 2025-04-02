//
//  FileManager.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 10.02.2025.
//
import Foundation

class FileService {
    
    func downloadImage(url:String){
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.downloadTask(with:url) { tempUrl, response, error in
            guard let tempUrl = tempUrl, error == nil else {
                return
            }
            
            do{
                let fileManager = FileManager.default
                let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                let destinationUrl = documentsDirectory.appendingPathComponent(url.lastPathComponent)
                
                if fileManager.fileExists(atPath: destinationUrl.path){
                    try fileManager.removeItem(at: destinationUrl)
                }
                
                try fileManager.moveItem(at: tempUrl, to: destinationUrl)
                
            } catch{
                print(error)
            }
        }
        task.resume()
    }
    
}
