//
//  MoviesViewController.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
    }

    private func setTableView() {
        tableView.allowsSelection = false
        tableView.registerNib(CustomCell.stringRepresentation)
        tableView.separatorStyle = .none
    }

}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.stringRepresentation) as! CustomCell
//        cell.delegate = self
//        cell.section = indexPath.row
//        switch indexPath.row {
//        case 0:
//            cell.arrayMovies = popularList.results
//            cell.listType    = listType.Popular
//        case 1:
//            cell.arrayMovies = topRateList.results
//            cell.listType    = listType.TopRate
//        case 2:
//            cell.arrayMovies = upcominList.results
//            cell.listType    = listType.Upcoming
//        default:
//            break
//        }
//        cell.titleCategory.text = sections[indexPath.row]
//        cell.btnMore.addTarget(self, action: #selector(moreItems(sender:)), for: UIControlEvents.touchUpInside)
//        cell.btnMore.accessibilityLabel = "\(indexPath.row)"
        return cell
    }
    
    ///Get number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return popularList == nil ? 0 : 3
        return  3
    }
    ///Set number of sections default 1
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //MARK: - UITableViewDelegate
    ///Height for cell, custom value 270
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
