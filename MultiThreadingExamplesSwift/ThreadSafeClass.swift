//
//  ThreadSafeClass.swift
//  MultiThreadingExamplesSwift
//
//  Created by Рабочий on 22/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import Foundation

class ThreadSafeClass {
    private var threadSafeProperty: Int = 0
    private let ThreadSafeClassInternalQueueLabel = "com.examples.ThreadSafeClass.internalQueueLabel"
    private let internalQueue: DispatchQueue
    
    init() {
        internalQueue = DispatchQueue(label: ThreadSafeClassInternalQueueLabel, attributes: .concurrent)
    }
    
    func setThreadSafeProperty(threadSafePropery: Int) {
        internalQueue.async(flags: .barrier) {
            self.threadSafeProperty = threadSafePropery
        }
    }
    
    func getThreadSafeProperty() -> Int {
        var threadSafePropertyValue = 0
        internalQueue.sync {
            threadSafePropertyValue = self.threadSafeProperty
        }
        return threadSafePropertyValue
    }
}
