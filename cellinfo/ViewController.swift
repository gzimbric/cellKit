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
                case CTRadioAccessTechnologyCDMA1x: self.radioLabel.text = "CDMA (1x)"; print("CDMA (1x)")
                case CTRadioAccessTechnologyCDMAEVDORev0: self.radioLabel.text = "EVDO (3G)"; print("EVDORev0 (3G)")
                case CTRadioAccessTechnologyCDMAEVDORevA: self.radioLabel.text = "EVDO (3G)"; print("EVDORevA (3G)")
                case CTRadioAccessTechnologyCDMAEVDORevB: self.radioLabel.text = "EVDO (3G)"; print("EVDORevB (3G)")
                case CTRadioAccessTechnologyGPRS: self.radioLabel.text = "GPRS (2G/3G)"; print("GPRS (2G/3G)")
                case CTRadioAccessTechnologyHSDPA: self.radioLabel.text = "HSDPA (3G+)"; print("HSDPA (3G+)")
                case CTRadioAccessTechnologyHSUPA: self.radioLabel.text = "HSUPA (3G+)"; print("HSUPA (3G+)")
                default: self.radioLabel.text = "Unknown"; print("Unknown")
            }
        }
    }
    // Refresh radio state in case of network change
    @IBAction func refreshRadio(_ sender: Any) {
        let telefonyInfo = CTTelephonyNetworkInfo()
        if let radioAccessTechnology = telefonyInfo.currentRadioAccessTechnology{
            switch radioAccessTechnology {
            case CTRadioAccessTechnologyLTE: self.radioLabel.text = "LTE (4G)"; print("Refreshed: LTE (4G)")
            case CTRadioAccessTechnologyWCDMA: self.radioLabel.text = "WCDMA (3G)"; print("Refreshed: WCDMA (3G)")
            case CTRadioAccessTechnologyEdge: self.radioLabel.text = "EDGE (2G)"; print("Refreshed: EDGE (2G)")
            case CTRadioAccessTechnologyeHRPD: self.radioLabel.text = "eHRPD (3G)"; print("Refreshed: eHRPD (3G)")
            case CTRadioAccessTechnologyCDMA1x: self.radioLabel.text = "CDMA (1x)"; print("Refreshed: CDMA (1x)")
            case CTRadioAccessTechnologyCDMAEVDORev0: self.radioLabel.text = "EVDO (3G)"; print("Refreshed: EVDORev0 (3G)")
            case CTRadioAccessTechnologyCDMAEVDORevA: self.radioLabel.text = "EVDO (3G)"; print("Refreshed: EVDORevA (3G)")
            case CTRadioAccessTechnologyCDMAEVDORevB: self.radioLabel.text = "EVDO (3G)"; print("Refreshed: EVDORevB (3G)")
            case CTRadioAccessTechnologyGPRS: self.radioLabel.text = "GPRS (2G/3G)"; print("Refreshed: GPRS (2G/3G)")
            case CTRadioAccessTechnologyHSDPA: self.radioLabel.text = "HSDPA (3G+)"; print("Refreshed: HSDPA (3G+)")
            case CTRadioAccessTechnologyHSUPA: self.radioLabel.text = "HSUPA (3G+)"; print("Refreshed: HSUPA (3G+)")
            default: self.radioLabel.text = "Unknown"; print("Refreshed: Unknown")
            }
        }
    }
}
