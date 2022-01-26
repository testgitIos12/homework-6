//
//  ViewController.swift
//  homework 6
//
//  Created by Samir Maksutov on 24/1/22.
//

import UIKit

class ViewController: UIViewController{

var images = [UIImage]()
    let countcells = 1
    let offset:CGFloat = 1
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
//
        CollectionView.dataSource = self
        CollectionView.delegate = self
        for i in 0...4{
           let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
    }
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
        
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellimage" , for: indexPath) as! ImageCollectionViewCell
        
        let image = images[indexPath.item]
        cell.PhotoView.image = image
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        
        let widthCell = frameCV.width / CGFloat(countcells)
        let heightCell = widthCell
    
        let spacing = CGFloat((countcells + 1)) * offset / CGFloat(countcells)
        return CGSize(width: widthCell - spacing, height: heightCell - (offset*2))
    }
    
}
