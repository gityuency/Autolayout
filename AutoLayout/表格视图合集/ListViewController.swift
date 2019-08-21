//
//  ListViewController.swift
//  AutoLayout
//
//  Created by EF on 2019/6/13.
//  Copyright © 2019 yuency. All rights reserved.
//

import UIKit

private let ListViewControllerCellID = "ListViewControllerCellID"

class ListViewController: UITableViewController {

    let listArray = [
        ["FakeCollectionViewController": "如何伪造一个Collectionview 的 Footer View"],
        ["Coll_1_ViewController": "Cell 滑动放大"],
        ["CollectionViewLeftAlignController": "UICollectionViewCell 左对齐"],
        ["ExampleOfUICollectionViewController": "UICollectionView 基本用法"],
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tableview,CollectionView合集"
        tableView.estimatedRowHeight = 150;
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ListViewControllerCellID)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewControllerCellID, for: indexPath)
        cell.textLabel?.text = "\(Array(listArray[indexPath.row].values)[0])"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage.init(named: "jinshuo")
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName = Array(listArray[indexPath.row].keys)[0]
        if let cls = NSClassFromString(Bundle.main.nameSpaceStirng + "." + vcName) as? UIViewController.Type {
            let vc = cls.init()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
