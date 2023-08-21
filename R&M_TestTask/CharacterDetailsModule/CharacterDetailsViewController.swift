// CharacterDetailsViewController.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - CharacterDetailsViewController

class CharacterDetailsViewController: UIViewController {
    private let contentView = CharacterDetailsView()

    private var character: CharacterModel
    private var episodes: [EpisodeModel] = []

    init(characterModel: CharacterModel) {
        character = characterModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        setupDelegates()
        setupNavBar()
        fetchData()
    }

    private func setupDelegates() {
        contentView.charactersCollectionView.dataSource = self
    }

    private func fetchData() {
        let episodesIds = getNumberOfEpisodesArray(urls: character.episode)
        let request = NetworkRequest(endPoint: .episode, pathComponents: episodesIds)
        NetworkService.shared.execute(request, expecting: [EpisodeModel].self) { [weak self] result in
            switch result {
            case let .success(model):
                self?.episodes = model
                DispatchQueue.main.async {
                    self?.contentView.charactersCollectionView.reloadSections([DetailsSections.episodes.rawValue])
                    self?.hideActivityIndicator()
                }
            case let .failure(error):
                print(String(describing: error))
            }
        }
    }

    private func getNumberOfEpisodesArray(urls: [String]) -> [String] {
        var episodesIds: [String] = []
        urls.forEach { urlString in
            if let lastComponent = urlString.components(separatedBy: "/").last {
                episodesIds.append(lastComponent)
            }
        }
        return episodesIds
    }

    private func hideActivityIndicator() {
        contentView.activityIndicator.stopAnimating()
        contentView.activityIndicator.removeFromSuperview()
        contentView.charactersCollectionView.isHidden = false
    }

    private func setupNavBar() {
        let icon = UIImage(named: "leftPointer")
        let leftBarItem = UIBarButtonItem(
            image: icon,
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )
        navigationItem.leftBarButtonItem = leftBarItem
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: UICollectionViewDataSource

extension CharacterDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = DetailsSections(rawValue: section) else { return 0 }
        switch section {
        case .main, .info, .origin:
            return 1
        case .episodes:
            return episodes.count
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        DetailsSections.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let section = DetailsSections(rawValue: indexPath.section) else { return UICollectionViewCell() }
        switch section {
        case .main:
            let cell = collectionView.dequeueReusableCell(withClass: MainDetailsViewCell.self, for: indexPath)
            cell.configure(
                viewModel: MainDetailsViewCellModel(
                    name: character.name,
                    imageURL: URL(string: character.image),
                    lifeStatus: character.status
                )
            )
            return cell
        case .info:
            let cell = collectionView.dequeueReusableCell(withClass: InfoDetailsViewCell.self, for: indexPath)
            cell.configure(viewModel: character)
            return cell
        case .origin:
            let cell = collectionView.dequeueReusableCell(withClass: OriginDetailsViewCell.self, for: indexPath)
            cell.configure(viewModel: character.origin)
            return cell
        case .episodes:
            let cell = collectionView.dequeueReusableCell(withClass: EpisodesDetailsViewCell.self, for: indexPath)
            cell.configure(viewModel: episodes[indexPath.row])
            return cell
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let sectionType = DetailsSections(rawValue: indexPath.section) else { return UICollectionReusableView() }
        let header = collectionView.viewForSupplementary(withClass: SectionHeader.self, for: indexPath)
        switch sectionType {
        case .info:
            header.configure(title: "Info")
        case .episodes:
            header.configure(title: "Episodes")
        case .origin:
            header.configure(title: "Origin")
        case .main:
            return UICollectionReusableView()
        }
        return header
    }
}
