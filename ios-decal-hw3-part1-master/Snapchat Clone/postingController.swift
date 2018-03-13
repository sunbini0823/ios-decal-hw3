//
//  postingController.swift
//  Snapchat Clone
//
//  Created by Sunbin Kim on 3/12/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class postingController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //variables
    var postImage: Snap!
    var postFeedName: String!
//    var index: IndexPath?
    
    //load
    override func viewDidLoad() {
        super.viewDidLoad()
        feed.delegate = self
        feed.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //required
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell
        cell.feedName.text = threadNames[indexPath.row]
        cell.feedName.textAlignment = .center
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        index = indexPath
        postFeedName = threadNames[indexPath.row]
        feedLabel.text? = threadNames[indexPath.row]
    }
    
    
    //actions
    
    @IBOutlet var feed: UITableView!
    
    @IBOutlet weak var feedLabel: UILabel!
    
    @IBAction func post(_ sender: Any) {
        if postFeedName == nil {
            let alert = UIAlertController(title: "ERROR!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Need to pick a feed", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        threads[postFeedName]!.append(postImage)
        postImage.time = Date()
        let alert = UIAlertController(title: "Posted!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: goBack))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func goBack(alert: UIAlertAction!){
        performSegue(withIdentifier: "Back", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let dest = segue.destination as? FeedController {
//            dest.currImage = Snap(status: false, name: "Sunbin Kim", image: postImage.image!)
//        }
//        
//    }
}


