//
//  ViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var productRecall: ProductRecall!
    
    @IBOutlet var allButtons: UIStackView!
    
    @IBOutlet var activityIndicate: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allButtons.isHidden = true
        activityIndicate.startAnimating()
        activityIndicate.hidesWhenStopped = true
        fetchProductRecall()
    }
    
    private func fetchProductRecall() {
        guard let url = URL(string: DataSrore.shared.URL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let recall = try decoder.decode(ProductRecall.self, from: data)
                
                DispatchQueue.main.async {
                    self.activityIndicate.stopAnimating()
                    self.allButtons.isHidden = false
                }
                self.productRecall = recall
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "results", sender: nil)
        
    }
    
    @IBAction func metaButtonTapped() {
        performSegue(withIdentifier: "meta", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "results" {
            guard let navigationVCs = segue.destination as? UINavigationController else { return }
            let navigationVC = navigationVCs.topViewController
            guard let resultVC = navigationVC as? ResultsTableViewController else { return }
            resultVC.results = productRecall.results
            
        } else if segue.identifier == "meta" {
            guard let metaVC = segue.destination as? MetaViewController else { return }
            metaVC.meta = productRecall.meta
        }
    }
}
