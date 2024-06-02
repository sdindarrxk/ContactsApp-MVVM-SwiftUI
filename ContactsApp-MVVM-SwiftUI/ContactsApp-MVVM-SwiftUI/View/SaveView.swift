//
//  SaveView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct SaveView: View {
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var personName = ""
    @State fileprivate var personTel = ""
    
    var viewModel = SaveViewModelCoreData()
    
    var body: some View {
        VStack(spacing: 60) {
            TextField("Person Name",text: $personName)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Person Telephone NUmber",text: $personTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Save") {
                viewModel.save(name: personName, tel: personTel)
                dismiss()
            }
        }
        .navigationTitle("Save Person")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SaveView()
}
