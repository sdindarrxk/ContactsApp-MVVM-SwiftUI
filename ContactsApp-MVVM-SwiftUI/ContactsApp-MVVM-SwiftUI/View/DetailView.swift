//
//  DetailView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var personName = ""
    @State fileprivate var personTel = ""
    
    // var person: PersonModel
    var person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Person Name")
                    .font(.title)
                    .bold()
                Text(personName)
                    .font(.title2)
                    .foregroundColor(.red)
            }.padding()
            VStack(alignment: .leading) {
                Text("Person Telephone Number")
                    .font(.title)
                    .bold()
                Text(personTel)
                    .font(.title2)
                    .foregroundColor(.red)
            }.padding()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SaveView(buttonType: .update, person: person)) {
                    Text("Update")
                }
            }
        }
        .navigationTitle("Person Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            prepareUI()
        }
    }
    
    fileprivate func prepareUI() {
        personName = person.name ?? ""
        personTel = person.tel ?? ""
    }
}
