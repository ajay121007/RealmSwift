//
//  DBManager.swift
//  RealmSwift
//
//  Created by Admin on 02/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager {
    
    private var database:Realm
    static let sharedInstance = DBManager()
    
    private init() {
        
        database = try! Realm()
        
    }
   
    /*
    Get Save Data From DataBase
     */
    
    func getDataFromDB() -> Results<Item> {
        
        let results: Results<Item> = database.objects(Item.self)
        return results
    }
    
    /*
     Add Data In DataBase
     */
    
    func addData(object: Item) {
        
        try! database.write {
            database.add(object, update: false)
            print("Added new object")
        }
    }
    
    /*
     Add Data In DataBase At Particular Index

     */
    
    func updateData(object: Item) {
        
        try! database.write {
            database.add(object, update: true)
            print("updated object")
        }
    }
    
    /*
     Delete All Data From DataBase
     
     */
    
    func deleteAllDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
    /*
     Delete Data From DataBase At Particular Index
     
     */
    
    func deleteFromDb(object: Item) {
        
        try! database.write {
            
            database.delete(object)
        }
    }
    
}
