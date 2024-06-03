//
//  PersonRow.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct PersonRow: View {
    // var person = PersonModel()
    var person = Person()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(person.name!).font(.system(size: 20))
            Text(person.tel!).font(.system(size: 16)).foregroundColor(.gray)
        }
    }
}

#Preview {
    PersonRow()
}
