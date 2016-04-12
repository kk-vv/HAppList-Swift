//
//  AppCellModel.swift
//  HAppList-Swift
//
//  Created by JuanFelix on 4/12/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

import UIKit

class AppCellModel: NSObject {
    var iconUrl     = ""
    var appName     = ""
    var artistName  = ""
    var isStar      = false
    var downloadUrl = ""
    
    func buildModel(dicP: [String: AnyObject]!) {
        iconUrl = dicP["artworkUrl100"] as! String
        appName = dicP["trackName"] as! String
        artistName = dicP["artistName"] as! String
        downloadUrl = dicP["trackViewUrl"] as! String
    }
}
