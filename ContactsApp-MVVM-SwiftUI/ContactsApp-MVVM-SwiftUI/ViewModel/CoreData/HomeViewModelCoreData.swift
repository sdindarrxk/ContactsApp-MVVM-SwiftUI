//
//  HomeViewModelCoreData.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import Foundation

class HomeViewModelCoreData: ObservableObject {
    @Published var persons = [PersonModel]()
    @Published var isSearching: Bool = false
    @Published var noResults: Bool = false
    
    func loadPersons() {
        do {
            let list = try context.fetch(fetchRequest)
            persons = list
            noResults = persons.isEmpty
        } catch {
            print(error.localizedDescription)
            noResults = true
        }
    }
    
    func search(_ word: String) {
        isSearching = true
        do {
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS[c] %@", word)
            let list = try context.fetch(fetchRequest)
            persons = list
            noResults = list.isEmpty
        } catch {
            print(error.localizedDescription)
            noResults = true
        }
        isSearching = false
    }
    
    func delete(person: PersonModel) {
        context.delete(person)
        saveContext()
        loadPersons()
    }
}
