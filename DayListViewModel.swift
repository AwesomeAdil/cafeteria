//
//  DaysList.swift
//  help
//
//  Created by adil bhatti on 6/25/21.
//

import Foundation
import Combine

class DaysList: ObservableObject{
    
    @Published var dayViewModel = [Day]()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
//        self.dayViewModel = tester.map{ foods in
//            dayViewModel(Day: dayViewModel)
            
        }
    
    
    
    }
    

