//
//  PDFService.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 11.05.2023.
//

import Foundation
import UIKit

/// Create a PDF with a table inside
final class PDFCreatorService: NSObject {
    private let defaultOffset: CGFloat = 20

    private let tableDataItems: [TableItem]
    
    /// Headers for our table
    private let headers: [String] = ["Number" , "Name" , "Phone number" , "Address", "DateOfBirth"]

    
    /// How many colums do we have
    let count = 5.0
    
    init(tableDataItems: [TableItem]) {
        self.tableDataItems = tableDataItems
    }

    func create() -> Data {
        
        /// Default page format
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: UIGraphicsPDFRendererFormat())

        let numberOfElementsPerPage = calculateNumberOfElementsPerPage(with: pageRect)
        let tableDataChunked: [[TableItem]] = tableDataItems.chunkedElements(into: numberOfElementsPerPage)

        let data = renderer.pdfData { context in
            for tableDataChunk in tableDataChunked {
                context.beginPage()
                let cgContext = context.cgContext
                drawTableHeaderRect(drawContext: cgContext, pageRect: pageRect)
                drawTableHeaderTitles(titles: headers, drawContext: cgContext, pageRect: pageRect)
                drawTableContentInnerBordersAndText(drawContext: cgContext, pageRect: pageRect, tableDataItems: tableDataChunk)
            }
        }
        return data
    }

    func calculateNumberOfElementsPerPage(with pageRect: CGRect) -> Int {
        let rowHeight = (defaultOffset * 3)
        let number = Int((pageRect.height - rowHeight) / rowHeight)
        return number
    }
    
}

// MARK: - Drawings
extension PDFCreatorService {
    
    func drawTableHeaderRect(drawContext: CGContext, pageRect: CGRect) {
        drawContext.saveGState()
        drawContext.setLineWidth(3.0)

        /// Drawing header's 1 top horizontal line
        drawContext.move(to: CGPoint(x: defaultOffset, y: defaultOffset))
        drawContext.addLine(to: CGPoint(x: pageRect.width - defaultOffset, y: defaultOffset))
        drawContext.strokePath()

        /// Drawing header's 1 bottom horizontal line
        drawContext.move(to: CGPoint(x: defaultOffset, y: defaultOffset * 3))
        drawContext.addLine(to: CGPoint(x: pageRect.width - defaultOffset, y: defaultOffset * 3))
        drawContext.strokePath()

        /// Drawing header's 5 vertical lines
        drawContext.setLineWidth(2.0)
        drawContext.saveGState()
        let tabWidth = (pageRect.width - defaultOffset * 2) / CGFloat(count)
        for verticalLineIndex in 0..<6 {
            let tabX = CGFloat(verticalLineIndex) * tabWidth
            drawContext.move(to: CGPoint(x: tabX + defaultOffset, y: defaultOffset))
            drawContext.addLine(to: CGPoint(x: tabX + defaultOffset, y: defaultOffset * 3))
            drawContext.strokePath()
        }

        drawContext.restoreGState()
    }

    func drawTableHeaderTitles(titles: [String], drawContext: CGContext, pageRect: CGRect) {
        
        /// Preparing title attributes
        let textFont = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byWordWrapping
        let titleAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
        ]

        /// Drawing titles
        let tabWidth = (pageRect.width - defaultOffset * 2) / count
        for titleIndex in 0..<titles.count {
            let attributedTitle = NSAttributedString(string: titles[titleIndex].capitalized, attributes: titleAttributes)
            let tabX = CGFloat(titleIndex) * tabWidth
            let textRect = CGRect(x: tabX + defaultOffset,
                                  y: defaultOffset * count / 3,
                                  width: tabWidth,
                                  height: defaultOffset * 4)
            attributedTitle.draw(in: textRect)
        }
    }

    func drawTableContentInnerBordersAndText(drawContext: CGContext, pageRect: CGRect, tableDataItems: [TableItem]) {
        drawContext.setLineWidth(1.0)
        drawContext.saveGState()

        let defaultStartY = defaultOffset * 3

        for elementIndex in 0..<tableDataItems.count {
            let yPosition = CGFloat(elementIndex) * defaultStartY + defaultStartY

            /// Draw content's elements texts
            let textFont = UIFont.systemFont(ofSize: 13.0, weight: .regular)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.lineBreakMode = .byWordWrapping
            let textAttributes = [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font: textFont
            ]
            
            let tabWidth = (pageRect.width - defaultOffset * 2) / count
            for titleIndex in 0..<5 {
                var attributedText = NSAttributedString(string: "", attributes: textAttributes)
                switch titleIndex {
                case 0: attributedText = NSAttributedString(string: String(format: "%.2f", tableDataItems[elementIndex].id), attributes: textAttributes)
                case 1: attributedText = NSAttributedString(string: tableDataItems[elementIndex].name, attributes: textAttributes)
                case 2: attributedText = NSAttributedString(string: tableDataItems[elementIndex].phoneNumber, attributes: textAttributes)
                case 3: attributedText = NSAttributedString(string: tableDataItems[elementIndex].address, attributes: textAttributes)
                case 4: attributedText = NSAttributedString(string: tableDataItems[elementIndex].dateOfBirth, attributes: textAttributes)

                default:
                    break
                }
                let tabX = CGFloat(titleIndex) * tabWidth
                let textRect = CGRect(x: tabX + defaultOffset,
                                      y: yPosition + defaultOffset,
                                      width: tabWidth,
                                      height: defaultOffset * count)
                attributedText.draw(in: textRect)
            }

            /// Drawing content's vertical lines
            for verticalLineIndex in 0..<6 {
                let tabX = CGFloat(verticalLineIndex) * tabWidth
                drawContext.move(to: CGPoint(x: tabX + defaultOffset, y: yPosition))
                drawContext.addLine(to: CGPoint(x: tabX + defaultOffset, y: yPosition + defaultStartY))
                drawContext.strokePath()
            }

            /// Drawing content's element bottom horizontal line
            drawContext.move(to: CGPoint(x: defaultOffset, y: yPosition + defaultStartY))
            drawContext.addLine(to: CGPoint(x: pageRect.width - defaultOffset, y: yPosition + defaultStartY))
            drawContext.strokePath()
        }
        drawContext.restoreGState()
    }
}
