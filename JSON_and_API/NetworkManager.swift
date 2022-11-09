//
//  NetworkManager.swift
//  JSON_and_API
//
//  Created by leogoba on 09.11.2022.
//

//import Foundation
//
//class NetworkManager {
//    
//    func fetchProductRecall() {
//        guard let url = URL(string: DataSrore.shared.URL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, responce, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                let recall = try decoder.decode([ProductRecall].self, from: data)
//                print(recall)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
//}


