//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Mehmet Salih Aslan on 4.11.2020.
//  Copyright © 2020 Mobillium. All rights reserved.
//

import UIKit
import StoreKit
import Segmentio
import KeychainSwift
import MobilliumUserDefaults

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private lazy var segmentView: Segmentio = {
        let segmentView = Segmentio()
        segmentView.setup(content: [SegmentioItem(title: viewModel.segmentedControlTitles[0], image: nil),
                                    SegmentioItem(title: viewModel.segmentedControlTitles[1], image: nil)], style: .onlyLabel, options: .options())
        return segmentView
    }()
        
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

    private lazy var subViewControllers: [UIViewController] = {
        return self.preparedViewControllers()
    }()
    
    private let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarLogo()
        configureContents()
        setSegmentHandler()
        segmentView.selectedSegmentioIndex = viewModel.selectedSegmentIndex
        setupPageViewController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkIsUserLogin()
    }

    private func configureContents() {
        definesPresentationContext = true
        view.addSubview(pageViewController.view)
        view.addSubview(segmentView)
        view.backgroundColor = .appSecondaryBackground
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        segmentView.edgesToSuperview(excluding: .bottom, usingSafeArea: true)
        segmentView.height(46)
        pageViewController.view.edgesToSuperview(excluding: .top, usingSafeArea: true)
        pageViewController.view.topToBottom(of: segmentView)
    }
    
    private func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([subViewControllers[viewModel.selectedSegmentIndex]],
                                              direction: .forward,
                                              animated: true,
                                              completion: nil)
    }
    
    private func subscribeViewModelEvents() {
        viewModel.didSuccesLogout = { [weak self] in
            guard let self = self else { return }
            self.keychain.clear()
            DefaultsKey.userId.remove()
            self.navigationItem.rightBarButtonItem = .none
        }
    }
}

// MARK: - Helper
extension HomeViewController {
    private func preparedViewControllers() -> [UIViewController] {
        let editorChoiceRouter = RecipesRouter()
        let editorChoiceViewModel = RecipesViewModel(router: editorChoiceRouter)
        editorChoiceViewModel.listType = .editorChoiceRecipes
        let editorChoiceviewController = RecipesViewController(viewModel: editorChoiceViewModel)
        editorChoiceRouter.viewController = editorChoiceviewController
        
        let lastAddedRouter = RecipesRouter()
        let lastAddedRecipesViewModel = RecipesViewModel(router: lastAddedRouter)
        lastAddedRecipesViewModel.listType = .lastAddedRecipes
        let lastAddedRecipesviewController = RecipesViewController(viewModel: lastAddedRecipesViewModel)
        lastAddedRouter.viewController = lastAddedRecipesviewController
        
        return [
            editorChoiceviewController,
            lastAddedRecipesviewController
        ]
    }
    
    private func setSegmentHandler() {
        segmentView.valueDidChange = { [weak self] _, segmentIndex in
            guard let self = self else { return }
            var direction: UIPageViewController.NavigationDirection = .forward
            if segmentIndex < self.viewModel.selectedSegmentIndex {
                direction = .reverse
            }
            self.pageViewController.setViewControllers([self.subViewControllers[segmentIndex]], direction: direction, animated: true, completion: nil)
            self.viewModel.selectedSegmentIndex = segmentIndex
        }
    }
}

// MARK: - UIPageViewController
extension HomeViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        
        return subViewControllers[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewControllers.count - 1 {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
            let index = subViewControllers.firstIndex(of: currentViewController) {
                segmentView.selectedSegmentioIndex = index
            }
        }
    }
}

// MARK: - Logout
extension HomeViewController {
    
    private func setupLogoutRightBarButton() {
        let logoutBarButton = UIBarButtonItem(image: .icLogout, style: .done, target: self, action: #selector(logoutBarButtonDidTap))
        navigationItem.rightBarButtonItem = logoutBarButton
    }
    
    private func checkIsUserLogin() {
        if keychain.get(Keychain.token) != nil {
            setupLogoutRightBarButton()
        } else {
            navigationItem.rightBarButtonItem = .none
        }
    }
    
    @IBAction private func logoutBarButtonDidTap() {
        viewModel.userLogout()
    }
}
