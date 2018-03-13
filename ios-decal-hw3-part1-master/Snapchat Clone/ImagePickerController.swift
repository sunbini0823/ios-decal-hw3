//
//  imagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

// This class should remind you of lab 3. That's probably because it's exactly the same!
class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var imageSelected: UIImage?
//    var imageToSnap: Snap!

    @IBOutlet var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.collectionViewLayout = ImageFlowLayout()
        self.imageCollectionView.backgroundColor = UIColor.purple

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        imageSelected = image
        performSegue(withIdentifier: "Post", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "Post" {
                if let dest = segue.destination as? postingController {
                    dest.postImage = Snap(status: false, name: "Sunbin Kim", image: imageSelected!)
                }
            }
        }
        
    }
 
    
    
    //DON'T MODIFY CODE HERE AND BELOW!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as? ImageCollectionViewCell else {
            print("error dequeuing cell at index path \(indexPath)")
            return UICollectionViewCell()
        }
        cell.image.image = allImages[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
            selectImage(selectedCell.image.image!)
        }
        
    }
}
