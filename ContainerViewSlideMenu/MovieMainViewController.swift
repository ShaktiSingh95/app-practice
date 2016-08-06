//
//  MovieMainViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import Kingfisher
class MovieMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!
    @IBOutlet weak var movieCategoryTableView: UITableView!
    var placeHolderImage = UIImage(named:Constants.imageIdentifiers.placeHolderImage)
    
    private var tableContent = ["Upcoming","Top Rated","Most Popular"]
    var popularMovies = [Movie](){
    
        didSet{
            
            popularMoviesCollectionView.reloadData()
            
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popularMoviesCollectionView.dataSource = self
        popularMoviesCollectionView.delegate = self
        movieCategoryTableView.dataSource=self
        movieCategoryTableView.delegate=self
        
        AppModel.fetchPerticularMovies(Constants.ApiSearchQueries.MovieRelated.popularMovies){
            
            movies in
            self.popularMovies = movies
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.cellIdentifiers.movieMainCollectionCell, forIndexPath: indexPath) as! CollectionViewCell
        cell.imageView.kf_setImageWithURL(NSURL(string: self.popularMovies[indexPath.row].posterImagePath!)!, placeholderImage:placeHolderImage)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.movieMainTableCell)!
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let row = indexPath.row
        let destinationVc = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.requestedMoviesVc) as! RequestedMovieListViewController
        switch row{
            
        case 0 : destinationVc.query = Constants.ApiSearchQueries.MovieRelated.upcomingMovies
        case 1:
            destinationVc.query = Constants.ApiSearchQueries.MovieRelated.topRatedMovies
        case 2:
            destinationVc.query = Constants.ApiSearchQueries.MovieRelated.popularMovies
        default: break
            
            
        }
        self.showViewController(destinationVc, sender: nil)
        
    }
    
    
}
