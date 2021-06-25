//
//  FoodViewModel.swift
//  help
//
//  Created by adil bhatti on 6/14/21.
//

import Foundation
import Combine

class FoodViewModel: ObservableObject, Identifiable{
    
    @Published var food: Foods
    
    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(food: Foods){
        self.food = food
        
        
        $food
            .map{ food in
                food.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
        
        
        
    }
    
    
    
    
}
