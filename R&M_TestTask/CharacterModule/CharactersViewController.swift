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
        setupDelegates()
        fetchData()
    }

    func setupDelegates() {
        contentView.charactersCollectionView.delegate = self
        contentView.charactersCollectionView.dataSource = self
    }

    func fetchData() {
        APIService.shared.execute(APIRequest.listCharactersRequest,
                                  expecting: GetAllCharactersRequest.self) { [weak self] result in
            switch result {
            case let .success(model):
                print(String(describing: model))
                self?.characters = model.results
                DispatchQueue.main.async {
                    self?.contentView.charactersCollectionView.reloadData()
                }
            case let .failure(error):
                print(String(describing: error))
            }
        }
    }
}

// MARK: UICollectionViewDelegate

extension CharactersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = characters[indexPath.row]
        let viewController = CharacterDetailsViewController(characterModel: model)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: UICollectionViewDataSource

extension CharactersViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: CharacterCardViewCell.self, for: indexPath)
        let character = characters[indexPath.row]
        let viewModel = CharacterCardViewCellModel(name: character.name, imageURL: URL(string: character.image))
        cell.configuration(characterModel: viewModel)
        return cell
    }
}
