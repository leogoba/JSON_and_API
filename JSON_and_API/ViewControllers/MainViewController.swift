//
//  ViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var productRecall: ProductRecall!
    
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
                self.productRecall = recall
                //print(self.productRecall!)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    @IBAction func resultButtonTapped() {
        performSegue(withIdentifier: "showResults", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVCs = segue.destination as? UINavigationController else { return }
        let navigationVC = navigationVCs.viewControllers
        navigationVC.forEach {
            if let downVC = $0 as? DownViewController {
                downVC.result = productRecall.results
            }
        }
        
    }
}


//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let tabBarController = segue.destination as? UITabBarController else { return }
//        guard let viewControllers = tabBarController.viewControllers else { return }
//
//        viewControllers.forEach {
//            if let welcomeVC = $0 as? WelcomeViewController {
//                welcomeVC.user = userData
//            } else if let navigationVC = $0 as? UINavigationController {
//                let userInfoVC = navigationVC.topViewController
//                guard let userInfoVC = userInfoVC as? UserDataViewController else {
//                    return
//                }
//                userInfoVC.user = userData
//            }
//        }
//    }
