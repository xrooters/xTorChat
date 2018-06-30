//
//  OTRImageTest.swift
//  xTorChat
//
//  Created by David Chiles on 1/25/18.
//  Copyright © 2018 TopStar. All rights reserved.
//

import XCTest
@testable import xTorChatCore



class OTRImageTest: XCTestCase {
    
    struct ImageInfo {
        let name:String
        let image:UIImage
    }
    
    func imageForName(_ name:String, type:String) -> UIImage? {
        let bundle = Bundle(for: OTRImageTest.self)
        guard let path = bundle.path(forResource: name, ofType: type) else {
            return nil
        }
        let image = UIImage(contentsOfFile: path)
        return image
    }
    
    func testImages() {
        let resizeImageSize:CGFloat = 120
        
        ["portrait-orientation","portrait","small","landscape"].map { (name) -> ImageInfo in
            return ImageInfo(name: name, image: self.imageForName(name, type: "jpg")!)
        }.forEach { (imageInfo) in
            let minSide = min(imageInfo.image.size.height, imageInfo.image.size.width)
            let croppedImage = UIImage.otr_squareCropImage(imageInfo.image)
            XCTAssertTrue((croppedImage.size).equalTo(CGSize(width: minSide, height: minSide)),"Checking \(imageInfo.name) square cropping.")
            
            let newImage = UIImage.otr_prepare(forAvatarUpload: imageInfo.image, maxSize: resizeImageSize) 
            let expectedSide = min(resizeImageSize,minSide)
            let expectedSize = CGSize(width: expectedSide, height: expectedSide)
            XCTAssertTrue((newImage.size).equalTo(expectedSize),"Checking crop and resize for \(imageInfo.name). Expected \(expectedSize). Found \(newImage.size).")
            
        }
    }


}
