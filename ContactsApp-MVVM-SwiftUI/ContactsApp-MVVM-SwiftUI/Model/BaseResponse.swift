//
//  BaseResponse.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 3.06.2024.
//

import Foundation

class BaseResponse: Codable {
    let success: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
    }
}
