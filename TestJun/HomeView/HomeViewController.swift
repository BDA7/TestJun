//
//  ViewController.swift
//  TestJun
//
//  Created by Данила on 29.08.2022.
//

import UIKit

enum HomeViewActions {
    case updateCollectionView(newProducts: ModelsNetwork)
}

protocol HomeViewProtocol: AnyObject {
    var interactor: HomeInteractorProtocol? { get set }
    func actionView(action: HomeViewActions)
}

class HomeViewController: UIViewController, HomeViewProtocol {
    var interactor: HomeInteractorProtocol?
    var products: ModelsNetwork?

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView.register(CircularCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "searchCell")
        collectionView.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "hotSalesCell")
        collectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier: "gridCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        interactor?.actionInteractor(action: .getProducts)
    }


    func actionView(action: HomeViewActions) {
        switch action {
            
        case .updateCollectionView(newProducts: let newProducts):
            updateCollectionView(newProducts: newProducts)
        }

    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    private func updateCollectionView(newProducts: ModelsNetwork) {
        self.products = newProducts
        self.collectionView.reloadData()
    }

    func createCompositionalLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { indexSection, layoutEnviroment in
            switch indexSection {
            case 0:
                return self.createButtonsSection()
            case 1:
                return self.createSearchSection()
            case 2:
                return self.createHotSalesSection()
            case 3:
                return self.createGridLayoutSection()
            default:
                return self.createButtonsSection()
            }
        }
        return layout
    }

    private func createButtonsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(111),
            heightDimension: .absolute(111))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 5, leading: 5, bottom: 10, trailing: 5)

        return layoutSection
    }

    private func createSearchSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(35))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 25, leading: 0, bottom: 24, trailing: 0)

        return section
    }

    private func createHotSalesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 2, bottom: 0, trailing: 2)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(388),
            heightDimension: .absolute(190))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 1)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 15, bottom: 15, trailing: 10)

        return section
    }

    private func createGridLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 14, bottom: 0, trailing: 4)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(227))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 12, leading: 0, bottom: 0, trailing: 14)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 17, leading: 0, bottom: 0, trailing: 0)

        return section
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let products = products else { return 0}

        switch section {
        case 0:
            return 5
        case 1:
            return 1
        case 2:
            var counter = 0
            for product in products.home_store {
                if product.is_new ?? false {
                    counter += 1
                }
            }
            return counter
        case 3:
            return products.best_seller.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as! SearchCollectionViewCell
            return cell
        }
        if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotSalesCell", for: indexPath) as! HotSalesCollectionViewCell
            cell.configure()
            return cell
        }

        if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! GridCollectionViewCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CircularCollectionViewCell
        if indexPath.row == 0 {
            cell.configure(color: UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1))
        } else {
            cell.configure(color: UIColor(red: 255, green: 255, blue: 255, alpha: 1.0))
        }
        return cell
    }


}
