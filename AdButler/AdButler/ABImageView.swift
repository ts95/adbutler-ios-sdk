//
//  ABImageView.swift
//  AdButler
//
//  Created by Ryuichi Saito on 12/3/16.
//  Copyright © 2016 AdButler. All rights reserved.
//

import UIKit

public class ABImageView: UIImageView {
    var placement: Placement?

    func setupGestures() {
        isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        addGestureRecognizer(tapGesture)
    }

    @objc func tap() {
        if let urlString = placement?.redirectUrl, let url = URL(string: urlString) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
