// CharactersViewController.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - CharactersViewController

class CharactersViewController: UIViewController {
    let contentView = CharactersView()
    var characters = [CharacterModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupDelegates()
    }

    func setupDelegates() {
        contentView.charactersCollectionView.delegate = self
        contentView.charactersCollectionView.dataSource = self
    }

//    func fetchData() {
//        let request = APIRequest(endPoint: .character)
//        print(request.url)
//        APIService.shared.execute(request, expecting: CharacterModel.self) { result in
//            switch result {
//            case .success(<#T##String#>)
//            }
//        }
//    }
}

// MARK: UICollectionViewDelegate

extension CharactersViewController: UICollectionViewDelegate {}

// MARK: UICollectionViewDataSource

extension CharactersViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CharacterCardViewCell.self, for: indexPath)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CharacterSectionHeader.reuseIdentifier,
            for: indexPath
        ) as? CharacterSectionHeader else { fatalError("Cannot create the header") }
        return header
    }
}
