//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Yiyin Shen on 15/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var courseTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapAddStudent(_ sender: Any) {
        guard let id = idTextField.text, let name = nameTextField.text, let course = courseTextField.text else { return }
        if CoreDataManager.saveStudent(id: id, name: name, course: course) {
            print(" saved successfully")
        } else {
            print(" failed to save")
        }
    }

    @IBAction func didTapFetch(_ sender: Any) {
        let students: [Student]? = CoreDataManager.fetchStudent()
        print("=================================")
        students?.forEach({ (student) in
            print("Student: \(student.id ?? "") \(student.name ?? "") \(student.course ?? "")")
        })
        print("=================================")
    }
}

