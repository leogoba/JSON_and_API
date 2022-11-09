//
//  ShowResultsViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 09.11.2022.
//

import UIKit

final class ShowResultsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var resultsLabel: UILabel!
    
    //MARK: - Public Properties
    var results: NumericalCharacteristics!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsLabel.text = results.description
    }
}
