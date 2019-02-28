//
//  ItemPointTableViewCell.swift
//  五星评分系统
//
//  Created by USER on 2019/02/27.
//  Copyright © 2019 ZZL. All rights reserved.
//

import UIKit

class ItemPointTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var firstStar: UIButton!
    @IBOutlet weak var secondStar: UIButton!
    @IBOutlet weak var thirdStar: UIButton!
    @IBOutlet weak var forthStar: UIButton!
    @IBOutlet weak var fifthStar: UIButton!
    
    var row:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupStar()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //做一个方法，改变星星的图片
    func changeStar(images:[UIButton]){
        for button in images{
            button.setBackgroundImage(#imageLiteral(resourceName: "star_Selected.png") ,for: .normal)
        }
    }
    
    func changeStar2(tag:Int){
        switch tag {
        case 1:
            changeStar(images: [firstStar])
        case 2:
            changeStar(images: [firstStar,secondStar])
        case 3:
            changeStar(images: [firstStar,secondStar,thirdStar])
        case 4:
            changeStar(images: [firstStar,secondStar,thirdStar,forthStar])
        case 5:
            changeStar(images: [firstStar,secondStar,thirdStar,forthStar,fifthStar])
        default:
            break
        }
        selectedItemArray[row].point = tag
    }
    //给按键添加方法， 根据sender.tag判断应该怎么改变星星的图片
    @IBAction func starButton(_ sender: UIButton) {
        setupStar()
        changeStar2(tag: sender.tag)
    }
    
    
    //做一个方法，用于还原星星图片
    func setupStar(){
        firstStar.setBackgroundImage(#imageLiteral(resourceName: "star_Default.png"), for: .normal)
        secondStar.setBackgroundImage(#imageLiteral(resourceName: "star_Default.png"), for: .normal)
        thirdStar.setBackgroundImage(#imageLiteral(resourceName: "star_Default.png"), for: .normal)
        forthStar.setBackgroundImage(#imageLiteral(resourceName: "star_Default.png"), for: .normal)
        fifthStar.setBackgroundImage(#imageLiteral(resourceName: "star_Default.png"), for: .normal)
        
        itemNameLabel.text = selectedItemArray[row].itemName
        itemImage.image = UIImage(named: selectedItemArray[row].imageName ?? "")
        changeStar2(tag: selectedItemArray[row].point ?? 0)
    }
}

