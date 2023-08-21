// CharacterDetailsView.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - DetailsSections

enum DetailsSections: Int, CaseIterable {
    case main = 0
    case info = 1
    case origin = 2
    case episodes = 3
}

// MARK: - CharacterDetailsView

class CharacterDetailsView: UIView {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    lazy var charactersCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: MainDetailsViewCell.self)
        collectionView.register(cellWithClass: InfoDetailsViewCell.self)
        collectionView.register(cellWithClass: OriginDetailsViewCell.self)
        collectionView.register(cellWithClass: EpisodesDetailsViewCell.self)
        collectionView.register(
            viewWithClass: SectionHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader
        )
        collectionView.backgroundColor = .mainBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackground
        activityIndicator.startAnimating()
        charactersCollectionView.isHidden = true
    }

    private func addSubviews() {
        addSubview(charactersCollectionView)
        addSubview(activityIndicator)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(equalTo: topAnchor),
            charactersCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            charactersCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            charactersCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension CharacterDetailsView {
    private func createLayout() -> UICollectionViewLayout {
        let sections = DetailsSections.allCases
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] sectionIndex, _ ->
            NSCollectionLayoutSection? in
            let section = sections[sectionIndex]
            let layout = self?.layoutSection(for: section)
            return layout
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        layout.configuration.scrollDirection = .vertical
        return layout
    }

    private func layoutSection(for type: DetailsSections) -> NSCollectionLayoutSection {
        switch type {
        case .main:
            return createLayoutWithoutHeader(height: UIScreen.main.bounds.width * 0.65)
        case .info:
            return createLayoutWithHeader(height: 124)
        case .episodes:
            return createLayoutWithHeader(height: 80, interGroupSpacing: 16)
        case .origin:
            return createLayoutWithHeader(height: 86)
        }
    }

    private func createLayoutWithHeader(height: CGFloat, interGroupSpacing: CGFloat = 0) -> NSCollectionLayoutSection {
        let section = createLayoutWithoutHeader(height: height)
        let header = getHeader()
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = interGroupSpacing
        return section
    }

    private func createLayoutWithoutHeader(height: CGFloat) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(height)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(height)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    private func getHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(62))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return header
    }
}
