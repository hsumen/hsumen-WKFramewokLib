//
//  File.swift
//  
//
//  Created by Hsu on 2020/1/8.
//

import Foundation
import UIKit

public extension UIViewController {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.topAnchor
        } else {
            return topLayoutGuide.bottomAnchor
        }
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomLayoutGuide.topAnchor
        }
    }

    var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return .zero
        }
    }

    func addChild(_ viewController: UIViewController, to containerView: UIView) {
        addChild(viewController)
        containerView.addChildSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func addChild(_ viewController: UIViewController, to layoutGuide: UILayoutGuide) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            ])
    }
}


public extension UIViewController {
    var expectedSearchBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return 54
        } else if #available(iOS 11.0, *) {
            // On iOS 11, the window safeAreaInsets.top returns wrong value (0).
            let topInset = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
            if topInset == 20 || // Normal screen on iOS 12+.
               topInset == 0     // Normal screen on iOS 11.
            {
                return 44
            } else {             // Notch screen.
                return 54
            }
        } else { // iOS 10
            return 44 + 20
        }
    }
}

extension UIView {
    // Add a subview as `self` is a container. Layout the added `child` to match `self` size.
    func addChildSubview(_ child: UIView) {
        child.translatesAutoresizingMaskIntoConstraints = false
        addSubview(child)
        NSLayoutConstraint.activate([
            child.topAnchor     .constraint(equalTo: topAnchor),
            child.leadingAnchor .constraint(equalTo: leadingAnchor),
            child.trailingAnchor.constraint(equalTo: trailingAnchor),
            child.bottomAnchor  .constraint(equalTo: bottomAnchor),
        ])
    }
}
