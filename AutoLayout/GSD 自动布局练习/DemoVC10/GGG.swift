//
//  GGG.swift
//  AutoLayout
//
//  Created by yuency on 16/10/2017.
//  Copyright © 2017 yuency. All rights reserved.
//

import UIKit

class GGG: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell  = tableView .dequeueReusableCell(withIdentifier: "fdsafjhdslafjdsaf", for: indexPath)
        
        cell.textLabel?.text = "hfdklsajk;dsfjkldjfdklsjfkldasj"
        return cell
        
    }
    

    
    let ttttttt = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ttttttt.frame = view.bounds
        ttttttt.delegate = self
        ttttttt.dataSource = self
        ttttttt.backgroundColor = UIColor.brown
        ttttttt.register(UITableViewCell.self, forCellReuseIdentifier: "fdsafjhdslafjdsaf")
        view.addSubview(ttttttt)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
