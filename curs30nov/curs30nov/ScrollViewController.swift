//
//  ScrollViewController.swift
//  curs30nov
//
//  Created by Vlad Groza on 30.11.2023.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
    }

}

extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}
