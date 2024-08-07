//
//  HomeView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct HomeView: View {
    @State fileprivate var searchingWord = ""
    @ObservedObject var viewModel = HomeViewModelFirebase()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.persons) { person in
                        NavigationLink(destination: DetailView(person: person)) {
                            PersonRow(person: person)
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Persons")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SaveView(buttonType: .save)) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                viewModel.loadPersons()
            }
        }
        .searchable(text: $searchingWord, prompt: "Search")
        .onChange(of: searchingWord) { word in
            if !word.isEmpty {
                viewModel.search(word)
            } else {
                viewModel.loadPersons()
            }
        }
        .onSubmit(of: .search) {
            viewModel.search(searchingWord)
        }
    }
    
    fileprivate func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let person = viewModel.persons[index]
            // viewModel.delete(person: person)
            viewModel.delete(id: person.id ?? "")
        }
    }
}

#Preview {
    HomeView()
}
