//
//  SelectColor.swift
//  GrapeTodo
//
//  Created by changhyen yun on 4/30/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
//    static let unchecked = Color(hex:"#F4F4F4")
//    static let checked = Color(hex: "#BAF7AD")
}


enum SelectColor: String, CaseIterable {
    case unchecked, checked
    
    var representable: Color {
        switch self {
        case .unchecked: Color(Color(hex: "#F4F4F4"))
        case .checked: Color(Color(hex: "#BAF7AD"))
        }
    }
}

//enum SelectColor: String, CaseIterable {
//    case red, orange, yellow, green, blue, purple
//    
//    var representable: Color {
//        switch self {
//        case .red: .red
//        case .orange: .orange
//        case .yellow: .yellow
//        case .green: .green
//        case .blue: .blue
//        case .purple: .purple
//        }
//    }
//}
