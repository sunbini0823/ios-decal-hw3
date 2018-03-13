//
//  Snap.swift
//  Snapchat Clone
//
//  Created by Sunbin Kim on 3/12/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class Snap: NSObject{
    var status: Bool!
    var name: String!
    var image: UIImage!
    var time: Date?
    
    init(status: Bool, name: String, image: UIImage) {
        self.status = status
        self.name = name
        self.image = image
        self.time = Date()
        
    }
}
