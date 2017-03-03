//
//  StudentListTableViewController.swift
//  StudentPutAPI
//
//  Created by Taylor Phillips on 2/22/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class StudentListTableViewController: UITableViewController {
    
    @IBAction func refreshControl(_ sender: UIRefreshControl) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        StudentController.fetchStudents { (_) in
            sender.endRefreshing()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, name.characters.count > 0 else { return }
        StudentController.putStudent(with: name) { (success) in
            guard success else {return}
            DispatchQueue.main.async {
                self.nameTextField.text = ""
                self.nameTextField.resignFirstResponder()
                self.fetchStudentList()
            }
        }
    }
    @IBOutlet weak var nameTextField: UITextField!
    
    var students: [Student] = []{
        didSet{
            
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStudentList()
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentsCell", for: indexPath)
        
        let student = students[indexPath.row]
        
        cell.textLabel?.text = student.name
        
        return cell
    }
    
    func fetchStudentList(){
        StudentController.fetchStudents { (students) in
            self.students = students
            
        }
    }
}
