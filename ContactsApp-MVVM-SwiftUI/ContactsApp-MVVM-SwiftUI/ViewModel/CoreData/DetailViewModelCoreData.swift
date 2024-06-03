//
//  DetailViewModelCoreData.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import Foundation

class DetailViewModelCoreData {
    func update(person: PersonModel, name: String, tel: String) {
        person.name = name
        person.tel = tel
        saveContext()
    }
    
    func save(name: String, tel: String) {
        let person = PersonModel(context: context)
        person.name = name
        person.tel = tel
        saveContext()
    }
}
