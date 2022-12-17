//
//  RPSStatus.swift
//  RPSAPP
//
//  Created by 廖晨如 on 2022/12/17.
//

import Foundation
enum RPSStatus: String{
    case win, lose, draw
    var result: String{
        switch self{
        case .win:
            return "恭喜你贏了"
        case .lose:
            return "你輸了"
        case .draw:
            return "平手"
        }
    }
}
