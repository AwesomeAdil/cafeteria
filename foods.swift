//
//  foods.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//

import Foundation


struct Foods: Identifiable{
    
    let id: String = UUID().uuidString
    let name: String
    let pic: String
    let desc: String
    let avgamtused: Double
    let times: [Date]
    let popupper: Double
    let popmiddle: Double
    let poplower: Double
    
    
    
}


let tester = [
    Foods(name: "Taco Basket", pic: "Taco Basket", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "Salmon Sushi Bowl", pic: "Salmon Sushi Bowl", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "Chicken Noodle Soup", pic: "Chicken Noodle Soup", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "Sandwich Bar", pic: "Sandwich Bar", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "Chicken Pot Pie", pic: "Chicken Pot Pie", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "BYO Nachos", pic: "BYO Nachos", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "Pasta Bar", pic: "Pasta Bar", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0),
    Foods(name: "Baked Potato Bar", pic: "Baked Potato Bar", desc: "Very Yummy in my tummy", avgamtused: 1.0, times: [], popupper: 5.0, popmiddle: 5.0, poplower: 5.0)
]
