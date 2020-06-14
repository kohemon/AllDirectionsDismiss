//
//  ScrollViewController.swift
//  Demo
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit
import AllDirectionsDismiss

class ScrollViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    var fourDirection: AllDirectionsDismiss?
    var dismissData: ViewController.DismissData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scroll"
        tableView.delegate = self
        tableView.dataSource = self
        
        fourDirection = AllDirectionsDismiss(scrollView: tableView)
        // set percent to dismiss
        fourDirection?.dismissPercent = dismissData!.percent
        // set velocity to dismiss
        fourDirection?.dismissVelocity = dismissData!.velocity
        // set alpha to background view alpha
        fourDirection?.backgroundAlpha = dismissData!.backgroundAlpha
        // set alpha to background view color
        fourDirection?.backgroundColor = dismissData!.backgroundColor
        
        // add dismiss gesture to other view when use scrollview
        let headerPanGesture = DragDismissGestureRecognizer()
        headerView.addGestureRecognizer(headerPanGesture)
        fourDirection?.addDismissGesture(panGesture: headerPanGesture)
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension ScrollViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        return cell
    }
    
}
