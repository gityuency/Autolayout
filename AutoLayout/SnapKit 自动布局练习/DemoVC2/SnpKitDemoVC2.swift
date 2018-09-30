//
//  SnpKitDemoVC2.swift
//  AutoLayout
//
//  Created by yuency on 20/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit

class SnpKitDemoVC2: UIViewController {

    var tableview = UITableView()
    
    let viewModel = SnpKitDemoVC2ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    private func setUpTableView() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(tableview)
        tableview.tableFooterView = UIView()
        tableview.register(SnpKit_DemoVC_2_Cell.self, forCellReuseIdentifier: SnpKit_DemoVC_2_Cell.resuseId)
        
        tableview.estimatedRowHeight = 130;
        
        /*
         在 iOS 11不写下面这句代码是可以的, 但是在 iOS 9 / iOS 10 不写这个代码布局就会错乱
         */
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


extension SnpKitDemoVC2: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.dataArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SnpKit_DemoVC_2_Cell.resuseId, for: indexPath) as! SnpKit_DemoVC_2_Cell
        cell.nameLabel.text = model.leftTitle
        cell.contentLabel.text = model.rightTitle
        cell.headImageView.image = model.image
        return cell
    }
    
 
}

