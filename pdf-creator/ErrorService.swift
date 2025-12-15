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
         // Respond to the person's selection of the action.
        }
//        let cancelAction = UIAlertAction(title: "Disagree",
//                             style: .cancel) { (action) in
//         // Respond to the person's selection of the action.
//        }
        
        // Create and configure the alert controller.
        let alert = UIAlertController(title: "File not found",
              message: "Please check that there is a file uploaded or generate a new one",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
             
        presentingView.present(alert, animated: true) { /* nothing additional needed */}
        
    }
    
}
