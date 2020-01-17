//
//  GetQuoteViewController.swift
//  FlightHedge-xcode
//
//  Created by Austin Potts on 1/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class GetQuoteViewController: UIViewController {

    @IBOutlet weak var enterQuote: UIButton!
    
    @IBOutlet weak var airlineName: UITextField!
    @IBOutlet weak var flightNumber: UITextField!
    @IBOutlet weak var flightTicketNumber: UITextField!
    @IBOutlet weak var dateOfFlight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        enterQuote.layer.cornerRadius = 30
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
