//
//  GrapeModel.swift
//  GrapeTodo
//
//  Created by 김승원 on 5/2/24.
//

import Foundation
import SwiftData


struct GrapeModel {
    var id: Int
    var isCompleted: Bool

    init(id: Int, isCompleted: Bool) {
        self.id = id
        self.isCompleted = isCompleted
    }
}
