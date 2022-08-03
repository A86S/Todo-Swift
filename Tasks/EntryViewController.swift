//
//  EntryViewController.swift
//  Tasks
//
//  Created by Admin on 02/08/22.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    @objc func saveTask() {
        
        var tasks = UserDefaults().stringArray(forKey: "tasks")  ?? [String]()
        
        guard  let text = field.text, !text.isEmpty else {
            return
        }
        
        tasks.append(text)
        UserDefaults().set(tasks , forKey: "tasks")
        navigationController?.popViewController(animated: true)
    }
}
