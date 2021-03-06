//
//  RatesViewController.swift
//  YourCoin
//
//  Created by Some Man on 31.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit
import Foundation
import ScrollableGraphView

class RatesViewController: UIViewController, ScrollableGraphViewDataSource {

    @IBOutlet var charthView: ScrollableGraphView!
    @IBOutlet weak var LeftViewButton: UIButton!
    @IBOutlet weak var RightViewButton: UIButton!
    
    let blurView = CustomUIView()
    var numberOfItems = 30
    lazy var plotOneData: [Double] = self.generateRandomData(self.numberOfItems, max: 100, shouldIncludeOutliers: true)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charthView.dataSource = self
        setupGraph(graphView: charthView)
        charthView.shouldAdaptRange = true
        charthView.backgroundFillColor = UIColor(red: 0.02, green: 0.16, blue: 0.21, alpha: 1)
        charthView.topMargin = 32
        charthView.bottomMargin = 30
        charthView.leftmostPointPadding = 20
        charthView.rightmostPointPadding = 20
        charthView.shouldRangeAlwaysStartAtZero = true
        self.didMove(toParentViewController: self)
    }
    
    @IBAction func ReloadChartAction(_ sender: Any) {
        plotOneData = self.generateRandomData(self.numberOfItems, max: 100, shouldIncludeOutliers: true)
        charthView.reload()
        print("->Reload chart")
    }
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
            return plotOneData[pointIndex]
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex)"
    }
    
    func numberOfPoints() -> Int {
        return numberOfItems
    }

    func setupGraph(graphView: ScrollableGraphView) {
        
        let chartLine = LinePlot(identifier: "one")
        chartLine.lineWidth = 3
        chartLine.lineColor = UIColor(red: 0.03, green: 0.88, blue: 0.57, alpha: 1)
        chartLine.lineStyle = ScrollableGraphViewLineStyle.smooth
        chartLine.shouldFill = false
        chartLine.fillType = ScrollableGraphViewFillType.solid
        chartLine.fillColor = UIColor(red: 0.03, green: 0.88, blue: 0.57, alpha: 1)
        chartLine.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        let referenceLines = ReferenceLines()
        referenceLines.includeMinMax = true
        referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        referenceLines.referenceLineColor = UIColor.black.withAlphaComponent(0.5)
        referenceLines.referenceLineLabelColor = UIColor.black.withAlphaComponent(0.5)
        referenceLines.dataPointLabelColor = UIColor.black.withAlphaComponent(0.5)
        
        graphView.addReferenceLines(referenceLines: referenceLines)
        graphView.addPlot(plot: chartLine)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func ButtonViewAction(_ sender: UIButton) {
        print("-> Click button restorationIdentifier: " + sender.restorationIdentifier!)
        CreateBlurView()
        let blurEffect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: blurEffect)
        blurView.addSubview(effectView)
        effectView.alpha = 0
        
        UIView.animate(withDuration: 0.8) {
            effectView.alpha = 1.0
        }
    }
    
     func CreateBlurView(){
        blurView.cornerRadius = 10
        blurView.backgroundColor = UIColor.blue
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blurView)
        blurView.widthAnchor.constraint(equalToConstant: 334).isActive = true
        blurView.heightAnchor.constraint(equalToConstant: 431).isActive = true
        blurView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        blurView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -48).isActive = true
        print("------>Set Custom")
    }
    
    
    //temp
    private func generateRandomData(_ numberOfItems: Int, max: Double, shouldIncludeOutliers: Bool = true) -> [Double] {
        var data = [Double]()
        for _ in 0 ..< numberOfItems {
            var randomNumber = Double(arc4random()).truncatingRemainder(dividingBy: max)
            
            if(shouldIncludeOutliers) {
                if(arc4random() % 100 < 10) {
                    randomNumber *= 3
                }
            }
            
            data.append(randomNumber)
        }
        return data
    }
    
}

