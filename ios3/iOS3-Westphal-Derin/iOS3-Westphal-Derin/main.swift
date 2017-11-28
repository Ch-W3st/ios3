//
//  main.swift
//  iOS3-Westphal-Derin
//
//  Created by Christian Westphal on 28.11.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import Foundation

func createAddressCards(book: AddressBook){
    let testCards = [AddressCard( first_name: "Paul", surname: "Kalk", street: "MonkeyStreet", zip: 88888, city: "BerlinCrime" ), AddressCard( first_name: "Joni", surname: "Derin", street: "StylerStreet", zip: 6969, city: "DC" ), AddressCard( first_name: "Christian", surname: "Westphal", street: "HansaStreet", zip: 1234, city: "Rostock" )]
    for testCard in testCards {
        book.add(card: testCard)
    }
}

var book = AddressBook()
createAddressCards(book: book)
book.printLastNames()
book.sortBySurname()
book.printLastNames()

if let chris = book.searchBySurname(surname: "Westphal") {
    print(chris.first_name)
}

book.save(toFile: "/Users/chris/Desktop/ios/ios3/iOS3-Westphal-Derin/data.json")

print(AddressBook.addressBook(fromFile: "/Users/chris/Desktop/ios/ios3/iOS3-Westphal-Derin/data.json") )





