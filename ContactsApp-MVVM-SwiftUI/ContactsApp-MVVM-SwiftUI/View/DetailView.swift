//
//  DetailView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct DetailView: View {
    @State fileprivate var personName = ""
    @State fileprivate var personTel = ""
    
    var person = Person()
    
    var viewModel = DetailViewModelSqlite()
    
    var body: some View {
        VStack(spacing: 60) {
            TextField("Person Name" ,text: $personName)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Person Telephone NUmber", text: $personTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("Update") {
                viewModel.update(id: person.id ?? "", name: personName, tel: personTel)
            }
        }.navigationTitle("Person Detail")
            .onAppear {
                prepareUI()
            }
    }
    
    fileprivate func prepareUI() {
        personName = person.name ?? ""
        personTel =  person.tel ?? ""
    }
}

#Preview {
    DetailView()
}
