//
//  TasksManager.swift
//  derbyHacksHackerHelper
//
//  Created by Jake Higgot on 2/11/18.
//  Copyright © 2018 Jake Higgott. All rights reserved.
//

import Foundation

class TaskManager {
    
    var tasks = [
        Task(thing: "Add Todo lists here", color: .blue),
        
        
    ]
    
    static let sharedInstance = TaskManager()
    
    
    func createTestData() {
        tasks = [
            Task(thing: "walk dog", color: .blue),
            Task(thing: "walk cat", color: .green),
            Task(thing: "eat dinner", color: .yellow),
            Task(thing: "have good time", color: .red)
        ]
    }

}
