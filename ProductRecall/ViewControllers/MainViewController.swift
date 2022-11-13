//
//  MainViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 13.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var allButtons: UIStackView!
    @IBOutlet var activityIndicate: UIActivityIndicatorView!
    
    //MARK: - Private Properties
    private var productRecall: ProductRecall!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons.isHidden = true
        activityIndicate.startAnimating()
        activityIndicate.hidesWhenStopped = true
        fetchProductRecall()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            guard let navigationVCs = segue.destination as? UINavigationController else { return }
            let navigationVC = navigationVCs.topViewController
            guard let resultVC = navigationVC as? ResultsTableViewController else { return }
            resultVC.results = productRecall.results
        } else {
            guard let metaVC = segue.destination as? MetaViewController else { return }
            metaVC.meta = productRecall.meta
        }
    }
    
    //MARK: - IB Actions
    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "results", sender: nil)
    }
    
    @IBAction func metaButtonTapped() {
        performSegue(withIdentifier: "meta", sender: nil)
    }
}

extension MainViewController {
    private func fetchProductRecall() {
        NetworkManager.shared.fetch(ProductRecall.self, from: Link.apiURL.rawValue) { [weak self] result in
            switch result {
            case .success(let data):
                self?.productRecall = data
                self?.activityIndicate.stopAnimating()
                self?.allButtons.isHidden = false
            case .failure(_):
                print("Error")
            }
        }
    }
}
