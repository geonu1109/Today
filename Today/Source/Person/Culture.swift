//
//  Culture.swift
//  Today
//
//  Created by Geonu Jeon on 2021/10/25.
//

import Foundation

struct Culture {
    var name: String
    var nameOrder: PersonalName.Order
    
    static let korean: Culture = .init(name: "Korean", nameOrder: .eastern)
    static let american: Culture = .init(name: "American", nameOrder: .western)
}
