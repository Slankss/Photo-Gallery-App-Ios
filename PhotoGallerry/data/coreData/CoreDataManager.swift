//
//  CoreDataManager.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 2.04.2025.
//
import CoreData
import Foundation

class CoreDataManager {
    let context = persistentContainer.viewContext
    
    func getImages() -> [ImageEntity] {
        do{
            return try context.fetch(ImageEntity.fetchRequest())
        } catch{
            return []
        }
    }
    
    func getImage(id: Int) -> ImageEntity? {
        do{
            let fr = ImageEntity.fetchRequest()
            fr.predicate = NSPredicate(format: "id == %d", Int32(id))
            return try context.fetch(fr).first
        } catch{
            return nil
        }
    }
    
    func markImage(image: ImageContent){
        let imageEntity = ImageEntity(context: context)
        imageEntity.id = Int32(image.id)
        imageEntity.imageUrl = image.imageUrl
        imageEntity.tags = image.tags?.joined(separator: ",")
        imageEntity.user = image.user
        imageEntity.userImageUrl = image.userImageUrl
        imageEntity.pageUrl = image.pageUrl
        saveContext()
    }
    
    func unMarkImage(id: Int){
        let imageEntity = getImage(id: id)
        if imageEntity != nil{
            context.delete(imageEntity!)
            saveContext()
        }
    }
}
