//
//  ViewController.swift
//  BeneficiaryName
//
//  Created by Muhammad Hashir on 9/1/23.
//

import UIKit

class BeneficiaryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var beneficiaryListTableView: UITableView!
    
    private var beneficiaryList = BeneficiaryService.loadBeneficiaryData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        beneficiaryListTableView.delegate = self
        beneficiaryListTableView.dataSource = self
        
        let tableViewCellNib = UINib(nibName: String(describing: BeneficiaryDetailsTableViewCell.self), bundle: nil)
        beneficiaryListTableView.register(tableViewCellNib, forCellReuseIdentifier: String(describing: BeneficiaryDetailsTableViewCell.self))
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beneficiaryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: BeneficiaryDetailsTableViewCell.self)) as! BeneficiaryDetailsTableViewCell
        tableViewCell.setupCell(beneficiaryInfo: beneficiaryList[indexPath.row])
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBenef = beneficiaryList[indexPath.row]
        ///Adding a saparet check to show second line mailing address.
        let secondMailing = selectedBenef.beneficiaryAddress.scndLineMailing.isEmpty ? "" : "\n\(selectedBenef.beneficiaryAddress.scndLineMailing)"
        ///Adding a check to either show postal or zip code.
        let zipPostalCode = selectedBenef.beneficiaryAddress.zipCode.isEmpty ? selectedBenef.beneficiaryAddress.stateCode : selectedBenef.beneficiaryAddress.zipCode
        let addressString = "\(selectedBenef.beneficiaryAddress.firstLineMailing)\(secondMailing)\n\(selectedBenef.beneficiaryAddress.city), \(selectedBenef.beneficiaryAddress.country), \(zipPostalCode)"
        let beneficiaryDetails = "SSN: \(selectedBenef.socialSecurityNumber)\nDate of Birth: \(Utilities.formatDate(from: selectedBenef.dateOfBirth))\nPhone No: \(selectedBenef.phoneNumber)\nAddress: \(addressString)"
        
        let alert = UIAlertController(title: "Beneficiary Details", message: beneficiaryDetails, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

