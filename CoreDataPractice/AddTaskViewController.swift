//
//  AddTaskViewController.swift
//  CoreDataPractice
//
//  Created by 坂本龍哉 on 2021/01/12.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var isImportant: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        let content = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // Entitiesで作成したTaskの内容を定数化
        let task = Task(context: content)
        // Entitiesで作成した項目に保存する処理
        task.name = textField.text!
        task.isimportant = isImportant.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
