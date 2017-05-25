//
//  ViewController.swift
//  RUPPCG
//
//  Created by Phanith on 5/25/17.
//  Copyright © 2017 Phanith. All rights reserved.
//

import UIKit

enum JCDemoType {
    case pdf
    case image
}


let annotationReuseIdentifier = "JCAnnotationReuseIdentifier";
let SkippingGirlImageName = "SkippingGirl"
let SkippingGirlImageSize = CGSize(width: 1000, height: 1000)

class HomeViewController: UIViewController, JCTiledScrollViewDelegate, JCTileSource {
    
    var scrollView: JCTiledScrollView!
    var infoLabel: UILabel!
    var searchField: UITextField!
    var mode: JCDemoType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        scrollView = JCTiledPDFScrollView(frame: self.view.bounds, url: Bundle.main.url(forResource: "rupp", withExtension: "pdf"))
        scrollView.tiledScrollViewDelegate = self
        scrollView.zoomScale = 1.0
        scrollView.dataSource = self
        scrollView.tiledScrollViewDelegate = self
        scrollView.tiledView.shouldAnnotateRect = true
        
        // totals 4 sets of tiles across all devices, retina devices will miss out on the first 1x set
        scrollView.levelsOfZoom = 2;
        scrollView.levelsOfDetail = 2;
    
        
        
        view.addSubview(scrollView)
        
//        let paddingX:CGFloat = 0;
//        let paddingY:CGFloat = 0;
//        infoLabel = UILabel(frame: CGRect(x: paddingX, y: paddingY, width: self.view.bounds.size.width - 2*paddingX, height: 30));
//        infoLabel.backgroundColor = UIColor.black
//        infoLabel.textColor = UIColor.white
//        infoLabel.textAlignment = NSTextAlignment.center
//        view.addSubview(infoLabel)
        
        
        let a:JCAnnotation = DemoAnnotation();
        a.contentPosition = CGPoint(x: 390.0,y: 250.0)
        
        scrollView.add(a);
        
        addRandomAnnotations()
    }
    
    func tiledScrollViewDidScroll(_ scrollView: JCTiledScrollView!) {
//        scrollView.con
    }
    
    private func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
    
    func addRandomAnnotations() {
        for _ in 0...4 {
            let a:JCAnnotation = DemoAnnotation();
            a.contentPosition = CGPoint(
                //This is ridiculous!! Hahaha
                x: CGFloat(UInt(arc4random_uniform(UInt32(UInt(scrollView.tiledView.bounds.width))))),
                y: CGFloat(UInt(arc4random_uniform(UInt32(UInt(scrollView.tiledView.bounds.height)))))
            );
            scrollView.add(a);
        }
    }
    
    
    func tiledScrollView(_ scrollView: JCTiledScrollView!, didReceiveSingleTap gestureRecognizer: UIGestureRecognizer!) {
        
        let tapPoint:CGPoint = gestureRecognizer.location(in: scrollView.tiledView)
        let infoString = "(\(tapPoint.x), \(tapPoint.y)), zoomScale=\(scrollView.zoomScale)"
        navigationItem.title = infoString
    }
    
    
    
    
    
    
    
    
    
    
    //Don't touch this function
    func tiledScrollView(_ scrollView: JCTiledScrollView!, viewFor annotation: JCAnnotation!) -> JCAnnotationView! {
        
        var view:DemoAnnotationView? = scrollView.dequeueReusableAnnotationView(withReuseIdentifier: annotationReuseIdentifier) as? DemoAnnotationView;
        
        if ( (view) == nil )
        {
            view = DemoAnnotationView(frame:CGRect.zero, annotation:annotation, reuseIdentifier:"Identifier");
            view!.imageView.image = UIImage(named: "marker-red.png");
            view!.sizeToFit();
        }
        return view;
    }
    
    func tiledScrollView(_ scrollView: JCTiledScrollView!, imageForRow row: Int, column: Int, scale: Int) -> UIImage! {
        
        let fileName:String = "\(SkippingGirlImageName)_\(scale)x_\(row)_\(column).png";
        print(fileName);
        return UIImage(named: fileName)
    }
}
