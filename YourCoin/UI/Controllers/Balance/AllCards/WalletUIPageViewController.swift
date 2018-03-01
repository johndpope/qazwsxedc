//
//  WalletUIPageViewController.swift
//  YourCoin
//
//  Created by Some Man on 24.01.18.
//  Copyright © 2018 Bubble. All rights reserved.
//

import UIKit



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
        
        accountService.GetAccounts() {
            response, error in
            if let wallets = response{
                for account in wallets {
                    // TODO: Create model such as "Model" and set model via constructor !!!!
                    let wallet = WalletCardViewController()
                    let account = account.address.address
                    wallet.walletCardObject?.walletPublicKey = account
                    DispatchQueue.main.async {
                        self.ethereumDataService.GetBallance(address: account) {
                            response, error in
                            let balance = response?.balance
                            
                            wallet.walletCardObject?.balance = "500"
                            wallet.walletCardObject?.typeCoin = "ETH"
                        }
                    }
                    self.userWallets.append(wallet)
                }
                print("Count \(self.userWallets.count)")
            }
        }

        

        
        //temp
        some.SetCardsView(CardInfo: WalletCardObject(Wallet:"0xB9335eC1C88AA481042537eD36ba0baA6CB49e87", Balance:"13", TypeCoin:"ETH"))
        
        self.dataSource = self
        self.delegate = self
        configurePageControl()
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
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
