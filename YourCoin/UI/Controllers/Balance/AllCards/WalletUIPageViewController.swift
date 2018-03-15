//
//  WalletUIPageViewController.swift
//  YourCoin
//
//  Created by Some Man on 24.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit


struct Wallet{
    var key: String?
    var balance: String = "0.00"
    var type:String =  "ETH"
}
class WalletUIPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    let accountService: AccountService = AccountService()
    let ethereumDataService: EthereumDataService = EthereumDataService()
    var pageControl = UIPageControl()
    //temp
    var some = WalletCardViewController()
    var some2 = WalletCardViewController()
    var userWallets: Array<WalletCardViewController> = Array()
    
    
    lazy var orderedViewControllers: [UIViewController] = {
        return userWallets//add view
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = DispatchQueue.global(qos: .utility)
        // TODO: Rename array of wallets. This name is shit
        var wallets1: [Wallet] = []
        queue.async {
            AccountService.sharedInstance.GetAccounts {
                response, error in
                if let wallets = response {
                    for item in wallets {
                        var wallet: Wallet? = Wallet()
//                        print("Wallet: \(item.address.address)")
                        wallet?.key = item.address.address
//                        EthereumDataService.sharedInstance.GetBallance(address: item.address.address) {
//                            resp, err in
//                            if let balance = resp?.balance {
//                                wallet?.balance = balance
//                            }
//                        }
                        wallets1.append(wallet!)
                        
                    }
                    DispatchQueue.main.async {
                        for item in wallets1 {
                            let walletContr = WalletCardViewController()
                            walletContr.walletCardObject.walletPublicKey = item.key
                            walletContr.walletCardObject.balance = item.balance
                            walletContr.walletCardObject.typeCoin = item.type
                            self.userWallets.append(walletContr)
                        }
                       
                        self.dataSource = self
                        self.delegate = self
                        self.self.configurePageControl()
                        if let firstViewController = self.orderedViewControllers.first {
                            self.setViewControllers([firstViewController],
                                                    direction: .forward,
                                                    animated: true,
                                                    completion: nil)
                        }
                    }
                }

        }
       
        }
        //temp
       // some.SetCardsView(CardInfo: WalletCardObject(Wallet:"0xB9335eC1C88AA481042537eD36ba0baA6CB49e87", Balance:"13", TypeCoin:"ETH"))

        
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
 //   override func viewWillAppear(_ animated: Bool) {
   //       AllCardsViewController.walletCards = self
  //  }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let tabl = segue.description as? SmallHistoryTableViewController
//        tabl?.historyArray =  ["Гена", "Чебурашка", "Апельсины", "Фиксики", "Роботы", "Машинки", "Маша", "И Медведь", "Матроскин", "Шарик", "Печкин", "Доктор Хаус"]
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func newVc(viewController: String) -> UIViewController {
//        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
//    }
    
    // MARK: Delegate methords
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
        AllCardsViewController.TempCount = self.pageControl.currentPage
        AllCardsViewController.RefreshData(some: String(self.pageControl.currentPage))
        SmallHistoryTableViewController.RefreshData(key: String(self.pageControl.currentPage))
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        

        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    

}
