//
//  CreativityViewController.swift
//  Branton_CSP
//
//  Created by Martinson, Branton on 12/7/17.
//  Copyright © 2017 Martinson, Branton. All rights reserved.
//

import UIKit

class CreativityViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [
            UIImage(named: "cute"),
            UIImage(named: "squishBall"),
            UIImage(named: "tree"),
            UIImage(named: "cute star wars"),
            UIImage(named: "javaSample"),
            UIImage(named: "swiftSample"),
            UIImage(named: "squishSample"),
            UIImage(named: "squishSample"),
            UIImage(named: "squishSample"),
            UIImage(named: "squishSample"),
            UIImage(named: "squishSample")
        ]
    }()
    
    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
            collectionView?.preformBatchUpdates(
                {
                    self.collectionView?.reloadItems(at: indexPaths)
                })
            {
                completed in
                
                if let largePhotoIndexPath = self.largePhotoIndexPath
                {
                    self.collectionView?.scrollToItem(at: largePhotoIndexPath,
                                                      at: .centeredVertically,
                                                      animated: true)
                }
            }
            
        }
    }

    override public func viewDidLoad()
    {
        super.viewDidLoad()
    }

    public func numberOfSections(int collectionView: UICollectionView) -> InternetDetailViewController
    {
     return 1
    }
    
    public func collectionV(_ collectionView: UICollectionView,
                                     numberOfItemsInSection section: Int) -> Int
    {
        return artSelection.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReuseIdentifier; reuseIdentifier;, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .purple
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
        
        return artCell
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath == largePhotoIndexPath
        {
            let art = artSelection[indexPath.row]
            let size = collectionView.bounds.size
            let widthScale = (size.width / art!.size.width) * CGFloat(0.80)
            let largerSize = CGSize(width: art!.size.width * widthScale, height: art!.size.height * widthScale)
            
            return largerSize
        }
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_ collectionView:UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectioniew: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        shouldSelectItemAt indexPath, _: IndexPath) -> Bool
    {
        if largePhotoIndexPath == indexPath
        {
            largePhotoIndexPath = nil
        }
        else
        {
            largePhotoIndexPath = indexPath
        }
        
        return false
    }
}
