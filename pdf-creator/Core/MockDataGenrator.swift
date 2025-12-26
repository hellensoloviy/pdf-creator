//
//  MockDataGenrator.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 21.05.2023.
//

import Foundation

struct MockDataGenrator {
    
    /// Add possibility to generate with needed amount of columns 
    func generateTableItemsForPDF(headers: [String]) -> [PDFItemProtocol] {
                
        var data = [String]()

        var result = [PDFItemProtocol]()
        
        headers.forEach { name in
            data.append("#000")
        }
        
        headers.forEach { name in
            let item = PDFItem(propertiesCount: headers.count, properties: data)
            result.append(item)
        }
        
        return result
        
    }
    
    
    /// Old variant with mocck data
    func generateTableItemsForPDF() -> [TableItem] {
        
        let names = ["Michael", "Christopher", "Jessica", "Matthew", "Ashley", "Jennifer", "Joshua", "Amanda", "Daniel", "David", "James", "Robert", "John", "Joseph", "Andrew", "Ryan", "Brandon", "Jason", "Justin", "Sarah", "William"]
        let numbers = ["+380634035388", "+380634437388", "+380631235389", "+380634455898", "+380684835382", "+380734185778", "+380734585171", "+380126755811", "+380630355148", "+380449555108", "+380114555108", "+380413865108", "+380449715874", "+380669973102", "+380429525674", "+380443565987", "+380630355146", "+380634355148", "+380630352818", "+380620125178", "+380833323347"]
        let addresses = ["Kyiv", "Kyiv", "Rome", "London", "Hawaii", "New York", "London", "Berlin", "London", "Rome", "Los Angeles", "Berlin", "Berlin", "Kyiv", "Andrew", "Rome", "Rome", "Los Angeles", "Hawaii", "Berlin", "London"]
        let dateOfBirth = ["12/12/1996", "12/02/1995", "10/10/1988", "11/08/1966", "22/07/1998", "30/04/1989", "01/03/1977", "14/07/1999", "30/11/1984", "02/08/1975", "24/09/1991", "10/06/2002", "15/10/1981", "16/12/1982", "19/01/1999", "13/05/1985", "21/01/1976", "01/04/1991", "22/02/1988", "31/05/1970", "02/12/1997"]

        var result = [TableItem]()
        var index = 0
        names.forEach { name in
            let item = TableItem(name: name, phoneNumber: numbers[index], id: index, address: addresses[index], dateOfBirth: dateOfBirth[index])
            result.append(item)
            index += 1
        }
        
        return result
    }
    
}
