//
//  HomeViewModelFirebase.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 6.06.2024.
//

import Foundation
import Firebase

class HomeViewModelFirebase: ObservableObject {
    @Published var persons = [Person]()
    var ref = Database.database().reference().child("Kisiler")
    
    func loadPersons() {
        ref.observe(.value) { snapshot in
            var list = [Person]()
            
            if let datum = snapshot.value as? [String: AnyObject] {
                for data in datum {
                    if let dict = data.value as? NSDictionary {
                        let id = data.key
                        let name = dict["kisi_ad"] as? String ?? ""
                        let tel = dict["kisi_tel"] as? String ?? ""
                        
                        let person = Person(id: id, name: name, tel: tel)
                        list.append(person)
                    }
                }
            }
            DispatchQueue.main.async {
                self.persons = list
            }
        }
    }
    
    func search(_ word: String) {
        ref.observe(.value) { snapshot in
            var list = [Person]()
            
            if let datum = snapshot.value as? [String: AnyObject] {
                for data in datum {
                    if let dict = data.value as? NSDictionary {
                        let id = data.key
                        let name = dict["kisi_ad"] as? String ?? ""
                        let tel = dict["kisi_tel"] as? String ?? ""
                        
                        if name.lowercased().contains(word.lowercased()) {
                            let person = Person(id: id, name: name, tel: tel)
                            list.append(person)
                        }
                    }
                }
            }
            DispatchQueue.main.async {
                self.persons = list
            }
        }
    }
    
    func delete(id: String) {
        ref.child(id).removeValue()
    }
}
