//
//  ShowResultsViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 09.11.2022.
//

import UIKit

final class ShowResultsViewController: UIViewController {
    
    var results: NumericalCharacteristics!
    
    @IBOutlet var resultsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = results.description
    }
}
