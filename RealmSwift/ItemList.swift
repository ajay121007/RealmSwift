//
//  Item.swift
//  RealmSwift
//
//  Created by Admin on 02/09/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import RealmSwift

class Item: Object {
    
    dynamic var ID = -1
    dynamic var textString = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
}
