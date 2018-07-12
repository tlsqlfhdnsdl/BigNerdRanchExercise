//
//  PhotosViewController.swift
//  Photorama
//
//  Created by 김영호 on 12/07/2018.
//  Copyright © 2018 Yeongho. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imgaeView: UIImageView!
    var store: PhotoStore!
    
    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) {
            (imageResult) -> Void in
            
            switch imageResult {
            case let .success(image):
                self.imgaeView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
