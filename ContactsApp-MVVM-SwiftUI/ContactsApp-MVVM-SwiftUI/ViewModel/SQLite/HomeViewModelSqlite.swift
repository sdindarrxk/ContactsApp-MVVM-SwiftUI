//
//  HomeViewModel.swift
//  ContactsApp-MVVM-SwiftUI
//
//  Created by Sabri DİNDAR on 2.06.2024.
//

import SwiftUI

class HomeViewModelSqlite: ObservableObject {
    @Published var persons = [Person]()
    
    let db: FMDatabase?
    
    init() {
        let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destPath = URL(fileURLWithPath: dbPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: destPath.path)
    }
    
    func loadPersons() {
        db?.open()
        
        var list = [Person]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "kisi_id")!)!
                let name = result.string(forColumn: "kisi_ad")!
                let tel = result.string(forColumn: "kisi_tel")!
                
                let person = Person(id: id, name: name, tel: tel)
                list.append(person)
            }
            
            persons = list
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func search(_ word: String) {
        db?.open()
        
        var list = [Person]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE name like ?", values: ["%\(word)%"])
            
            while result.next() {
                let id = Int(result.string(forColumn: "id")!)!
                let name = result.string(forColumn: "name")!
                let tel = result.string(forColumn: "tel")!
                
                let person = Person(id: id, name: name, tel: tel)
                list.append(person)
            }
            
            persons = list
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func delete(id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [id])
            loadPersons()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
