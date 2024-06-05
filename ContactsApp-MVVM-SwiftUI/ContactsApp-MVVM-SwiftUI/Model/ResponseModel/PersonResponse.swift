//
//  PersonResponse.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 3.06.2024.
//

import Foundation

class PersonResponse: Codable {
    var list: [Person]?
    var success: Int?
    
    enum CodingKeys: String, CodingKey {
        case list = "kisiler"
        case success
    }
}
