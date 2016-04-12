//
//  AppListCell.swift
//  HAppList-Swift
//
//  Created by JuanFelix on 4/12/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

import UIKit

protocol AppListCellDelegate:NSObjectProtocol {
    func appListCellStarMarked(isStar:Bool,cell:AppListCell)
}

class AppListCell: UITableViewCell {

    @IBOutlet weak var btnDownLoad: UIButton!
    @IBOutlet weak var btnStar: UIButton!
    @IBOutlet weak var lbArtistName: UILabel!
    @IBOutlet weak var lbAppName: UILabel!
    @IBOutlet weak var imgIcon: UIImageView!
    
    
    weak var delegate:AppListCellDelegate?
    
    var downloadurl = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnStar.titleLabel?.font = UIFont(name: Iconfont, size: 30)
        btnStar.setTitle(IF_Star_UNFill, forState: .Normal)
        btnStar.setTitle(IF_Star_Fill, forState: .Selected)
        btnStar.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btnStar.setTitleColor(UIColor.orangeColor(), forState: .Selected)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func starAction(sender: UIButton) {
        btnStar.selected = btnStar.selected ? false : true
        delegate?.appListCellStarMarked(btnStar.selected, cell: self)
    }
    
    @IBAction func downloadAction(sender: UIButton) {
        if let url = NSURL(string: downloadurl) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func reloadCellData(model:AppCellModel) {
        if let url = NSURL(string: model.iconUrl) {
            imgIcon.loadImageWithURL(url)
        }else {
            imgIcon.image = nil
        }
        
        lbAppName.text = model.appName
        lbArtistName.text = model.artistName
        downloadurl = model.downloadUrl
        btnStar.selected = model.isStar
    }
    
}
