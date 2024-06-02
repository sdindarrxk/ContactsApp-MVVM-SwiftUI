//
//  SaveViewModelCoreData.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import Foundation

class SaveViewModelCoreData {
    func save(name: String, tel: String) {
        let person = PersonModel(context: context)
        person.name = name
        person.tel = tel
        
        saveContext()
    }
}
