//
//  Person.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import Foundation

class Person: Identifiable, Codable {
    var id: String?
    var name: String?
    var tel:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "kisi_id"
        case name = "kisi_name"
        case tel = "kisi_tel"
    }
    
    init() {
        
    }
    
    init(id: String, name: String, tel: String) {
        self.id = id
        self.name = name
        self.tel = tel
    }
}
