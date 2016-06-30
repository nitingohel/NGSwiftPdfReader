//
//  ViewController.swift
//  NGSwiftPdfReader
//
//  Created by Nitin Gohel on 30/06/16.
//  Copyright © 2016 Nitin Gohel. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ReaderViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTap(_:)))
        //singleTap.numberOfTouchesRequired = 1; singleTap.numberOfTapsRequired = 1; //singleTap.delegate = self;
        self.view!.addGestureRecognizer(singleTap)


        
    }
    
    func handleSingleTap(recognizer: UITapGestureRecognizer) {
        
        
        let filepath = (NSBundle.mainBundle().pathForResource("Reader", ofType:"pdf"))! as String
        
        if let document = ReaderDocument.withDocumentFilePath(filepath, password: "")
        {
            let readerViewController: ReaderViewController = ReaderViewController(readerDocument: document)
            readerViewController.delegate = self
            // Set the ReaderViewController delegate to self
            self.navigationController!.pushViewController(readerViewController, animated: true)
            
            
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissReaderViewController(viewController: ReaderViewController) {
        self.navigationController!.popViewControllerAnimated(true)
        self.dismissViewControllerAnimated(true, completion: { _ in })
    }

}

