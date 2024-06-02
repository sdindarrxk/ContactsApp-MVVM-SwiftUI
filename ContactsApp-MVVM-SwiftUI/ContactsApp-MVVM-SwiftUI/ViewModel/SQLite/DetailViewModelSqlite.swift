//
//  DetailViewModel.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

class DetailViewModelSqlite {
    let db: FMDatabase?
    
    init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destPath = URL(fileURLWithPath: dbPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: destPath.path)
    }
    
    func update(id: UUID, name: String, tel: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [name, tel, id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
