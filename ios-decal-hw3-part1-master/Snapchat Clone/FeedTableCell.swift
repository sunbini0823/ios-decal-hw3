//
//  FeedTableCell.swift
//  Snapchat Clone
//
//  Created by Sunbin Kim on 3/12/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class FeedTableCell: UITableViewCell {
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    var ohSnap: Snap!
    
}
