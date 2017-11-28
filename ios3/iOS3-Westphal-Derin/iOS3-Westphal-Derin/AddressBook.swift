//
//  AddressBook.swift
//  iOS3-Westphal-Derin
//
//  Created by Christian Westphal on 28.11.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import Foundation

class AddressBook: Codable {
   
    var addressCards = [AddressCard]()
    
    func add(card: AddressCard){
        addressCards.append(card)
    }
    
    func remove(card: AddressCard){
        if let index = addressCards.index(of: card) {
            addressCards.remove(at: index)
        }
        for addressCard in addressCards{
            if let index = addressCard.friends.index(of: card) {
                addressCard.friends.remove(at: index)
            }
        }
    }
    
    func sortBySurname(){
        addressCards.sort { $0.surname < $1.surname }
    }
    
    func searchBySurname(surname: String) -> AddressCard? {
        for addressCard in addressCards {
            if surname == addressCard.surname {
                return addressCard
            }
        }
        return nil
    }
   
    func save(toFile path: String) {
        let url = URL(fileURLWithPath: path)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self.addressCards) {
            try? data.write(to: url)
        }
    }
    
    class func addressBook(fromFile path: String) -> AddressBook? {
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let addressBook = try? decoder.decode(AddressBook.self, from: data) {
                return addressBook
            }
        }
        return nil
    }
    
    func printLastNames(){
        for card in addressCards {
            print(card.surname)
            print(card.first_name)
            print(card.street)
            print(card.zip)
            print(card.city)
            print("########################")
        }
    }
    
}
