//
//  CustomTableView.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/17/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.allowsSelection = false
        self.registerNib(CustomCell.stringRepresentation)
        self.separatorStyle = .none
    }
}
