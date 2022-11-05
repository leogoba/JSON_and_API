//
//  ViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
                print(recall)
            } catch let error {
                print(error.localizedDescription)
            }
    
        }.resume()
    }
}

