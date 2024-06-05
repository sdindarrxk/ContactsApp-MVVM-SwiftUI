//
//  SaveView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI
enum ButtonType {
    case save
    case update
    
    func getButtonStrings() -> (String, String) {
        switch self {
            case .save:
                return ("Save", "Save Person")
            case .update:
                return ("Update", "Update Person")
        }
    }
}

struct SaveView: View {
    @Environment(\.dismiss) var dismiss
    
    var buttonName: String
    var navigationTitle: String
    
    // @State var person: PersonModel?
     @State var person: Person?
    
    @State fileprivate var personName = ""
    @State fileprivate var personTel = ""
    
    var viewModel = DetailViewModelAlamofire()
    
    init(buttonType: ButtonType, person: Person? = nil) {
        let type = buttonType.getButtonStrings()
        self.buttonName = type.0
        self.navigationTitle = type.1
        self._person = State(initialValue: person)
    }
    
    var body: some View {
        VStack(spacing: 60) {
            TextField("Person Name",text: $personName)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Person Telephone Number",text: $personTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(buttonName) {
                if buttonName == "Save" {
                    viewModel.save(name: personName, tel: personTel)
                } else {
                    if let person = person {
                        // viewModel.update(person: person, name: personName, tel: personTel)
                        viewModel.update(id: person.id ?? "", name: personName, tel: personTel)
                    }
                }
                dismiss()
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            prepareUI()
        }
    }
    
    fileprivate func prepareUI() {
        if let person = person {
            personName = person.name ?? ""
            personTel = person.tel ?? ""
        }
    }
}
