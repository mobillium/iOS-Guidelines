//
//  Animator.swift
//  Routing
//
//  Created by Nikita Ermolenko on 28/10/2017.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
