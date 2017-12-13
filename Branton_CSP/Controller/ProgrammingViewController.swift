//
//  ProgrammingViewController.swift
//  Branton_CSP
//
//  Created by Martinson, Branton on 12/13/17.
//  Copyright © 2017 Martinson, Branton. All rights reserved.
//

import UIKit
import SpriteKit

public class ProgrammingViewController: UIViewController
{

    override public func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        let gameScene = StarScene(ize: view.bounds.size)
        let gameView = view as! SKView
        
        gameView.showsFPS = true
        gameView.showNodeCount = true
        gameView.ignoresSiblingOrder = true
        
        gameScene.scaleMode = .resizeFill
        gameView.presentScene(gameScene)
        
    }

}
