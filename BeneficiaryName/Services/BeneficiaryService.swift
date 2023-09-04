//
//  BeneficiaryService.swift
//  BeneficiaryList
//
//  Created by Muhammad Hashir on 9/1/23.
//

import Foundation

struct BeneficiaryService {
    
    static func loadBeneficiaryData() -> [BeneficiaryDetailsDTO] {
        var beneficiaryList: [BeneficiaryDetailsDTO] = []
        do {
            if let path = Bundle.main.path(forResource: "Beneficiaries", ofType: "json") {
                let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
                beneficiaryList = try JSONDecoder().decode([BeneficiaryDetailsDTO].self, from: jsonData as Data)
            }
        }
        catch {
            beneficiaryList = []
            print(String(describing: error))
        }
        
        return beneficiaryList
    }
}
