//
//  ProductRecall.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
//

struct ProductRecall: Decodable {
    let meta: GeneralСharacteristics
    let results: [GeneralResults]
    
}

struct GeneralСharacteristics: Decodable {
    let disclaimer: String
    let terms: String
    let license: String
    let last_updated: String
    let results: NumericalCharacteristics
}

struct NumericalCharacteristics: Decodable {
    let skip: Int
    let limit: Int
    let total: Int
}

struct GeneralResults: Decodable {
    let city: String
    let address_1: String
    let state: String
}

extension GeneralСharacteristics {
    
    var description: String {
        """
        Disclaimer: \(disclaimer)
        Terms: \(terms)
        License: \(license)
        Last update: \(last_updated)
        """
    }
}

extension NumericalCharacteristics {
    
    var description: String {
        """
        Skip: \(skip)
        Limit: \(limit)
        Total: \(total)
        """
    }
}
