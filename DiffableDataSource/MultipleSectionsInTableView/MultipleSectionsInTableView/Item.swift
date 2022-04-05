//
//  Item.swift
//  MultipleSectionsInTableView
//
//  Created by sole on 2022/04/05.
//

import Foundation

struct Item: Hashable {
    let name: String
    let price: Double
    let category: Category
    let identifier = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    // test data
    static func getTestData() -> [Item] {
        return [
            Item(name: "Polar Bluetooth Stride Sensor", price: 10.00, category: .running),
            Item(name: "DonJoy Performance POD Ankle Brace", price: 55.66, category: .running),
            Item(name: "Cracking the Coding Interview", price: 26.99, category: .education),
            Item(name: "The Pragmatic Programmer", price: 42.35, category: .education),
            Item(name: "Tri shoes", price: 120.00, category: .triathlon),
            Item(name: "Tri shuit", price: 240.00, category: .triathlon),
            Item(name: "Towel hooks", price: 50.00, category: .hosehold),
            Item(name: "Beginner Microscope STEM Kit", price: 39.99, category: .education),
            Item(name: "Fitbit Versa 2", price: 199.95, category: .technology),
            Item(name: "BISSELL Cleanview Swivel Pet", price: 99.99, category: .hosehold),
            Item(name: "NinJa Professtional", price: 89.99, category: .hosehold),
            Item(name: "Debrox Swimmer;s Ear", price: 7.99, category: .health),
            Item(name: "Tylenol Extra Strength", price: 9.47, category: .health)
        ]
    }
}
