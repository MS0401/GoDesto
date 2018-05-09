//
//  TermsCell.swift
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import BEMCheckBox

class TermsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewTermContainer: UIView!
    @IBOutlet weak var viewCheckbox: BEMCheckBox!
    @IBOutlet weak var lblTerms: UILabel!
    
    var onTap: (() -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCheckbox.delegate = self
        viewCheckbox.boxType = .square
        viewCheckbox.tintColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        viewCheckbox.onTintColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        viewCheckbox.onCheckColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        viewCheckbox.onFillColor = .white
        viewCheckbox.offFillColor = .white
        
    }
    
    func setup(htmlText: String, showAgreementControl: Bool = false) {
        titleLabel.setHTMLFromString(text: htmlText)
        viewTermContainer.isHidden = !showAgreementControl
    }
    func setup(termAgreement: Bool) {
        viewCheckbox.setOn(termAgreement, animated: false)
    }
    
    class func instance() -> TermsCell {
        return Bundle.main.loadNibNamed(NIBName.TermsCell, owner: nil, options: nil)?.first as! TermsCell
    }
    
}

extension TermsCell: BEMCheckBoxDelegate {
    func didTap(_ checkBox: BEMCheckBox) {
        if let tapClosure = self.onTap {
            tapClosure()
        }
    }
}

extension UILabel {
    func setHTMLFromString(text: String) {
        
        let format = "<html>" +
            "<style type=\"text/css\">" +
            "body { font-family:%@; font-size:%f;color: #000000;}" +
            "</style>" +
            "<body>" +
            "<p>%@</p>" +
        "</body></html>"
        
        let formattedHTML = String(format: format, FontName.MyriadProRegular, 14.0, text)
        
        let attrStr = try! NSAttributedString(
            data: (formattedHTML as NSString).data(using: String.Encoding.unicode.rawValue, allowLossyConversion: true)!,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        self.attributedText = attrStr
    }
}
