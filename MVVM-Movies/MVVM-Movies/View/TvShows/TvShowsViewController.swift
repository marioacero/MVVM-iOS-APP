//
//  TvShowsViewController.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import UIKit

class TvShowsViewController: UIViewController, ViewModelDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = TvShowViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getTvShows(type: .Popular)
        viewModel.getTvShows(type: .TopRate)
        viewModel.getTvShows(type: .Upcoming)
    }
    
    func reloadTable(type: Int) {
        DispatchQueue.main.sync {
            self.tableView.reloadRows(at: [IndexPath(row: type, section: 0)], with: .fade)
        }
    }
}

extension TvShowsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.stringRepresentation) as! CustomCell
        if viewModel.dataItems.count > 0 {
            let dataItems = viewModel.dataItems[indexPath.row]
            cell.configure(whitViewModel: dataItems, row: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  AppConstants.Movies.numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AppConstants.Movies.numberOfSections
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(AppConstants.Movies.heightForRow)
    }
}
