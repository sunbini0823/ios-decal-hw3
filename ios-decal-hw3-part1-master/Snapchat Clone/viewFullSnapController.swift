//
//  viewFullSnapController.swift
//  Snapchat Clone
//
//  Created by Sunbin Kim on 3/12/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class viewFullSnapController: UIViewController {
    var currSnap: Snap!

    @IBOutlet weak var buttonImage: UIButton!
    
    @IBAction func goBack(_ sender: Any) {
        performSegue(withIdentifier: "Back", sender: self)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonImage.setBackgroundImage(currSnap.image, for: UIControlState.normal)
            currSnap.status = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
