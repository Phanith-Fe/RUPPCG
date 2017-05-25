//
//  DemoStyleKit.swift
//  JCTiledScrollViewDemo-Swift
//
//  Created by Yichi Zhang on 13/12/2014.
//  Copyright (c) 2014 Yichi Zhang. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

open class DemoStyleKit : NSObject {
	
	//// Cache
	
	fileprivate struct Cache {
		static var imageOfPDF: UIImage?
		static var pDFTargets: [AnyObject]?
		static var imageOfImage: UIImage?
		static var imageTargets: [AnyObject]?
	}
	
	//// Drawing Methods
	
	open class func drawPDF() {
		//// General Declarations
		let context = UIGraphicsGetCurrentContext()
		
		//// Text Drawing
		let textRect = CGRect(x: 0, y: 0, width: 25, height: 25)
		let textTextContent = NSString(string: "PDF")
		let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
		textStyle.alignment = NSTextAlignment.center
		
		let textFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: UIFont.systemFontSize)!, NSForegroundColorAttributeName: UIColor.black, NSParagraphStyleAttributeName: textStyle]
		
		let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
		context?.saveGState()
		context?.clip(to: textRect);
		textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
		context?.restoreGState()
	}
	
	open class func drawImage() {
		
		//// Bezier 2 Drawing
		let bezier2Path = UIBezierPath()
		bezier2Path.move(to: CGPoint(x: 9, y: 6))
		bezier2Path.addCurve(to: CGPoint(x: 8.54, y: 6.05), controlPoint1: CGPoint(x: 8.84, y: 6), controlPoint2: CGPoint(x: 8.68, y: 6.02))
		bezier2Path.addCurve(to: CGPoint(x: 7, y: 8), controlPoint1: CGPoint(x: 7.65, y: 6.26), controlPoint2: CGPoint(x: 7, y: 7.06))
		bezier2Path.addCurve(to: CGPoint(x: 9, y: 10), controlPoint1: CGPoint(x: 7, y: 9.1), controlPoint2: CGPoint(x: 7.9, y: 10))
		bezier2Path.addCurve(to: CGPoint(x: 11, y: 8), controlPoint1: CGPoint(x: 10.1, y: 10), controlPoint2: CGPoint(x: 11, y: 9.1))
		bezier2Path.addCurve(to: CGPoint(x: 9, y: 6), controlPoint1: CGPoint(x: 11, y: 6.9), controlPoint2: CGPoint(x: 10.1, y: 6))
		bezier2Path.close()
		bezier2Path.move(to: CGPoint(x: 15.57, y: 11))
		bezier2Path.addCurve(to: CGPoint(x: 13.86, y: 14.59), controlPoint1: CGPoint(x: 15.57, y: 11), controlPoint2: CGPoint(x: 14.61, y: 13.02))
		bezier2Path.addCurve(to: CGPoint(x: 13, y: 16.4), controlPoint1: CGPoint(x: 13.39, y: 15.59), controlPoint2: CGPoint(x: 13, y: 16.4))
		bezier2Path.addCurve(to: CGPoint(x: 12.07, y: 15.43), controlPoint1: CGPoint(x: 13, y: 16.4), controlPoint2: CGPoint(x: 12.58, y: 15.95))
		bezier2Path.addCurve(to: CGPoint(x: 11.83, y: 15.18), controlPoint1: CGPoint(x: 11.99, y: 15.34), controlPoint2: CGPoint(x: 11.91, y: 15.26))
		bezier2Path.addCurve(to: CGPoint(x: 10.43, y: 13.7), controlPoint1: CGPoint(x: 11.15, y: 14.46), controlPoint2: CGPoint(x: 10.43, y: 13.7))
		bezier2Path.addLine(to: CGPoint(x: 7, y: 20))
		bezier2Path.addLine(to: CGPoint(x: 19, y: 20))
		bezier2Path.addLine(to: CGPoint(x: 15.57, y: 11))
		bezier2Path.close()
		bezier2Path.move(to: CGPoint(x: 22, y: 3))
		bezier2Path.addCurve(to: CGPoint(x: 22, y: 22), controlPoint1: CGPoint(x: 22, y: 3), controlPoint2: CGPoint(x: 22, y: 22))
		bezier2Path.addLine(to: CGPoint(x: 3, y: 22))
		bezier2Path.addLine(to: CGPoint(x: 3, y: 3))
		bezier2Path.addLine(to: CGPoint(x: 22, y: 3))
		bezier2Path.addLine(to: CGPoint(x: 22, y: 3))
		bezier2Path.close()
		UIColor.black.setFill()
		bezier2Path.fill()
	}
	
	//// Generated Images
	
	open class var imageOfPDF: UIImage {
		if Cache.imageOfPDF != nil {
			return Cache.imageOfPDF!
		}
		
		UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 25), false, 0)
		DemoStyleKit.drawPDF()
		
		Cache.imageOfPDF = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		
		return Cache.imageOfPDF!
	}
	
	open class var imageOfImage: UIImage {
		if Cache.imageOfImage != nil {
			return Cache.imageOfImage!
		}
		
		UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 25), false, 0)
		DemoStyleKit.drawImage()
		
		Cache.imageOfImage = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		
		return Cache.imageOfImage!
	}
	
	//// Customization Infrastructure
	
	@IBOutlet var pDFTargets: [AnyObject]! {
		get { return Cache.pDFTargets }
		set {
			Cache.pDFTargets = newValue
			for target: AnyObject in newValue {
				target.setImage(DemoStyleKit.imageOfPDF)
			}
		}
	}
	
	@IBOutlet var imageTargets: [AnyObject]! {
		get { return Cache.imageTargets }
		set {
			Cache.imageTargets = newValue
			for target: AnyObject in newValue {
				target.setImage(DemoStyleKit.imageOfImage)
			}
		}
	}
	
}

@objc protocol StyleKitSettableImage {
	func setImage(_ image: UIImage!)
}

@objc protocol StyleKitSettableSelectedImage {
	func setSelectedImage(_ image: UIImage!)
}