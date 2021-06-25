//
//  FoodListViewModel.swift
//  help
//
//  Created by adil bhatti on 6/14/21.
//

import Foundation
import Combine

class FoodListViewModel: ObservableObject{
    @Published var foodViewModel = [FoodViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.foodViewModel = tester.map{ foods in
            FoodViewModel(food: foods)
            
        }
    }
    
    
}
