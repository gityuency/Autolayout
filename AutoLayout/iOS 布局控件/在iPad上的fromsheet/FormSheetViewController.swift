//
//  FormSheetViewController.swift
//  POP
//
//  Created by EF on 2019/8/15.
//  Copyright © 2019 姬友大人. All rights reserved.
//

import UIKit

class FormSheetViewController: UIViewController {
    
    deinit {
        print("FormSheetViewController 控制器销毁了")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "导航栏出现了"
    }
    
    func resolveCircle() {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    /// 设置当前控制器没有 NavigationBar
    @IBAction func actionNoNavi(_ sender: UIButton) {
        resolveCircle()
        let vc = FormSheetViewController()
        UIApplication.shared.keyWindow?.rootViewController = vc
    }
    
    /// 设置当前控制器 有 NavigationBar
    @IBAction func actionAddNavi(_ sender: Any) {
        resolveCircle()
        let vc = FormSheetViewController()
        let navi = UINavigationController(rootViewController: vc)
        UIApplication.shared.keyWindow?.rootViewController = navi
    }
    
    /// 方案一:
    @IBAction func actionOne(_ sender: UIButton) {
        let vc = ControllerPopOniPad()
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    /// 方案二:
    @IBAction func actionTwo(_ sender: UIButton) {
        let vc = ControllerPopOniPad()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .formSheet
        navi.modalTransitionStyle = .crossDissolve
        self.present(navi, animated: true, completion: nil)
    }
    
    /// 方案三:
    @IBAction func actionThree(_ sender: UIButton) {
        let vc = ControllerPopOniPad()
        vc.modalPresentationStyle = .formSheet
        vc.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    /// 方案四:
    @IBAction func actionFour(_ sender: UIButton) {
        let vc = ControllerPopOniPad()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .formSheet
        navi.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(navi, animated: true, completion: nil)
    }
    
    /// 方案五:
    @IBAction func actionFiv(_ sender: UIButton) {
        //操作1
        let vc = ControllerPopOniPad()
        let navi = UINavigationController(rootViewController: vc)
        navi.modalPresentationStyle = .formSheet
        navi.modalTransitionStyle = .crossDissolve
        //vc.preferredContentSize = CGSize(width: 300, height: 300) //可以直接设置 VC
        navi.preferredContentSize = CGSize(width: 300, height: 300) //设置Navi也可以
        self.present(navi, animated: true, completion: nil)
        
        //操作2
        //let vc = ControllerUseSystemNaviBar()
        //vc.modalPresentationStyle = .formSheet
        //vc.modalTransitionStyle = .crossDissolve
        //vc.preferredContentSize = CGSize(width: 200, height: 600)
        //self.present(vc, animated: true, completion: nil)
    }
}
