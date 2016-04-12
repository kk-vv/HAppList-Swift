//
//  SearchUtils.swift
//  HAppList-Swift
//
//  Created by JuanFelix on 4/12/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

import Foundation
import Alamofire

typealias sCompletion = (Bool,[String: AnyObject]?) -> Void

class SearchUtils: NSObject {
    
    static func requestAppList(name:String!,completion:sCompletion?) {
        let searchURL = "https://itunes.apple.com/search?term=\(name)&limit=30&entity=software"
        
        //MARK: 更多使用方法请参考
        // https://github.com/Alamofire/Alamofire
        
        Alamofire.request(.GET, searchURL)
        .responseJSON { response in
            if let json = response.result.value {
                completion?(true,(json as! [String : AnyObject]))
            }else {
                completion?(false,nil)
            }
        }
    }
}
