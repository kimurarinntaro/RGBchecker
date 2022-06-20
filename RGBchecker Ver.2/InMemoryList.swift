//
//  InMemoryList.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/19.
//

import Foundation
import UIKit

protocol InMemoryListRepository{
    var count:Int { get }
    func add(value:CGFloat)
}

//final class InMemoryList:InMemoryListRepository{
//    
//    var RedColorList:[CGFloat] = []
//    var GreenColorList:[CGFloat] = []
//    var BlueColorList:[CGFloat] = []
//
//
//    var count: Int{
//        get {
//            RedColorList.count
//        }
//    }
//
//    func add(value:CGFloat){
//        RedColorList.append(value)
//        UserDefaults.standard.set(RedColorList, forKey: "R")
//        debugPrint(RedColorList)
//        debugPrint(RedColorList.count)
//    }
//    
//}
