//
//  CommentEditDeleteAlertViewRoute.swift
//  Fodamy
//
//  Created by Murat Celebi on 19.02.2021.
//
import UIKit

protocol CommentEditDeleteAlertViewRoute {
    func presentCommentEditDeleteAlertView(edit: VoidClosure?, delete: VoidClosure?)
}

extension CommentEditDeleteAlertViewRoute where Self: RouterProtocol {
    
    func presentCommentEditDeleteAlertView(edit: VoidClosure?, delete: VoidClosure?) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let edit = UIAlertAction(title: "Düzenle", style: .default) { _ in
            edit?()
        }
        let delete = UIAlertAction(title: "Sil", style: .destructive) { _ in
            delete?()
        }
        let dismiss = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        let transition = ModalTransition()
        
        alert.addAction(edit)
        alert.addAction(delete)
        alert.addAction(dismiss)
        
        open(alert, transition: transition)
    }
}
