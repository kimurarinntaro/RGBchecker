//
//  List.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/20.
//

import Foundation
import UIKit

struct List:Codable{
    var test:CGFloat
}

var Lists:[List] = []

func saveBookmarks(Lists:[List]){
    let jsonEncoder = JSONEncoder()
    guard let data = try? jsonEncoder.encode(Lists) else {
        return
    }
    UserDefaults.standard.set(data,forKey: "bookmarks")
}
