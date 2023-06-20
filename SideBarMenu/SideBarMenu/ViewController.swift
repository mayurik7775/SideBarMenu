//
//  ViewController.swift
//  SideBarMenu
//
//  Created by Mac on 19/06/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource {
    
    
    var arrdata = ["UserName","Email","Education","Mobail","LogOut"]
    var arrimg = ["Person","Email","education","mobails","Lock"]
    
    
    var isSideViewOpen: Bool = false
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideBar: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideView.isHidden = true
        sideBar.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.img.image = UIImage(named: arrimg[indexPath.row])
        cell.lbl.text = arrdata[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
   
    @IBAction func btnmenu(_ sender: UIButton) {
    sideBar.isHidden = false
        sideView.isHidden = false
        self.view.bringSubviewToFront(sideView)
        if !isSideViewOpen{
            isSideViewOpen = true
            sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 474)
            sideBar.frame = CGRect(x: 0, y: 0, width: 0, height: 474)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil)
            sideView.frame = CGRect(x: 0, y: 88, width: 246, height: 474)
            sideBar.frame = CGRect(x: 0, y: 0, width: 246, height: 474)
            UIView.commitAnimations()
        }else{
            sideBar.isHidden = true
                sideView.isHidden = true
                self.view.bringSubviewToFront(sideView)
                if !isSideViewOpen{
                    isSideViewOpen = false
                    sideView.frame = CGRect(x: 0, y: 88, width: 246, height: 474)
                    sideBar.frame = CGRect(x: 0, y: 0, width: 246, height: 474)
                    UIView.setAnimationDuration(0.3)
                    UIView.setAnimationDelegate(self)
                    UIView.beginAnimations("TableAnimation", context: nil)
                    sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 474)
                    sideBar.frame = CGRect(x: 0, y: 0, width: 0, height: 474)
                    UIView.commitAnimations()
        }
        
    }
    
}
}
