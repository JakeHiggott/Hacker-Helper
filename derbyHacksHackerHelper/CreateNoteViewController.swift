//
//  CreateNoteViewController.swift
//  derbyHacksHackerHelper
//
//  Created by Jake Higgot on 2/11/18.
//  Copyright © 2018 Jake Higgott. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    @IBAction func cancelTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let text = taskTextField.text else { return }
        
        let task = Task(thing: text, color: .orange)
        TaskManager.sharedInstance.tasks.append(task)
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var taskTextField: UITextField!
}

