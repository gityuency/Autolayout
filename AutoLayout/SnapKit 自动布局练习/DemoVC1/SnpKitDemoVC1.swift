//
//  SnpKitDemoVC1.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit
import SnapKit

class SnpKitDemoVC1: UIViewController {

    var tableview = UITableView()

    let viewModel = SnpKitDemoVC1ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }

    private func setUpTableView() {

        self.automaticallyAdjustsScrollViewInsets = false

        view.addSubview(tableview)
        tableview.tableFooterView = UIView()
        tableview.register(SnpKit_DemoVC_1_Cell.self, forCellReuseIdentifier: SnpKit_DemoVC_1_Cell.resuseId)

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


extension SnpKitDemoVC1: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SnpKit_DemoVC_1_Cell.resuseId, for: indexPath) as! SnpKit_DemoVC_1_Cell
        cell.leftTitleLabel.text = model.leftTitle
        cell.rightTitleLabel.text = model.rightTitle
        return cell
    }
}
