//
//  DoerClass.swift
//  MultiThreadingExamplesSwift
//
//  Created by Рабочий on 22/01/2019.
//  Copyright © 2019 Рабочий. All rights reserved.
//

import Foundation

class DoerClass {
    public func doPages(pageNames: [String], callBackQueue queue: DispatchQueue, completion: @escaping ([String]) -> Void) {
        var resultsArray = [String]()
        for _ in pageNames {
            resultsArray.append("")
        }
        let group = DispatchGroup()
        for pageName in pageNames {
            group.enter()
            doPage(pageName: pageName, completion: { dataString in
                guard let pageIndex = pageNames.firstIndex(of: pageName) else {
                    group.leave()
                    return
                }
                resultsArray[pageIndex] = dataString
                group.leave()
            })
        }
        group.notify(queue: queue) {
            completion(resultsArray)
        }
    }
    
    public func doPage(pageName: String, completion: (String) -> Void) {
        let pageData = ""
        completion(pageData)
    }
    
    private func pageDataWithName(pageName: String)-> String {
        return ""
    }
}
