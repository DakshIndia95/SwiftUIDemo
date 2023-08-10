//
//  ImageDownloader.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import Foundation
import UIKit

typealias ImageDownloadHandler = (_ image: UIImage?,_ indexPath: IndexPath?, _ error: ApiError?) -> Void

final class ImageDownloadManager {
    
    static let shared = ImageDownloadManager()
    private var completionHandler : ImageDownloadHandler?
    lazy var imageDownloadQueue : OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.concurrencyDemo.imageDownloadQueue"
        queue.qualityOfService = .userInteractive
        return queue
    }()
    let imageCache = NSCache<NSString,UIImage>()
    private init(){}
    
    func downloadImage(imgUrl: String, indexPath:IndexPath?, completion: @escaping ImageDownloadHandler) {
        completionHandler = completion
        guard let url = URL(string: imgUrl) else {
            completionHandler?(nil, indexPath, .invalidUrl)
            return
        }
        // Check image is already there in the cache and return if present
        if let cacheImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completionHandler?(cacheImage, indexPath, nil)
        }else {
           
            /* check if there is any downloading task that is downloading same image*/
            if let operation = (imageDownloadQueue.operations as? [DownloadOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isFinished == false && $0.isExecuting == true}), let operation = operation.first {
                // increase priority of that operation
                operation.queuePriority = .veryHigh
            }else {
                /* start new downloading task*/
                let operation = DownloadOperation(imageUrl: url, indexPath: indexPath)
                if indexPath == nil {
                    operation.queuePriority = .high
                }
                operation.downloadHandler = {(img, indexPath, error) in
                    if let newImage = img {
                        self.imageCache.setObject(newImage, forKey: url.absoluteString as NSString)
                    }
                    self.completionHandler?(img, indexPath, nil)
                }
                imageDownloadQueue.addOperation(operation)
            }
        }
    }
    
    /* Reduce priority of task if it is not visible on the screen*/
    func downloadImageWithLowPriority(imgUrl: String, indexPath:IndexPath?){
        guard let url = URL(string: imgUrl) else {
            completionHandler?(nil, indexPath, .invalidUrl)
            return
        }
        if let operation = (imageDownloadQueue.operations as? [DownloadOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isExecuting == true && $0.isFinished == false}),let operation = operation.first{
            operation.queuePriority = .low
        }
    }
    
    func cancellAllTask(){
        imageDownloadQueue.cancelAllOperations()
    }
}
