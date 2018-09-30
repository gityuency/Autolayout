//
//  SnpKitCellOptimizationViewController.swift
//  AutoLayout
//
//  Created by yuency on 17/05/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class SnpKitCellOptimizationViewController: UIViewController {
    
    var tableview = UITableView()
    let viewModel = SnpKitCellOptimizationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    private func setUpTableView() {
        self.automaticallyAdjustsScrollViewInsets = false
        view.addSubview(tableview)
        tableview.tableFooterView = UIView()
        tableview.register(OptimizationTableViewCell.self, forCellReuseIdentifier: OptimizationTableViewCell.resuseId)
        tableview.estimatedRowHeight = 130;
        tableview.rowHeight = UITableView.automaticDimension;
        tableview.delegate = self
        tableview.dataSource = self
        tableview.snp.makeConstraints({ make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
            make.left.right.equalTo(view)
        })
    }
}



extension SnpKitCellOptimizationViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: OptimizationTableViewCell.resuseId, for: indexPath) as! OptimizationTableViewCell
        cell.nameLabel.text = model.leftTitle
        cell.contentLabel.text = model.rightTitle
        cell.headImageView.image = model.image
        return cell
    }
}

