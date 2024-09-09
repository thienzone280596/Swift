//
//  Room.swift
//  RoomsApp
//
//  Created by Mohammad Azam on 9/19/23.
//

import Foundation
import SwiftData
import UIKit

@Model
class Room {
    var name: String
    @Attribute(.transformable(by: UIColorValueTransformer.self)) var color: UIColor
    
    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
