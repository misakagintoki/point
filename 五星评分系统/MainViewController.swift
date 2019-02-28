//
//  MainViewController.swift
//  五星评分系统
//
//  Created by USER on 2019/02/27.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

var itemArray:[ItemInfo]  = [ItemInfo(itemName: "电影", imageName: filmArray[0].imageName ?? ""),
                             ItemInfo(itemName: "音乐", imageName: musicArray[0].imageName ?? "")]

var filmArray:[ItemInfo]  = [ItemInfo(itemName: "Aimer-Dawn"      , imageName: "Aimer-Dawn"),
                             ItemInfo(itemName: "Aimer-AfterDark" , imageName: "Aimer-AfterDark"),
                             ItemInfo(itemName: "Aimer-blanr"     , imageName: "Aimer-blanr"),
                             ItemInfo(itemName: "Aimer-蝶々"       , imageName: "Aimer-蝶々"),
                             ItemInfo(itemName: "Aimer-Dawn"      , imageName: "Aimer-Dawn"),
                             ItemInfo(itemName: "Aimer-AfterDark" , imageName: "Aimer-AfterDark"),
                             ItemInfo(itemName: "Aimer-blanr"     , imageName: "Aimer-blanr"),
                             ItemInfo(itemName: "Aimer-蝶々"       , imageName: "Aimer-蝶々"),
                             ItemInfo(itemName: "Aimer-Dawn"      , imageName: "Aimer-Dawn"),
                             ItemInfo(itemName: "Aimer-AfterDark" , imageName: "Aimer-AfterDark"),
                             ItemInfo(itemName: "Aimer-blanr"     , imageName: "Aimer-blanr"),
                             ItemInfo(itemName: "Aimer-蝶々"       , imageName: "Aimer-蝶々"),
                             ItemInfo(itemName: "Aimer-Dawn"      , imageName: "Aimer-Dawn"),
                             ItemInfo(itemName: "Aimer-AfterDark" , imageName: "Aimer-AfterDark"),
                             ItemInfo(itemName: "Aimer-blanr"     , imageName: "Aimer-blanr"),
                             ItemInfo(itemName: "Aimer-蝶々"       , imageName: "Aimer-蝶々")]
var musicArray:[ItemInfo] = [ItemInfo(itemName: "Aimer-AfterDark", imageName: "Aimer-AfterDark"),
                             ItemInfo(itemName: "Aimer-blanr"    , imageName: "Aimer-blanr"),
                             ItemInfo(itemName: "Aimer-蝶々"      , imageName: "Aimer-蝶々"),
                             ItemInfo(itemName: "Aimer-Dawn"      , imageName: "Aimer-Dawn")]

class MainViewController: UIViewController {
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self
    }
    
    
}

extension MainViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FileCell", for: indexPath) as! FileCollectionViewCell
        
        //建立cell，除了最后一个cell是新增外，其余就用于表现收藏夹内容 -- 成功
        if indexPath.row < itemArray.count{
            cell.itemNameLabel.text = itemArray[indexPath.row].itemName
            cell.itemImageView.image = UIImage(named: itemArray[indexPath.row].imageName ?? "")
            
            return cell
        }else{
            cell.itemNameLabel.text = "新增"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //给最后一个cell之外的其他cell添加翻页功能 - 成功
        if indexPath.row < itemArray.count{
            performSegue(withIdentifier: "InfoSegue", sender: indexPath.row )
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoSegue"{
            let nextPageVC = segue.destination as! ItemInfoViewController
            //传值，通过被选中的indexPatch，传项目的名字和数组过去 - 成功
            nextPageVC.itemName = itemArray[sender as! Int].itemName ?? ""
            switch itemArray[sender as! Int].imageName{
            case filmArray[0].imageName:
                nextPageVC.selectedItemArray = filmArray
            case musicArray[0].imageName:
                nextPageVC.selectedItemArray = musicArray
            default:
                break
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //判断cell的Size
        let cellWidth = (collectionView.frame.width / 2) - 10
        let cellHeight = cellWidth
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
