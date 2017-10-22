//
//  MemoDetailViewVC.swift
//  Chapter01 Memo
//
//  Created by Ju young Jung on 2017. 10. 20..
//  Copyright © 2017년 solbat. All rights reserved.
//

import UIKit

class MemoDetailViewVC: UIViewController {
    
    var param: MemoData?
    
    @IBOutlet weak var subject: UILabel!
    
    @IBOutlet weak var contents: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        self.navigationItem.title = dateString
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
