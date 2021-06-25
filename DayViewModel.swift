//
//  Days.swift
//  help
//
//  Created by adil bhatti on 6/25/21.
//

import Foundation


struct Day: Identifiable {
    
    let id: String = UUID().uuidString
    let date: Date
    let missingGroups: [String]
    
    init(_ date: Date){
        self.date = date
        missingGroups = []
    }
    
    
  
    
    
}
