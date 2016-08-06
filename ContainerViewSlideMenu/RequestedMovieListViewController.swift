//
//  RequestedMovieListViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 31/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit

class RequestedMovieListViewController: UITableViewController {
    
    var query : Constants.ApiSearchQueries.MovieRelated!
    @IBOutlet var movieListTableView: UITableView!
    var moviesFetched = [Movie](){
        
        
        didSet{
            
            self.movieListTableView.reloadData()
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieListTableView.dataSource = self
        self.movieListTableView.delegate = self
        AppModel.fetchPerticularMovies(query){
            
            movies in
            self.moviesFetched = movies
            
        }
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesFetched.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.cellIdentifiers.requestedListMovieCell) as! RequestedTypeTableViewCell
        cell.cellImageView.kf_setImageWithURL(NSURL(string: moviesFetched[indexPath.row].posterImagePath!), placeholderImage: UIImage(named: Constants.imageIdentifiers.placeHolderImage))
        cell.cellInfo.text = moviesFetched[indexPath.row].overview
        cell.cellInfo.numberOfLines = 6
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
