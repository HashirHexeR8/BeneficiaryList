//
//  BeneficiaryDetailsDTO.swift
//  BeneficiaryList
//
//  Created by Muhammad Hashir on 9/1/23.
//

import Foundation

class BeneficiaryDetailsDTO: Decodable {
    var lastName: String = "--"
    var firstName: String = "--"
    var designationCode: String = "--"
    var beneType: String = "--"
    var socialSecurityNumber: String = "--"
    var dateOfBirth: String = "--"
    var middleName: String = "--"
    var phoneNumber: String = "--"
    var beneficiaryAddress: BeneficiaryAddress
    
    enum CodingKeys: String, CodingKey {
        case lastName
        case firstName
        case designationCode
        case beneType
        case socialSecurityNumber
        case dateOfBirth
        case middleName
        case phoneNumber
        case beneficiaryAddress
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? "--"
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? " "
        self.designationCode = try container.decodeIfPresent(String.self, forKey: .designationCode) ?? "--"
        self.beneType = try container.decodeIfPresent(String.self, forKey: .beneType) ?? "--"
        self.socialSecurityNumber = try container.decodeIfPresent(String.self, forKey: .socialSecurityNumber) ?? "--"
        self.dateOfBirth = try container.decodeIfPresent(String.self, forKey: .dateOfBirth) ?? "--"
        self.middleName = try container.decodeIfPresent(String.self, forKey: .middleName) ?? "--"
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber) ?? "--"
        self.beneficiaryAddress = try container.decodeIfPresent(BeneficiaryAddress.self, forKey: .beneficiaryAddress) ?? BeneficiaryAddress()
    }
}

class BeneficiaryAddress: Decodable {
    var firstLineMailing: String = "--"
    var scndLineMailing: String = ""
    var city: String = "--"
    var zipCode: String = ""
    var stateCode: String = "--"
    var country: String = "--"
    
    enum CodingKeys: String, CodingKey {
        case firstLineMailing
        case scndLineMailing
        case city
        case zipCode
        case stateCode
        case country
    }
    
    init() {
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.firstLineMailing = try container.decodeIfPresent(String.self, forKey: .firstLineMailing) ?? "--"
        self.scndLineMailing = try container.decodeIfPresent(String.self, forKey: .scndLineMailing) ?? ""
        self.city = try container.decodeIfPresent(String.self, forKey: .city) ?? "--"
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode) ?? ""
        self.stateCode = try container.decodeIfPresent(String.self, forKey: .stateCode) ?? "--"
        self.country = try container.decodeIfPresent(String.self, forKey: .country) ?? "--"
    }
}
