//
//  ItemInfoViewController.swift
//  五星评分系统
//
//  Created by USER on 2019/02/27.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

var selectedItemArray:[ItemInfo] = []

class ItemInfoViewController: UIViewController {
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemInfoTableView: UITableView!
    
    var itemName = ""
//    var selectedItemArray:[ItemInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemNameLabel.text = itemName
        itemInfoTableView.delegate = self
        itemInfoTableView.dataSource = self
    }
}

extension ItemInfoViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PointCell", for: indexPath) as! ItemPointTableViewCell
        cell.row = indexPath.row
        cell.setupStar()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

