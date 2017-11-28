//
//  AddressCard.swift
//  iOS3-Westphal-Derin
//
//  Created by Christian Westphal on 28.11.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import Foundation

class AddressCard :NSObject & Codable & Equatable & NSCoding {
    
    var first_name = ""
    var surname = ""
    var street = ""
    var zip = 0
    var city = ""
    var hobbies = [String]()
    var friends = [AddressCard]()
    
    init(first_name: String, surname: String, street: String, zip: Int, city: String) {
        self.first_name = first_name
        self.surname = surname
        self.street = street
        self.zip = zip
        self.city = city
    }
    
    required init(coder decoder: NSCoder) {
        if let str = decoder.decodeObject(forKey: "first_name") as? String{
            first_name = str
        }
        if let str = decoder.decodeObject(forKey: "surname") as? String{
            surname = str
        }
        if let str = decoder.decodeObject(forKey: "street") as? String{
            street = str
        }
        if let str = decoder.decodeInteger(forKey: "zip") as? Int{
            zip = str
        }
        if let str = decoder.decodeObject(forKey: "city") as? String{
            city = str
        }
    }
    
    func encode(with coder : NSCoder) {
        coder.encode(first_name, forKey: "first_name")
        coder.encode(surname, forKey: "surname")
        coder.encode(street, forKey: "street")
        coder.encode(zip, forKey: "zip")
        coder.encode(city, forKey: "city")
    }
    static func ==(lhs: AddressCard, rhs: AddressCard) -> Bool {
        return lhs.first_name == rhs.first_name
    }
    
    

}


