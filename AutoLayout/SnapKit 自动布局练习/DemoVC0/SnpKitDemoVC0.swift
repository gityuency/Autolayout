//
//  SnpKitDemoVC0.swift
//  AutoLayout
//
//  Created by yuency on 19/04/2018.
//  Copyright © 2018 yuency. All rights reserved.
//

import UIKit
import SnapKit

class SnpKitDemoVC0: UIViewController {
    
    var tableview = UITableView()
    
    let viewModel = SnpKitDemoVC0ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Contacts"
        
        setUpTableView()
        
    }
    
    private func setUpTableView() {
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(tableview)
        tableview.tableFooterView = UIView()
        tableview.register(EFPAFamilyCell.self, forCellReuseIdentifier: EFPAFamilyCell.resuseId)
        tableview.register(EFPAFamilyHeader.self, forHeaderFooterViewReuseIdentifier: EFPAFamilyHeader.resuseId)
        
        tableview.estimatedRowHeight = 130;
        tableview.rowHeight = UITableViewAutomaticDimension;

        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.snp.makeConstraints({ make in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
            make.left.right.equalTo(view)
        })
    }    
}

extension SnpKitDemoVC0: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = viewModel.dataArray[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EFPAFamilyCell.resuseId, for: indexPath) as! EFPAFamilyCell
        
        let image = UIImage(named: "a02")
        cell.headImageView.kf.setImage(with: nil, placeholder: image)
        cell.nameLabel.text = model.name
        cell.tipLabel.text = "标签"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: EFPAFamilyHeader.resuseId) as! EFPAFamilyHeader
        header.nameLabel.text = "组的名字"
        header.closed = false
        header.section = section
        header.delegate = self
        return header
    }
}

extension SnpKitDemoVC0: EFPAFamilyHeaderCloseProtocol {
    func didCloseGroup(section: Int, header _: EFPAFamilyHeader) {
    }
}

extension SnpKitDemoVC0: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

