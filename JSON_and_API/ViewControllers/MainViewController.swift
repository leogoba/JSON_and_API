//
//  ViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
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
    
    //MARK: - Private Methods
    private func fetchProductRecall() {
        guard let url = URL(string: DataSrore.shared.URL) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, responce, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let recall = try decoder.decode(ProductRecall.self, from: data)
                
                DispatchQueue.main.async {
                    self?.activityIndicate.stopAnimating()
                    self?.allButtons.isHidden = false
                }
                self?.productRecall = recall
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
