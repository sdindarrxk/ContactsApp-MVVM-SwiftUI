//
//  ContactsApp_MVVM_SwiftUIApp.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI
import CoreData
import FirebaseCore

@main
struct ContactsApp_MVVM_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
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
