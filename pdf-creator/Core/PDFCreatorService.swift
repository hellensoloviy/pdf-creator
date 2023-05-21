//
//  PDFCreatorService.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 21.05.2023.
//

import Foundation
import PDFKit

class PDFServiceBuilder {
    
    func generateDefaultPDF() -> PDFDocument? {
            
        /// Getting a mock data at the moment
        let items = MockDataGenrator().generateTableItemsForPDF()

        /// Generate a document from data
        let pdfCreator = PDFCreatorService(tableDataItems: items)
        let data = pdfCreator.create()
        
        let document = PDFDocument(data: data)
        return document
    }
    
}
