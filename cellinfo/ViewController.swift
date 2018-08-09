//
//  ViewController.swift
//  cellinfo
//
//  Created by Gabe Zimbric on 8/9/18.
//  Copyright © 2018 Gabe Zimbric. All rights reserved.
//

import UIKit
import CoreTelephony

class ViewController: UIViewController {

    @IBOutlet weak var carrierLabel: UILabel!
    @IBOutlet weak var radioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup view
        navigationController?.navigationBar.prefersLargeTitles = true
        // Get telephony info
        let telefonyInfo = CTTelephonyNetworkInfo()
        // Get carrier and display in view
        let carrier = telefonyInfo.subscriberCellularProvider
        print(carrier!.carrierName!)
        self.carrierLabel.text = String(carrier!.carrierName!)
        // Get radio state and display in view
        if let radioAccessTechnology = telefonyInfo.currentRadioAccessTechnology{
            switch radioAccessTechnology {
            case CTRadioAccessTechnologyLTE: self.radioLabel.text = "LTE (4G)"; print("LTE (4G)")
            case CTRadioAccessTechnologyWCDMA: self.radioLabel.text = "WCDMA (3G)"; print("WCDMA (3G)")
            case CTRadioAccessTechnologyEdge: self.radioLabel.text = "EDGE (2G)"; print("EDGE (2G)")
            case CTRadioAccessTechnologyeHRPD: self.radioLabel.text = "eHRPD (3G)"; print("eHRPD (3G)")
            default: self.radioLabel.text = "Unknown"; print("Unknown")
            }
        }
    }
}
