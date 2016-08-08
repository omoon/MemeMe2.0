//
//  SentMemesTableViewController.swift
//  MemeMe2.0
//
//  Created by omoon on 2016/08/06.
//  Copyright © 2016年 lamolabo. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memes = [Meme]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.memes = appDelegate.memes
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellForMeme") as! SentMemesTableViewCell
        let meme = self.memes[indexPath.row]
        cell.labelTextTop.text = meme.textTop
        cell.labelTextBottom.text = meme.textBottom
        cell.imageViewMeme.image = meme.memedImage
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailViewController.meme = self.memes[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}