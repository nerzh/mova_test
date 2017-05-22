//
//  RealmSettings.swift
//  mova
//
//  Created by Oleg Gudejchuk on 22.05.17.
//  Copyright © 2017 Oleg Gudejchuk. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RealmSettings {
    
    static let versionOfMigration : UInt64 = 3
    
    class func settings() {
        getMigration()
        setDataTest()
//        clearRealm()
    }
    
    
    //    DON'T WORK =(
    //    class func autoIncrement(_ of: Object.Type) -> Int {
    //        let realm = try! Realm()
    //        return (realm.objects(of).max(ofProperty: "id") as Int? ?? 0) + 1
    //    }
    
    
    private class func getMigration() {
        
        let config = Realm.Configuration(
            schemaVersion: versionOfMigration,
            migrationBlock: { migration, oldSchemaVersion in
                
                if (oldSchemaVersion < versionOfMigration) { }
        })
        Realm.Configuration.defaultConfiguration = config
        
        _ = try! Realm()
    }
    
    private class func setDataTest() {
        let realm = try! Realm()
        
        func save(_ object: PinsModel) {
            try! realm.write {
                realm.add(object)
            }
        }
        
        if (realm.objects(PinsModel.self).count == 0) {
            
            let pin1        = PinsModel.init()
            pin1.id         = (realm.objects(PinsModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
            pin1.latitude   = 50.41
            pin1.longitude  = 30.51
            pin1.titleText  = "Title Text One"
            pin1.bottomText = "Bottom Text One"
            pin1.photo      = "dataPin"
//            pin1.photo      = NSData(data: UIImageJPEGRepresentation(UIImage.init(named: "dataPin")!, 0.9)!)
            save(pin1)
            
            let pin2        = PinsModel.init()
            pin2.id         = (realm.objects(PinsModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
            pin2.latitude   = 50.40
            pin2.longitude  = 30.50
            pin2.titleText  = "Title Text Two"
            pin2.bottomText = "Bottom Text Two"
            pin2.photo      = "dataPin"
//            pin2.photo      = NSData(data: UIImageJPEGRepresentation(UIImage.init(named: "dataPin")!, 0.9)!)
            save(pin2)
            
            let pin3        = PinsModel.init()
            pin3.id         = (realm.objects(PinsModel.self).max(ofProperty: "id") as Int? ?? 0) + 1
            pin3.latitude   = 50.39
            pin3.longitude  = 30.52
            pin3.titleText  = "Title Text Three"
            pin3.bottomText = "Bottom Text Three"
            pin3.photo      = "dataPin"
//            pin3.photo      = NSData(data: UIImageJPEGRepresentation(UIImage.init(named: "dataPin")!, 0.9)!)
            save(pin3)
        }
    }
    
    private class func clearRealm() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
