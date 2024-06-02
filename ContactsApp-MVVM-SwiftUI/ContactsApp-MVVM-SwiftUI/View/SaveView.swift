//
//  SaveView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct SaveView: View {
    @State fileprivate var personName = ""
    @State fileprivate var personTel = ""
    
    var viewModel = SaveViewModel()
    
    var body: some View {
        VStack(spacing: 60) {
            TextField("Person Name",text: $personName)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Person Telephone NUmber",text: $personTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Save") {
                viewModel.save(name: personName, tel: personTel)
            }
        }.navigationTitle("Save Person")
    }
}

#Preview {
    SaveView()
}
