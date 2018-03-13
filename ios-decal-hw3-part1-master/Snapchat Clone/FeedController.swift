//
//  FeedController.swift
//  Snapchat Clone
//
//  Created by Sunbin Kim on 3/12/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class FeedController: UITableViewController {
    
    //variables
    var IndexPath: IndexPath?
    var currImage: Snap!
    var currSnap: Snap!
    
    //outlet
    @IBOutlet var feedView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedView.delegate = self
        feedView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        IndexPath = indexPath
        currSnap = threads[threadNames[indexPath.section]]?[indexPath.row]
        if let temp = tableView.cellForRow(at: indexPath) as? FeedTableCell{
//            temp.ohSnap = currSnap
            if temp.ohSnap.status == false{
                performSegue(withIdentifier: "showImage", sender: self)
            } else {
                let alert = UIAlertController(title: "ERROR! Already Seen!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Backk", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
//        if currSnap.status == false{
//            performSegue(withIdentifier: "showImage", sender: self)
//        } else {
//            let alert = UIAlertController(title: "ERROR! Already Seen!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "Backk", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            return
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (threads[threadNames[section]]?.count)!
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return threads.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currCell = feedView.dequeueReusableCell(withIdentifier: "FeedTableCell", for: indexPath) as! FeedTableCell
        currSnap = threads[threadNames[indexPath.section]]?[indexPath.row]
        //update image/name based on status(read/unread)
        currCell.userName.text = currSnap?.name
        let timeDiff = (Int(Date().timeIntervalSince(currSnap.time!)) / 60) % 60
        currCell.timer.text = "\(timeDiff) MIN AGO"
        if currSnap.status == false {
            currCell.statusImage.image = #imageLiteral(resourceName: "unread")
        } else {
            currCell.statusImage.image = #imageLiteral(resourceName: "read")
        }
        currCell.ohSnap = currSnap
        
        return currCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "showImage" {
                if let dest = segue.destination as? viewFullSnapController {
                    dest.currSnap = currSnap
                }
            }
        }
    }
}
