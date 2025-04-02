//
//  PhotoGallerryApp.swift
//  PhotoGallerry
//
//  Created by Okan Kukul on 3.02.2025.
//

import SwiftUI
import CoreData

@main
struct PhotoGallerryApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                // Home View
                NavigationView {
                    ImageListView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                // Profile View
                NavigationView {
                    MarksView()
                }
                .tabItem {
                    Image(systemName: "photo.stack")
                    Text("Marks")
                }
            }
            
        }
    }
}

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "PhotoDb")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    return container
}()

func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
