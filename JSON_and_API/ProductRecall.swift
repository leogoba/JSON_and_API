//
//  ProductRecall.swift
//  JSON_and_API
//
//  Created by leogoba on 05.11.2022.
//

struct ProductRecall {
    let meta: GeneralСharacteristics?
    let results: [GeneralResults]?
    
}

struct GeneralСharacteristics {
    let disclaimer: String?
    let terms: String?
    let license: String?
    let last_updated: String?
    let results: NumericalCharacteristics?
}

struct NumericalCharacteristics {
    let skip: Int?
    let limit: Int?
    let total: Int?
}

struct GeneralResults {
    let country: String?
    let city: String?
    let address_1: String?
    let reason_for_recall: String?
    let address_2: String?
    let product_quantity: String?
    let code_info: String?
    let center_classification_date: String?
    let distribution_pattern: String?
    let state: String?
    let product_description: String?
    let report_date: String?
    let classification: String?
    let recalling_firm: String?
    let recall_number: String?
    let initial_firm_notification: String?
    let product_type: String?
    let event_id: String?
    let more_code_info: String?
    let recall_initiation_date: String?
    let postal_code: String?
    let voluntary_mandated: String?
    let status: String?
}
