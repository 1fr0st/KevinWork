//
//  ChatViewController.swift
//  AlexaBot
//
//  Created by kevin ngadiuba on 31/01/2019.
//  Copyright © 2019 kevin ngadiuba. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {

        lazy var outgoingBubbleImageView : JSQMessagesBubbleImage = self.setupOutgoingBubble()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    enum ChatWindowState
    {
        case minimised
        case maximised
    }
    
    


}
