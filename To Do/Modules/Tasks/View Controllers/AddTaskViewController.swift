//
//  AddTaskViewController.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit
import Firebase
import DateTimePicker
import SkyFloatingLabelTextField

class AddTaskViewController: UIViewController {

    @IBOutlet weak var titleTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var dateTimeTextField: SkyFloatingLabelTextField!
    
    private var dateTimePickerView: DateTimePicker?
    private var selectedDate = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSelectedDate()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        dateTimeTextField.addTarget(self, action: #selector(showDateTimePicker), for: .touchDown)
        dateTimeTextField.delegate = self
    }
    
    private func selectedDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: selectedDate)
    }
    
    private func showSelectedDate() {
        dateTimeTextField.text = selectedDateTime()
    }

    @objc func doneButtonTapped() {
        var task = Task()
        task.title = titleTextField.text
        task.dateTime = selectedDateTime()
        TasksHandler.shared.insertTask(task: task)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func showDateTimePicker() {
        if dateTimePickerView == nil {
            let minimumDate = Date().addingTimeInterval(-60 * 60 * 24 * 4)
            dateTimePickerView = DateTimePicker.create(minimumDate: minimumDate, maximumDate: nil)
            dateTimePickerView!.frame = CGRect(x: 0, y: 100, width: dateTimePickerView!.frame.size.width, height: dateTimePickerView!.frame.size.height)
            dateTimePickerView?.highlightColor = UIColor.primaryAppColor
            dateTimePickerView?.delegate = self
        }
        dateTimePickerView?.show()
    }
}


extension AddTaskViewController: DateTimePickerDelegate {
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        selectedDate = didSelectDate
        showSelectedDate()
    }
}


extension AddTaskViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}
