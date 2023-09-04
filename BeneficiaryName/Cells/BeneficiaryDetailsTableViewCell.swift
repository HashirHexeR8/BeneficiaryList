//
//  BeneficiaryDetailsTableViewCell.swift
//  BeneficiaryList
//
//  Created by Muhammad Hashir on 9/1/23.
//

import UIKit

class BeneficiaryDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var beneficiaryName: UILabel!
    @IBOutlet weak var beneficiaryCode: UILabel!
    @IBOutlet weak var designation: UILabel!
    
    private var beneficiaryInfo: BeneficiaryDetailsDTO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        // Configure the view for the selected state
    }
    
    ///Setting up basic information for the beneficiary
    func setupCell(beneficiaryInfo: BeneficiaryDetailsDTO) {
        self.beneficiaryName.text = "Beneficiary Name: \(beneficiaryInfo.lastName) \(beneficiaryInfo.firstName)"
        self.beneficiaryCode.text = "Beneficiary Type: \(beneficiaryInfo.beneType) "
        self.designation.text = "Designation: \(beneficiaryInfo.designationCode)"
        
        self.beneficiaryInfo = beneficiaryInfo
    }
    
}
