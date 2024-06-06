//
//  DetailViewModelFirebase.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 6.06.2024.
//

import Foundation
import Firebase

class DetailViewModelFirebase {
    var ref = Database.database().reference().child("Kisiler")
    
    func update(id: String, name: String, tel: String) {
        let person = ["kisi_ad": name, "kisi_tel": tel]
        ref.child(id).updateChildValues(person)
        
    }
    
    func save(name: String, tel: String) {
        let person = ["kisi_id": "", "kisi_ad": name, "kisi_tel": tel]
        ref.childByAutoId().setValue(person)
    }
}
