//
//  SentMemesCollectionViewController.swift
//  MemeMe2.0
//
//  Created by omoon on 2016/08/06.
//  Copyright © 2016年 lamolabo. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var memes = [Meme]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewWillAppear(animated: Bool) {
        changeFlowLayout(UIDevice.currentDevice().orientation)
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.memes = appDelegate.memes
        self.collectionView.reloadData()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        changeFlowLayout(UIDevice.currentDevice().orientation)
    }
    
    func changeFlowLayout(orientation: UIDeviceOrientation) {
        
        let space: CGFloat = 3.0
        let dimension = orientation.isPortrait
            ? (self.view.frame.size.width - (2 * space)) / 3
            : (self.view.frame.size.width - (4 * space)) / 5
        
        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellForMeme", forIndexPath: indexPath) as! SentMemesCollectionViewCell
        let meme = self.memes[indexPath.row]
        cell.imageViewMeme.image = meme.memedImage
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SentMemeDetailViewController") as! SentMemeDetailViewController
        detailViewController.meme = self.memes[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
