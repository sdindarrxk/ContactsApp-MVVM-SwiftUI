//
//  HomeView.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

struct HomeView: View {
    @State fileprivate var searchingWord = ""
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.persons) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        PersonRow(person: person)
                    }
                }.onDelete(perform: delete)
            }.navigationTitle("Persons")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SaveView()) {
                            Image(systemName: "plus")
                        }
                    }
                }.onAppear{
                    viewModel.loadPersons()
                }
        }.searchable(text: $searchingWord, prompt: "Search")
            .onChange(of: searchingWord) { word in
                if word == "" {
                    viewModel.loadPersons()
                } else {
                    viewModel.search(word)
                }
            }
    }
    
    fileprivate func delete(at offsets: IndexSet) {
        let person = viewModel.persons[offsets.first!]
        viewModel.delete(id: person.id!)
    }

}

#Preview {
    HomeView()
}
