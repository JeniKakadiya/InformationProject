//
//  HomeViewController.swift
//  informationData
//
//  Created by Jeni kakadiya on 7/1/21.
//  Copyright © 2021 Jeni kakadiya. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapNewEntry() {
        guard let vc = storyboard?.instantiateViewController(identifier: "EntryViewController") as? EntryViewController else {
            return
        }
        vc.title = "New Entry"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

    /*
     @IBAction func didTapNewNote() {
         guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
             return
         }
         vc.title = "New Note"
         vc.navigationItem.largeTitleDisplayMode = .never
         vc.completion = { noteTitle, note in
             self.navigationController?.popToRootViewController(animated: true)
          //   self.models.append(Details(id:, title: noteTitle, note: note))
             self.label.isHidden = true
             self.table.isHidden = false
             self.table.reloadData()
         }
         
         navigationController?.pushViewController(vc, animated: true)
     }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
