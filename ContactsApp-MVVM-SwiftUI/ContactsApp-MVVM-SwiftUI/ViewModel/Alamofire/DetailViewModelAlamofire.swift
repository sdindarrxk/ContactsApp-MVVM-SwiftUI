//
//  DetailViewModelAlamofire.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 6.06.2024.
//

import Foundation
import Alamofire

class DetailViewModelAlamofire {
    func update(id: String, name: String, tel: String) {
        let url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php"
        
        let params = [
            "kisi_id": id,
            "kisi_ad": name,
            "kisi_tel": tel
        ]
        
        AF.request(url, method: .post, parameters: params).response { [weak self] response in
            guard let _ = self, let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(BaseResponse.self, from: data)
                DispatchQueue.main.async {
                    print(response.message)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func save(name: String, tel: String) {
        let url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php"
        
        let params = [
            "kisi_ad": name,
            "kisi_tel": tel
        ]
        
        AF.request(url, method: .post, parameters: params).response { [weak self] response in
            guard let _ = self, let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(BaseResponse.self, from: data)
                DispatchQueue.main.async {
                    print(response.message)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
