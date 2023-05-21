//
//  FilePresenterViewController.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 16.05.2023.
//

import Foundation
import UIKit
import PDFKit

class FilePresenterViewController: UIViewController {
    static let identifier = "FilePresenterViewController"
    
    enum State {
        case fromFile
        case fromBase64
    }

    @IBOutlet weak var presentationView: PDFView!
    
    var PDFToShow: PDFDocument?
        
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PDF presentation"
        
        loadPDFToShow()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    // MARK: -
    private func loadPDFToShow() {
        // TODO: --
    }
}
