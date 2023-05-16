//
//  MainViewController.swift
//  pdf-creator
//
//  Created by Hellen Soloviy on 11.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    private let reusableCellsID = "actions"

    @IBOutlet weak var tableView: UITableView!
    
    private let actions = ["Show generated PDF", "Share generated PDF"]
    private let subActions = ["Show PDF from base64"] // TODO - 
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "PDF creator"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: reusableCellsID)
        
        var content = cell.defaultContentConfiguration()
        content.text = actions[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }
        
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: FilePresenterViewController.identifier) as! FilePresenterViewController
            self.navigationController?.show(vc, sender: nil)
        default:
            fatalError("To be implemented") // TODO: -
        }

    }
}
