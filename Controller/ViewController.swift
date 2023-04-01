//
//  ViewController.swift
//  Motton Challnge
//
//  Created by salah waleed on 01/04/2023.
//

import UIKit

class ViewController: UIViewController {

    var unsplash : Userdetalis = []
    
    @IBOutlet weak var photosCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ApiService.shared.fetchresult { [weak self]
            result in
            guard let self = self else {return}
            guard let result = result else {return }
            self.unsplash = result
            
            DispatchQueue.main.async {
                self.photosCV.reloadData()
            }
        }
      
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(unsplash.count)
        return unsplash.count
   
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
 
        let data = HelperFuncation.getImg(urlImg: (unsplash[indexPath.row].urls?.small)!)
        cell.photo.image = UIImage(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
         
        
        guard let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotosVC") as? PhotosVC else {return}
        
        photoVC.img = (unsplash[indexPath.row].urls?.small)!
 
        photoVC.modalPresentationStyle = .fullScreen
      self.present(photoVC, animated: true, completion: nil)
        
        
}
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .pad{
            return CGSize(width: photosCV.frame.width / 2 , height: photosCV.frame.height/3.1)
            
        }else{
            return CGSize(width: photosCV.frame.width / 2.4 , height: photosCV.frame.height/3.4)
            }
    }
}
