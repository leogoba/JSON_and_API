//
//  ResultsTableViewController.swift
//  JSON_and_API
//
//  Created by leogoba on 08.11.2022.
//

import UIKit

class ResultsTableViewController: UITableViewController {
    
    //MARK: - Public Properties
    var results: [GeneralResults] = []
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        results.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "result", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let result = results[indexPath.section]
        
        if indexPath.row == 0 {
            content.text = "Address: \(result.address_1)"
        } else {
            content.text = "State: \(result.state)"
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        results[section].city
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - IB Actions
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: - Networking
extension ResultsTableViewController {
    func fetchProductRecall() {
        guard let url = URL(string: Link.apiURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self?.results = try decoder.decode([GeneralResults].self, from: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
