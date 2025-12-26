//
//  PDFCreatorService.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 21.05.2023.
//

import Foundation
import PDFKit

class PDFServiceBuilder {

    func generatePDF(with countToGenerate: Int) -> PDFDocument? {
        
        /// Mock headers so that for distinguish and presentability
        let mockHeaders = ["Number" , "Name" , "Phone number" , "Address", "DateOfBirth", "F/M", "Age", "Experience"]
        
        /// Getting needed amount of headers
        let headers = Array(mockHeaders.dropLast(mockHeaders.count - countToGenerate))
        
        /// Getting a mock data at the moment
        let items = MockDataGenrator().generateTableItemsForPDF(headers: headers)
        let template = PDFTemplateData(items: items, headers: headers)

        /// Generate a document from data
        let pdfCreator = PDFCreatorService(items: template)
        let data = pdfCreator.create()
        
        let document = PDFDocument(data: data)
        return document
    }
    
    func generateDefaultPDF() -> PDFDocument? {
        
        let headers = ["Number" , "Name" , "Phone number" , "Address", "DateOfBirth"]
                
        /// Getting a mock data at the moment
        let items = MockDataGenrator().generateTableItemsForPDF()
        let template = PDFTemplateData(items: items, headers: headers)

        /// Generate a document from data
        let pdfCreator = PDFCreatorService(items: template)
        let data = pdfCreator.create()
        
        let document = PDFDocument(data: data)
        return document
    }
    
}
