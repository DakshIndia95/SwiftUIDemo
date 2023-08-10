//
//  DownloadOperations.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import Foundation
import UIKit

class DownloadOperation : Operation {
    var downloadHandler : ImageDownloadHandler?
    var imageUrl : URL!
    private var indexPath: IndexPath?

    override var isAsynchronous: Bool {
        get {
            return true
        }
    }
    
    private var _executing = false {
        didSet {
            didChangeValue(forKey: OperationsConstant.isExecuting)
        }
    }
    override var isExecuting: Bool {
        return _executing
    }
    
    private var _finished = false {
        didSet {
            didChangeValue(forKey: OperationsConstant.isFinished)
        }
    }
    override var isFinished: Bool {
        return _finished
    }
    
    func executing(_ execution: Bool) {
        _executing = execution
    }
    func finish(_ finish: Bool){
        _finished = finish
    }
    
    required init(imageUrl: URL!,indexPath: IndexPath?) {
        self.imageUrl = imageUrl
        self.indexPath = indexPath
    }
    
    override func main() {
        guard !isCancelled else {
            finish(true)
            return
        }
        executing(true)
        downloadImageFromUrl()
    }
    
    func downloadImageFromUrl() {
        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, err in
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                self.downloadHandler?(nil, self.indexPath, .invalidResponse)
                return
            }
            if let data = data,let newImage = UIImage(data: data) {
                self.downloadHandler?(newImage, self.indexPath, nil)
            }
        }
        self.finish(true)
        self.executing(false)
        task.resume()
    }
}
