//
//  ErrorService.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 15.12.2025.
//

import UIKit

struct ErrorService {
    
    func presentDocumentNotFound(on presentingView: UIViewController) {
        
        let defaultAction = UIAlertAction(title: "OK",
                             style: .default) { (action) in
            /* nothing additional needed */
        }

        let alert = UIAlertController(title: "File not found",
              message: "Please check that there is a file uploaded or generate a new one",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
             
        presentingView.present(alert, animated: true) { /* nothing additional needed */ }
        
    }
    
    func presentDocumentGenerationFailed(on presentingView: UIViewController) {
        
        let defaultAction = UIAlertAction(title: "OK",
                             style: .default) { (action) in
            /* nothing additional needed */
        }

        let alert = UIAlertController(title: "File not generated",
              message: "Oops. File was not generated.",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
             
        presentingView.present(alert, animated: true) { /* nothing additional needed */ }
        
    }
    
    func presentDocumentExportError(on presentingView: UIViewController) {
        
        let defaultAction = UIAlertAction(title: "OK",
                             style: .default) { (action) in
            /* nothing additional needed */
        }

        let alert = UIAlertController(title: "Error with file",
              message: "Not possible to share. Please check if the file exists.",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
             
        presentingView.present(alert, animated: true) { /* nothing additional needed */ }
        
    }
    
}
