////
////  OptimizationPictureView.swift
////  AutoLayout
////
////  Created by yuency on 18/05/2018.
////  Copyright © 2018 yuency. All rights reserved.
////
//
//import UIKit
//
//
//
//
//// MARK: - 微博配图视图常量
////计算配图视图的宽度
////常数准备
////配图视图外侧间距
//let WBStatusPictureViewOtterMargin = CGFloat(12)
////配图视图内部图像视图的间距
//let WBStatusPictureViewInnerMargin = CGFloat(3)
////视图宽度
//let WBStatusPictureViewWidth = ScreenWidth - 2 * WBStatusPictureViewOtterMargin
////每个 item 默认的宽度
//let WBStatusPictureViewItemWidth = (WBStatusPictureViewWidth - 2 * WBStatusPictureViewInnerMargin) / 3
//
//
//
//
//
//
//class OptimizationPictureView: UIView {
//
//
////    var viewModel: WBStatusViewModel? {
////        didSet {
////            calcViewSize()
////
////            //设置配图, (包含了被转发和原创)
////            urls = viewModel?.picURLs
////        }
////    }
//
//    private func calcViewSize() {
//
//        //单图, 根据配图视图的大小, 修改 subviews[0] 的宽高
//        if viewModel?.picURLs?.count == 1 {
//
//            let viewSize = viewModel?.pictureViewSize ?? CGSize()
//            let v = subviews[0]
//            v.frame = CGRect(x: 0, y: WBStatusPictureViewOtterMargin, width: viewSize.width, height: viewSize.height - WBStatusPictureViewOtterMargin)
//
//        } else {
//
//            //多图(或者是没有图), 恢复 subviews[0] 的宽高, (因为这个方法不管在几张图片都会走进来,九宫格布局的完整)
//            let v = subviews[0]
//            v.frame = CGRect(x: 0, y: WBStatusPictureViewOtterMargin, width: WBStatusPictureViewItemWidth, height: WBStatusPictureViewItemWidth)
//        }
//
//        // 修改高度约束
//        heightCons.constant = viewModel?.pictureViewSize.height ?? 0
//    }
//
//
//
//    private var urls: [WBStatusPicture]? {
//        didSet{
//
//            //隐藏所有的 ImageView
//            for v in subviews {
//                v.isHidden = true
//            }
//
//            //遍历数组,按顺序设置图像
//            var index = 0
//            for url in urls ?? [] { //这样就不用解包
//                //获得对应索引的 imageView
//                let iv = subviews[index] as! UIImageView
//
//                //处理4张图像,变成4宫格,这样就跳过了设置第三个站位图像
//                if index == 1 && urls?.count == 4 {
//                    index += 1
//                }
//
//                //设置图像
//                iv.cz_setImage(urlString: url.thumbnail_pic, placeholderImage: nil)
//
//                //判断是否是 Gif 图像, 根据扩展名, 使用 OC 的拿到扩展名的方法
//                iv.subviews[0].isHidden = (((url.thumbnail_pic ?? "") as NSString).pathExtension.lowercased() != "gif")
//
//
//                //显示图像
//                iv.isHidden = false
//                index += 1
//            }
//        }
//    }
//
//
//    @IBOutlet weak var heightCons: NSLayoutConstraint!
//
//    /// 使用 XIB 开发通常使用这个函数
//    override func awakeFromNib() {
//        setUpUI()
//    }
//
//
//
//    /// 设置界面
//    //1.cell 中所有的控件都是提前准备好
//    //2.设置的时候根据数据决定是否显示
//    //3.不要动态创建控件
//    private func setUpUI()  {
//
//        //设置背景颜色,不要使用 clearcolor
//        backgroundColor = superview?.backgroundColor
//
//        //因为这里是循环创建出了9个, 就算只有一个图片也弄出了9个, 所以把配图视图进行裁切就看不到穿帮了
//        clipsToBounds = true
//
//        let count = 3
//
//        let rect = CGRect(x: 0, y: WBStatusPictureViewOtterMargin, width: WBStatusPictureViewItemWidth, height: WBStatusPictureViewItemWidth)
//
//        //循环创建9个, 九宫格的横竖算法就是 3 * 3 然后除数,和取余
//        for i in 0..<count * count {
//
//            let iv = UIImageView()
//
//            //设置 contentMode, 下面两个属性一起设置
//            iv.contentMode = .scaleAspectFill
//            iv.clipsToBounds = true
//
//            //便于调试颜色
//            //iv.backgroundColor = UIColor.red
//
//            //行 -> Y
//            let row = CGFloat(i / count)
//            //列 -> X
//            let col = CGFloat(i % count)
//
//            let xOffset = col * (WBStatusPictureViewItemWidth + WBStatusPictureViewInnerMargin)
//            let yOffset = row * (WBStatusPictureViewItemWidth + WBStatusPictureViewInnerMargin)
//
//            //先把 frame定义在外面,然后在这里改变他的偏移. 妙啊
//            iv.frame = rect.offsetBy(dx: xOffset, dy: yOffset)
//
//            addSubview(iv)
//
//            //设置 imageView 能够交互
//            iv.isUserInteractionEnabled = true
//            //添加手势识别
//            let tap = UITapGestureRecognizer(target: self, action: #selector(tapImageView(tap:)))
//            iv.addGestureRecognizer(tap)
//            iv.tag = i
//
//            addGifView(iv: iv)
//        }
//    }
//
//
//    /// 向图像视图添加 gif 图像
//    private func addGifView(iv: UIImageView) {
//
//        let gifImageView = UIImageView(image: UIImage(named: "timeline_image_gif"))
//        iv.addSubview(gifImageView)
//
//        //自动布局
//        // 第一步 ! 取消那啥
//        gifImageView.translatesAutoresizingMaskIntoConstraints = false
//        //把图标添加到右下角
//        iv.addConstraint(NSLayoutConstraint(item: gifImageView, attribute: .right, relatedBy: .equal, toItem: iv, attribute: .right, multiplier: 1.0, constant: 0))
//        iv.addConstraint(NSLayoutConstraint(item: gifImageView, attribute: .bottom, relatedBy: .equal, toItem: iv, attribute: .bottom, multiplier: 1.0, constant: 0))
//    }
//
//
//
//    /// 图片点击的方法
//    /// @param selectedIndex    选中照片索引
//    /// @param urls             浏览照片 URL 字符串数组
//    /// @param parentImageViews 父视图的图像视图数组，用户展现和解除转场动画参照
//    @objc private func tapImageView(tap: UITapGestureRecognizer) {
//
//
//        guard let iv = tap.view,
//            let picURLs = viewModel?.picURLs
//            else {
//                return
//        }
//
//        var selectedIndex = iv.tag
//
//        //针对4张图进行处理
//        if picURLs.count == 4 && selectedIndex > 1 {
//            selectedIndex -= 1
//        }
//
//        let urls = (picURLs as NSArray).value(forKey: "largePic") as! [String] // 使用 OC 中的数组, 使用 KVC 取出模型中的字段数据, 弄成一个字符串数组
//
//        //处理可见图像的数组
//        var imageViewList = [UIImageView]()
//
//        for iv in subviews as! [UIImageView] {
//
//            if !iv.isHidden {
//                imageViewList.append(iv)
//            }
//        }
//
//        //发送通知
//        NotificationCenter.default.post(
//            name: NSNotification.Name(rawValue: WBstatusCellBrowserPhotoNotification),
//            object: self,
//            userInfo: [WBstatusCellBrowserPhotoURLsKey: urls,                                                                                                             WBstatusCellBrowserPhotoSelectedIndexKey: selectedIndex,                                                                                                             WBstatusCellBrowserPhotoImageViewsKey: imageViewList])
//
//    }
//}
//
//
//
//
