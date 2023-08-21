// UIFont+Extension.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

extension UIFont {
    static var text1SB: UIFont {
        UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
    }

    static var text1B: UIFont {
        UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
    }

    static var text1M: UIFont {
        UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
    }

    static var text2M: UIFont {
        UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
    }

    static var text3M: UIFont {
        UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
    }

    static var text2B: UIFont {
        UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
    }
}
