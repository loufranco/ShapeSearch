//
//  SingleShapeViewController.swift
//  PGBookHost
//
//  Created by Lou Franco on 9/3/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//

import Foundation
import UIKit
import GameKit
import PlaygroundSupport

public class SingleShapeViewController: UIViewController {
   public override func viewDidLoad() {
        self.view.backgroundColor = .white
        let imageView = UIImageView(image: #imageLiteral(resourceName: "shape-gray-cloud-large"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}


extension SingleShapeViewController: PlaygroundLiveViewMessageHandler {

    public func liveViewMessageConnectionOpened() {
    }

    public func liveViewMessageConnectionClosed() {
    }

    public func receive(_ message: PlaygroundValue) {
    }
}
