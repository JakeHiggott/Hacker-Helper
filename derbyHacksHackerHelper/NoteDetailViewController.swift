//
//  NoteDetailViewController.swift
//  derbyHacksHackerHelper
//
//  Created by Jake Higgot on 2/11/18.
//  Copyright © 2018 Jake Higgott. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    @IBOutlet weak var noteThingLabel: UILabel!
 
    func configure(for task: Task) {
        noteThingLabel?.text = task.thing
        self.view?.backgroundColor = task.color
    }
}


