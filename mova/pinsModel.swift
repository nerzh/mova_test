//
//  pinsModel.swift
//  mova
//
//  Created by Oleg Gudejchuk on 22.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class PinsModel : Object {
    dynamic var id         : Int     = 0
    dynamic var latitude   : Float   = 0
    dynamic var longitude  : Float   = 0
    dynamic var titleText  : String  = ""
    dynamic var bottomText : String  = ""
    dynamic var photo      : String  = ""
    
    required init() {
        super.init()
        
        //      DON'T WORK =(  WTF! NSURLSession/NSURLConnection HTTP load failed (kCFStreamErrorDomainSSL, -9806)
        //      id = RealmSettings.autoIncrement(PinsModel.self)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    
    //    MARK: required inits
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
