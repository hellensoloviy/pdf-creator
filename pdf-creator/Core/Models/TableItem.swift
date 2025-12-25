//
//  TableItem.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 11.05.2023.
//

import Foundation


protocol PDFItemProtocol {
    var propertiesCount: Int { get set }
    var properties: [String] { get set }
    
}

struct PDFItem: PDFItemProtocol {
    
    var propertiesCount: Int
    var properties: [String]
    
}

/// Example struct for creating model we use in PDF Table
struct TableItem {
    
    let name: String
    let phoneNumber: String
    let address: String
    let id: Int
    let dateOfBirth: String

    init(name: String, phoneNumber: String, id: Int, address: String, dateOfBirth: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.address = address
        self.id = id
        self.dateOfBirth = dateOfBirth
    }
}
