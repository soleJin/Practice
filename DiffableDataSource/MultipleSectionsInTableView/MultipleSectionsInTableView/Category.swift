//
//  Category.swift
//  MultipleSectionsInTableView
//
//  Created by sole on 2022/04/05.
//

import Foundation

enum Category: Int, CaseIterable {
    case running
    case technology
    case education
    case health
    case hosehold
    case triathlon
    case soppingCart
    
    var sectionHeaderTitle: String {
        switch self {
        case .running:
            return "Running"
        case .technology:
            return "Technology"
        case .education:
            return "Education"
        case .health:
            return "Health"
        case .hosehold:
            return "Household"
        case .triathlon:
            return "Triathlon"
        case .soppingCart:
            return "Cart"
        }
    }
}
