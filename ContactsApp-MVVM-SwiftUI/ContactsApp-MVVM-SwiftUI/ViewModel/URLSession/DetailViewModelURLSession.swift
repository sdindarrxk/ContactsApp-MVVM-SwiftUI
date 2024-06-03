//
//  DetailViewModelURLSession.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

class DetailViewModelURLSession {
    func update(id: String, name: String, tel: String) {
        let urlString = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php"
        guard let url = URL(string: urlString) else { return }
        let postString = "kisi_id=\(id)&kisi_ad=\(name)&kisi_tel=\(tel)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let _ = self, let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(BaseResponse.self, from: data)
                print(response.message ?? "")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func save(name: String, tel: String) {
        let urlString = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php?kisi_ad=\(name)&kisi_tel=\(tel)"
        guard let url = URL(string: urlString) else { return }
        let postString = "kisi_ad=\(name)&kisi_tel=\(tel)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let _ = self, let data = data else { return }
            
            do {
                let response = try JSONDecoder().decode(BaseResponse.self, from: data)
                print(response.message ?? "")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
