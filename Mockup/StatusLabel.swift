//
//  StatusLabel.swift
//  Mockup
//
//  Created by Yunpeng Niu on 10/03/18.
//  Copyright © 2018 Yunpeng Niu. All rights reserved.
//

import UIKit

class StatusLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.width / 7
        textColor = UIColor.white
    }

    func setText(_ status: Status) {
        text = status.rawValue

        switch status {
        case .created:
            backgroundColor = UIColor.yellow
        case .preparing:
            backgroundColor = UIColor.orange
        case .ready:
            backgroundColor = UIColor.green
        case .finish:
            backgroundColor = UIColor.darkGray
        }
    }
}

enum Status: String {
    case created = "Created"
    case preparing = "Preparing"
    case ready = "Ready"
    case finish = "Finished"
}
