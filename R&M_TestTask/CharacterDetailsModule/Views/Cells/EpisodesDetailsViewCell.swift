// EpisodesDetailsViewCell.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - EpisodesDetailsViewCell

class EpisodesDetailsViewCell: UICollectionViewCell {
    lazy var episodeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .text1SB
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "dfaqjfghelruh"
        return label
    }()

    let episodeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .accentTitle
        label.font = .text2M
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "dfaqjfghelruh"
        return label
    }()

    let dateCreatedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .littleTitle
        label.font = .text3M
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
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
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        layer.cornerRadius = 16
        backgroundColor = .grayBackground
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addSubviews() {
        addSubview(episodeNameLabel)
        addSubview(episodeDescriptionLabel)
        addSubview(dateCreatedLabel)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            episodeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            episodeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),

            episodeDescriptionLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 16),
            episodeDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            episodeDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            dateCreatedLabel.topAnchor.constraint(equalTo: episodeNameLabel.bottomAnchor, constant: 16),
            dateCreatedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            dateCreatedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16)
        ])
    }
}

extension EpisodesDetailsViewCell {
    func configure(viewModel: EpisodeModel) {
        episodeNameLabel.text = viewModel.name
        episodeDescriptionLabel.text = viewModel.episode
        dateCreatedLabel.text = viewModel.airDate
    }
}
