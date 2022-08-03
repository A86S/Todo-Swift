//
//  TaskViewController.swift
//  Tasks
//
//  Created by Admin on 02/08/22.
//

import UIKit

class TaskViewController: UIViewController {

    var task: String?
    var index: Int?
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label.text = task
        print("Index", index!)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
       
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count - 1
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().removeObject(forKey: "task_\(index!)")
        
        navigationController?.popViewController(animated: true)
    }
}
