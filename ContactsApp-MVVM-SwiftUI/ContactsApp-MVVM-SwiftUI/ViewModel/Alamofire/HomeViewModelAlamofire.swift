//
//  HomeViewModelAlamofire.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 6.06.2024.
//

import Foundation
import Alamofire

class HomeViewModelAlamofire: ObservableObject {
    @Published var persons = [Person]()
    @Published var isSearching: Bool = false
    @Published var noResults: Bool = false
    
    func loadPersons() {
        let url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php"
        
        AF.request(url, method: .get).response { [weak self] response in
            guard let self = self, let data = response.data else { return }
            
            do {
                let response = try JSONDecoder().decode(PersonResponse.self, from: data)
                guard let list = response.list else { return }
                DispatchQueue.main.async {
                    self.persons = list
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func search(_ word: String) {
        isSearching = true
        let url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php"
        
        let params = ["kisi_ad": word]
        
        AF.request(url, method: .post, parameters: params).response { [weak self] response in
            guard let self = self, let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(PersonResponse.self, from: data)
                guard let list = response.list else { return }
                DispatchQueue.main.async {
                    self.persons = list
                }
            } catch {
                noResults = true
                print(error.localizedDescription)
            }   
            isSearching = false
        }
    }
    
    func delete(id: String) {
        let url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php"
        
        let params = ["kisi_id": id]
        
        AF.request(url, method: .post, parameters: params).response { [weak self] response in
            guard let self = self, let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(BaseResponse.self, from: data)
                DispatchQueue.main.async {
                    print(response.message)
                }
                self.loadPersons()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
