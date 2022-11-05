//
//  DataStore.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
//

class DataSrore {
    
    static let shared = DataSrore()
    
    let URL = "https://api.fda.gov/food/enforcement.json?limit=10"
    
    private init() {}
}
