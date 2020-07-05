//
//  UserKissCell.swift
//  Sample
//
//  Created by Trung on 7/5/20.
//  Copyright © 2020 trungnguyenthien. All rights reserved.
//

import Foundation
import Kiss

class UserKissCell: UICollectionViewCell {
    let mailLabel = "ngthientrung@gmail.com".labelMediumBold
    let titleLable = "Chiêm Điêng".labelMediumBold
    let phoneNum = "(+84) 167 767 0064".labelMedium
    let genderLabel = "GENDER: MALE".labelSmall
    let imageView = makeThumbnail()
    let ratingView = RatingView()
    
    lazy var stackInfoLayout = makeView(.systemOrange).kiss.vstack {
        mailLabel.layout.marginTop(5)
        titleLable.layout.marginTop(5)
        ratingView.layout.marginTop(5).height(30)
        stretchSpacer()
        phoneNum.layout.marginTop(5)
    }
    
    lazy var hLayout = hstack {
        imageView.layout.grow(1).ratio(1/1)
        spacer(10)
        stackInfoLayout.cloned.grow(1).alignSelf(.stretch)
    }.padding(5).alignItems(.start)
    
    lazy var vLayout = vstack {
        imageView.layout.alignSelf(.stretch).ratio(2/2)
        spacer(10)
        stackInfoLayout.cloned.alignSelf(.stretch)
    }.padding(10).alignItems(.start)
    
    func config(user: User, isPortrait: Bool) {
        self.backgroundColor = .white
        mailLabel.text = user.email
        titleLable.text = "\(user.name.last) \(user.name.first)"
        phoneNum.text = "Tel: \(user.phone)"
        genderLabel.text = user.gender.rawValue
        ratingView.isVisible = user.gender == .female
        kiss.constructIfNeed(layout: isPortrait ? vLayout : hLayout)
        kiss.updateChange(width: frame.size.width, height: frame.size.height)
    }
    
    func preview() {
        kiss.constructIfNeed(layout: vLayout)
        kiss.updateChange()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        kiss.updateChange(width: frame.width, height: frame.height)
    }
}
#if DEBUG
import SwiftUI
struct UIKissCellPreview: PreviewProvider, UIViewRepresentable {
    typealias UIViewType = UserKissCell
    static let previewSize = CGSize(width: 300, height: 500)
    static var previews: some View {
        UIKissCellPreview().previewLayout(.fixed(width: previewSize.width, height: previewSize.height))
    }
    let view = UserKissCell()
    func makeUIView(context: UIViewRepresentableContext<UIKissCellPreview>) -> UIViewType {
        let frame = CGRect(x: 0, y: 0, width: UIKissCellPreview.previewSize.width, height: UIKissCellPreview.previewSize.height)
        view.frame = frame
        view.preview()
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<UIKissCellPreview>) {
        view.preview()
    }
}
#endif