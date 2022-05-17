//
//  CacheManager.swift
//  News
//
//  Created by James Wilhelm on 3/30/22.
//  Copyright © 2022 Christopher Ching. All rights reserved.
//

import Foundation

class CacheManager{
    static var imageDictionary = [String:Data]()
    
    
    static func saveData(_ url:String, _ imageData: Data){
    //save the image data along with the url
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(_ url:String) -> Data?{
        //return the saved image data or nil
        
        return imageDictionary[url]
    }
}
