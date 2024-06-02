//
//  ContactsApp_MVVM_SwiftUIApp.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI
import CoreData

@main
struct ContactsApp_MVVM_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

let fetchRequest = PersonModel.fetchRequest()
let context = persistentContainer.viewContext

var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Model")
    container.loadPersistentStores { description, error in
        if let error {
            fatalError(error.localizedDescription)
        }
    }
        return container
}()

func saveContext() {
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
