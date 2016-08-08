//
//  SentMemeDetailViewController.swift
//  MemeMe2.0
//
//  Created by omoon on 2016/08/06.
//  Copyright © 2016年 lamolabo. All rights reserved.
//

import UIKit

class SentMemeDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView!.image = meme.memedImage
        self.tabBarController!.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController!.tabBar.hidden = false
    }

}

