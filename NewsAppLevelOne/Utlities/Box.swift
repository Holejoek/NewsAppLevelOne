//
//  Box.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 04.12.2021.
//

import Foundation


class Box<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    
    var value: T! {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        self.listener?(value)
    }
    
    init(_ value: T){
        self.value = value
    }
}
