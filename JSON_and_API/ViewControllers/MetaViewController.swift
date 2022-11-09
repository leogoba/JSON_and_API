//
//  MetaViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 09.11.2022.
//

import UIKit

class MetaViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var metaLabel: UILabel!
    
    //MARK: - Public Properties
    var meta: GeneralСharacteristics!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        metaLabel.text = meta.description
    }
    
    //MARK: - IB Actions
    @IBAction func showResultButtonTapped() {
        performSegue(withIdentifier: "showResults", sender: nil)
    }
    
     //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let showResultsVC = segue.destination as? ShowResultsViewController else { return }
        showResultsVC.results = meta.results
    }
}
