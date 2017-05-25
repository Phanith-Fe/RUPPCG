////
////  ViewController.swift
////  RUPPCG
////
////  Created by Phanith on 5/25/17.
////  Copyright © 2017 Phanith. All rights reserved.
////
//
//import UIKit
//
//enum JCDemoType {
//    case pdf
//    case image
//}
//
//let annotationReuseIdentifier = "JCAnnotationReuseIdentifier";
//let SkippingGirlImageName = "SkippingGirl"
//let SkippingGirlImageSize = CGSize(width: 432, height: 648)
//
//class ViewController: UIViewController, JCTiledScrollViewDelegate, JCTileSource {
//    
//    var scrollView: JCTiledScrollView!
//    var infoLabel: UILabel!
//    var searchField: UITextField!
//    var mode: JCDemoType!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        
//        if(mode == JCDemoType.pdf){
//            scrollView = JCTiledPDFScrollView(frame: self.view.bounds, url: Bundle.main.url(forResource: "Map", withExtension: "pdf"))
//        }else{
//            scrollView = JCTiledScrollView(frame: self.view.bounds, contentSize: SkippingGirlImageSize);
//        }
//        scrollView.tiledScrollViewDelegate = self
//        scrollView.zoomScale = 1.0
//        
//        scrollView.dataSource = self;
//        scrollView.tiledScrollViewDelegate = self;
//        
//        scrollView.tiledView.shouldAnnotateRect = true;
//        
//        // totals 4 sets of tiles across all devices, retina devices will miss out on the first 1x set
//        scrollView.levelsOfZoom = 3;
//        scrollView.levelsOfDetail = 3;
//        view.addSubview(scrollView)
//        
//        let paddingX:CGFloat = 20;
//        let paddingY:CGFloat = 30;
//        infoLabel = UILabel(frame: CGRect(x: paddingX, y: paddingY, width: self.view.bounds.size.width - 2*paddingX, height: 30));
//        infoLabel.backgroundColor = UIColor.black
//        infoLabel.textColor = UIColor.white
//        infoLabel.textAlignment = NSTextAlignment.center
//        view.addSubview(infoLabel)
//        
//        addRandomAnnotations()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func addRandomAnnotations() {
//        for index in 0...4 {
//            let a:JCAnnotation = DemoAnnotation();
//            a.contentPosition = CGPoint(
//                //This is ridiculous!! Hahaha
//                x: CGFloat(UInt(arc4random_uniform(UInt32(UInt(scrollView.tiledView.bounds.width))))),
//                y: CGFloat(UInt(arc4random_uniform(UInt32(UInt(scrollView.tiledView.bounds.height)))))
//            );
//            scrollView.add(a);
//        }
//    }
//    
//    func tiledScrollViewDidZoom(_ scrollView: JCTiledScrollView!) {
//        
//        let infoString = "zoomScale=\(scrollView.zoomScale)"
//        
//        infoLabel.text = infoString
//    }
//    
//    func tiledScrollView(_ scrollView: JCTiledScrollView!, didReceiveSingleTap gestureRecognizer: UIGestureRecognizer!) {
//        let tapPoint:CGPoint = gestureRecognizer.location(in: scrollView.tiledView)
//        
//        //Doesn't work!!!
//        //let infoString:String = String(format: "zoomScale: %0.2f, x: %0.0f y: %0.0f", scrollView.zoomScale, tapPoint.x, tapPoint.y)
//        let infoString = "(\(tapPoint.x), \(tapPoint.y)), zoomScale=\(scrollView.zoomScale)"
//        
//        infoLabel.text = infoString
//    }
//    
//    func tiledScrollView(_ scrollView: JCTiledScrollView!, viewFor annotation: JCAnnotation!) -> JCAnnotationView! {
//        
//        var view:DemoAnnotationView? = scrollView.dequeueReusableAnnotationView(withReuseIdentifier: annotationReuseIdentifier) as? DemoAnnotationView;
//        
//        if ( (view) == nil )
//        {
//            view = DemoAnnotationView(frame:CGRect.zero, annotation:annotation, reuseIdentifier:"Identifier");
//            view!.imageView.image = UIImage(named: "marker-red.png");
//            view!.sizeToFit();
//        }
//        
//        return view;
//    }
//    
//    func tiledScrollView(_ scrollView: JCTiledScrollView!, imageForRow row: Int, column: Int, scale: Int) -> UIImage! {
//        
//        let fileName:String = "\(SkippingGirlImageName)_\(scale)x_\(row)_\(column).png";
//        print(fileName);
//        return UIImage(named: fileName)
//        
//        /*
//         It's been doing weird stuff!!!
//         
//         SkippingGirl_8x_17_10.png
//         SkippingGirl_8x_13_11.png
//         SkippingGirl_8x_13_11.png
//         SkippingGirl_8x_13_9.png
//         SkippingGirl_8x_13_9.png
//         SSkkiippppiinnggGGiirrll__88xx__1165__88..ppnngg
//         
//         SkippingGirl_8x_17_9.png
//         SkippingGirl_8x_17_9.png
//         SkippingGirl_8x_17_8.png
//         SkippingGirl_8x_14_8.png
//         SSkkiippppiinnggGGiirrll__88xx__1167__77..ppnngg
//         
//         SkippingGirl_8x_15_7.png
//         SkippingGirl_8x_15_7.png
//         SSkkippingGirl_8x_18_8.png
//         ippingGirl_8x_18_7.png
//         SSkkiippppiinnggGGiirrll__88xx__1187__66..ppnngg
//         
//         SSkkiippppiinnggGGiirrll__88xx__1165__66..ppnngg
//         
//         SSkkiippppiinnggGGiirrll__88xx__1178__55..ppnngg
//         */
//        
//}
//}
