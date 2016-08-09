//
//  CelebsMainViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class CelebsMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var popularCelebsCollectionView: UICollectionView!
    @IBOutlet weak var celebsCategoriesTableView: UITableView!
    private var tableContent = ["Popular"]
    var popularCelebs = [Celeb](){
        
        didSet{
            
            self.popularCelebsCollectionView.reloadData()
            
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.closeRight()
    }
    var placeHolderImage = UIImage(named:Constants.imageIdentifiers.placeHolderImage)
    override func viewDidLoad() {
        super.viewDidLoad()
        popularCelebsCollectionView.dataSource = self
        popularCelebsCollectionView.delegate = self
        celebsCategoriesTableView.dataSource=self
        celebsCategoriesTableView.delegate=self
        
        AppModel.fetchPerticularCelebs(Constants.ApiSearchQueries.CelebsRelated.popular){
            
            celebs in
            self.popularCelebs = celebs
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularCelebs.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellIdentifiers.celebsMainCollectionCell, forIndexPath: indexPath) as! CollectionViewCell
        
       cell.customImageView.backgroundImageView.kf_setImageWithURL(NSURL(string: popularCelebs[indexPath.row].profileImagePath!), placeholderImage:placeHolderImage)
        cell.customImageView.popularityLabel.text="sps"

        
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.celebsMainTableCell)!
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.requestedCelebsVc) as! RequestedCelebsViewController
        switch row{
            
        case 0 : destinationVc.query = Constants.ApiSearchQueries.CelebsRelated.popular
        default: break
            
            
        }
        self.showViewController(destinationVc, sender: nil)
        
    }
    
    
    
}
