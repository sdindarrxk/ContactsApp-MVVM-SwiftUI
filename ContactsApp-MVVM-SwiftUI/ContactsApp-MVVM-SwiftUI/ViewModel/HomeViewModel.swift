//
//  HomeViewModel.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import UIKit

class HomeViewModel: ObservableObject {
    @Published var persons = [Person]()
    
    func loadPersons() {
        
    }
    
    func search(_ word: String) {
        
    }
    
    func delete(id: String) {
        
    }
}
