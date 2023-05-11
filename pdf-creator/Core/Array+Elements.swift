//
//  Array+Elements.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 11.05.2023.
//

import Foundation

extension Array {
    func chunkedElements(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
