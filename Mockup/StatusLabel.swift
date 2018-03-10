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
    }
}
