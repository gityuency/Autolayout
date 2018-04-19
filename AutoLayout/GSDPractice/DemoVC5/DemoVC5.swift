//
//  DemoVC5.swift
//  AutoLayout
//
//  Created by yuency on 20/09/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit
import SDCycleScrollView

private let IDDemoVC5 = "dfsjakljdsaklfjdklsajfkldas"

class DemoVC5: UITableViewController {
    
    /// 数据模型
    var modelsArray =  Array<DemoVC5Model>()
    
    //MARK: - 数组正确的 get 和 set 姿势
    var arrayOne: Array<Any> {
        set{
        }
        get{
            return [""]
        }
    }
    
    //MARK: - 数组懒加载的正确姿势
    lazy var arrayTwo: Array<Any> = {
        
        return [""]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        creatModelsWithCount(10)
        
        setupHeaderView()
        
        tableView.register(DemoVC5TableViewCell.self, forCellReuseIdentifier: IDDemoVC5)
    }
    
    //MARK: -  给表格添加轮播图
    func setupHeaderView() {
        
        let header = UIView()
        let picImageNamesArray = ["pic1.jpg",
                                  "pic2.jpg",
                                  "pic3.jpg",
                                  "pic4.jpg",
                                  ]
        
        let scrollView = SDCycleScrollView()
        scrollView.localizationImageNamesGroup = picImageNamesArray
        header.addSubview(scrollView)
        
        let tagLabel = UILabel()
        tagLabel.font = UIFont.systemFont(ofSize: 13)
        tagLabel.textColor = UIColor.lightGray
        tagLabel.text = "不在意的样子是我最后的表演"
        header.addSubview(tagLabel)
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        header.addSubview(bottomLine)
        
        
        _ = scrollView.sd_layout().leftSpaceToView(header, 0)?.topSpaceToView(header, 0)?.rightSpaceToView(header, 0)?.heightIs(150)
        
        _ = tagLabel.sd_layout().leftSpaceToView(header, 10)?.topSpaceToView(scrollView, 0)?.heightIs(25)?.rightSpaceToView(header, 0)
        
        _ = bottomLine.sd_layout().topSpaceToView(tagLabel, 0)?.leftSpaceToView(header, 0)?.rightSpaceToView(header, 0)?.heightIs(1);
        
        //使用这句话来让 header 内部的元素进行自动适应
        header.setupAutoHeight(withBottomView: bottomLine, bottomMargin: 0)
        header.layoutSubviews()
        
        tableView.tableHeaderView = header
        
    }
    
    
    // MARK: -  表格代理协议
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: IDDemoVC5, for: indexPath) as! DemoVC5TableViewCell
        
        
        cell.model = modelsArray[indexPath.row]
        
        ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
        cell.useCellFrameCache(with: indexPath, tableView: tableView)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // >>>>>>>>>>>>>>>>>>>>> * cell自适应步骤2 * >>>>>>>>>>>>>>>>>>>>>>>>
        /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
        return tableView.cellHeight(for: indexPath, model: modelsArray[indexPath.row], keyPath: "model", cellClass: DemoVC5TableViewCell.self, contentViewWidth: UIScreen.main.bounds.size.width)
    }
    
    
    /// 创建数据模型
    private func creatModelsWithCount(_ count: Int) {
        
        let iconImageNamesArray = ["icon0.jpg",
                                   "icon1.jpg",
                                   "icon2.jpg",
                                   "icon3.jpg",
                                   "icon4.jpg",
                                   ]
        
        let namesArray = ["徐良",
                          "wang'su'long",
                          "当今世界网名都不好起了",
                          "我叫郭德纲",
                          "Hello Kitty",
                          ]
        
        let textArray = ["当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                         "然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                         "当你的 app 没有提供 3x 的 LaunchImage 时",
                         "但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                         "屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下。",
                         ]
        
        let picImageNamesArray = ["pic0.jpg",
                                  "pic1.jpg",
                                  "pic2.jpg",
                                  "pic3.jpg",
                                  "pic4.jpg",
                                  ]
        
        for _ in 0..<count {
            let iconRandomIndex =  Int(arc4random_uniform(5))
            let nameRandomIndex =  Int(arc4random_uniform(5))
            let contentRandomIndex =  Int(arc4random_uniform(5))
            let picRandomIndex =  Int(arc4random_uniform(5))
            
            let model = DemoVC5Model()
            model.iconName = iconImageNamesArray[iconRandomIndex];
            model.name = namesArray[nameRandomIndex];
            model.content = textArray[contentRandomIndex];
            
            // 模拟“有或者无图片”
            let random =  Int(arc4random_uniform(100))
            
            if (random <= 80) {
                model.picName = picImageNamesArray[picRandomIndex];
            }
            modelsArray.append(model)
        }
    }
}
