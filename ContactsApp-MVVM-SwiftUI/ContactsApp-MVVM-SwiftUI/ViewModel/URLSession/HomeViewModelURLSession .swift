//
//  HomeViewModelURLSession .swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import Foundation

class HomeViewModelURLSession: ObservableObject {
    @Published var persons = [Person]()
    @Published var isSearching: Bool = false
    @Published var noResults: Bool = false
    
    func loadPersons() {
        guard let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(PersonResponse.self, from: data)
                if let list = response.list {
                    DispatchQueue.main.async {
                        self.persons = list
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func search(_ word: String) {
        isSearching = true
        guard let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php") else { return }
        let postString = "kisi_ad=\(word)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(PersonResponse.self, from: data)
                if let list = response.list {
                    DispatchQueue.main.async {
                        self.persons = list
                    }
                }
            } catch {
                print(error.localizedDescription)
                noResults = true
            }
        }.resume()
        isSearching = false
    }
    
    func delete(id: String) {
        let urlString = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php"
        guard let url = URL(string: urlString) else { return }
        let postString = "kisi_id=\(id)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self, let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(BaseResponse.self, from: data)
                self.loadPersons()
                print(response.message!)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
