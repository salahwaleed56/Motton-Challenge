//
//  PhotosVC.swift
//  Motton Challnge
//
//  Created by salah waleed on 01/04/2023.
//

import UIKit

class PhotosVC: UIViewController {

    
     var img : String = ""
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ShowImg()
    }
    
    
    func ShowImg() {
 
       let data =  HelperFuncation.getImg(urlImg: img)
        photo.image = UIImage(data: data)
    }
    
    
    
    @IBAction func backBTN(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

}
