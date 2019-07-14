//
//  PreviewTasksViewController.swift
//  To Do
//
//  Created by Mohammad Shaker on 7/14/19.
//  Copyright © 2019 Mohammad Shaker. All rights reserved.
//

import UIKit

class PreviewTasksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }

}


extension PreviewTasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        #warning("Simulation code")
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.checkBox.stateChangeAnimation = .bounce(.fill)
        return cell
    }
}
