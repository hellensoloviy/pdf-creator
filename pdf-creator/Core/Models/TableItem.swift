//
//  TableItem.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 11.05.2023.
//

import Foundation

/// Example struct for creating model we use in PDF Table
struct TableItem {
    
    let name: String
    let phoneNumber: String
    let address: String
    let id: Double
    let dateOfBirth: String

    init(name: String, phoneNumber: String, id: Double, address: String, dateOfBirth: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.address = address
        self.id = id
        self.dateOfBirth = dateOfBirth
    }
}
