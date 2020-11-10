//
//  ViewController.swift
//  Overlay Example
//
//  Created by Sahil Arora on 2020-11-09.
//  Copyright © 2020 Sahil Arora. All rights reserved.
//

import UIKit
import OverlayContainer

class ViewController: OverlayContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.delegate = self
        
        //access the storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc1 = storyboard.instantiateViewController(identifier: "ViewControllerTop")as! ViewControllerTop
        let vc2 = storyboard.instantiateViewController(identifier: "ViewControllerOverlaying")as! ViewControllerOverlaying
        self.viewControllers = [vc1,vc2]
    }


}


extension ViewController:OverlayContainerViewControllerDelegate{
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController, heightForNotchAt index: Int, availableSpace: CGFloat) -> CGFloat {
        switch space.allCases[index] {
        case .low:
            return availableSpace/4
        case .half:
            return availableSpace/2
        case .full:
            return availableSpace
        }
    }
    
    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return space.allCases.count
    }
    
    
   
    
}
enum space:Int,CaseIterable{
    case low,half,full
}
