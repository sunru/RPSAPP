//
//  RPSElement.swift
//  RPSAPP
//
//  Created by 廖晨如 on 2022/12/13.
//

import Foundation
import UIKit
enum RPSElement: String, CaseIterable{
    case worm, chicken, tiger, stick
    var displayImage: UIImage?{//Optional UIImage
        switch self{
        case .worm:
            return UIImage(named: "worm")
        case .chicken:
            return UIImage(named: "chicken")
        case .tiger:
            return UIImage(named: "tiger")
        case .stick:
            return UIImage(named: "stick")
        }
    }
}
