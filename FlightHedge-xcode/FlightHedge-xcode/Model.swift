//
//  Model.swift
//  FlightHedge-xcode
//
//  Created by Austin Potts on 1/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
class ServiceProvided {
    
    var title: String
    var url: String
    var image: UIImage
    
    init(title: String, imageName: UIImage, url: String) {
        self.image = imageName
        self.title = title
        self.url = url
        
        
    }
    
}
