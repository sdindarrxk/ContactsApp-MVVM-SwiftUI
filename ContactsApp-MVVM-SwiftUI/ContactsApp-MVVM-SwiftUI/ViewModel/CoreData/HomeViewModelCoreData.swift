//
//  HomeViewModelCoreData.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import Foundation

class HomeViewModelCoreData: ObservableObject {
    @Published var persons = [PersonModel]()
    
    func loadPersons() {
        do {
            let list = try context.fetch(fetchRequest)
            persons = list
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func search(_ word: String) {
        do {
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS[c] %@", word)
            let list = try context.fetch(fetchRequest)
            persons = list
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(person: PersonModel) {
        context.delete(person)
        saveContext()
        loadPersons()
    }
}
