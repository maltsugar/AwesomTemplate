//
//  CDFloatView.swift
//  CRM
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019 翼点网络. All rights reserved.
//

import UIKit

@objc protocol CDFloatViewDelegate: NSObjectProtocol {
    @objc optional func floatView(_ view: CDFloatView, didClick index: Int)
}


class CDFloatView: UIView {
    
    private let tagStart = 1237
    private var btns: [QMUIButton]!
    private var totalHeight: CGFloat {
        get {
            var h = CGFloat(0)
            
            for i in 0 ..< items.count {
                let item = items[i]
                h += item.height
                if i != (items.count - 1) {
                    h += itemSpace
                }
            }
            return h
        }
    }
    
    
    
    var animateWidth = CGFloat(78)
    var items: [Item] {
        didSet {
            setupButtons()
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }

    var itemSpace: CGFloat = 10 {
        didSet {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    var fitLeft: Bool {
        willSet {
            var orignX = CGFloat(0)
            if newValue == false {
                orignX = kScreenWidth - width
            }
            self.x = orignX
        }
    }
    
    

    weak var delegate: CDFloatViewDelegate?
    
    
    
    
    
    /// 初始化对象
    ///
    /// - Parameters:
    ///   - items: 选项item模型数组
    ///   - width: 宽度
    ///   - orignY: 左上角的y值
    ///   - fitLeft: 是否靠左
    init(items: [Item], width: CGFloat, orignY: CGFloat, fitLeft: Bool) {
        self.items = items
        self.fitLeft = fitLeft
        
        var orignX = CGFloat(0)
        if !fitLeft {
            orignX = kScreenWidth - width
        }
        super.init(frame: CGRect(x: orignX, y: orignY, width: width, height: 0))
        setupButtons()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupButtons() {
        btns = [QMUIButton]()
        var m = 0;
        for _i in items {
            let btn = QMUIButton(type: .custom)
            btn.adjustsButtonWhenHighlighted = false
            btn.imagePosition = _i.imgPosition
            btn.spacingBetweenImageAndTitle = 10
            btn.setTitle(_i.title, for: .normal)
            btn.setTitleColor(_i.titleColor, for: .normal)
            btn.titleLabel?.font = _i.titleFont
            btn.setImage(UIImage(named: _i.iconName), for: .normal)
            btn.height = _i.height
            
            if let _bgColor = _i.bgColor {
                btn.backgroundColor = _bgColor
            }
            
            if let _bgImg = _i.bgImgName {
                btn.setBackgroundImage(UIImage(named: _bgImg), for: .normal)
            }
            
            self.addSubview(btn)
            btn.addTarget(self, action: #selector(handleBtnAction(sender:)), for: .touchUpInside)
            
            btn.tag = tagStart + m
            btns.append(btn)
            m += 1
        }
        
    }
    
    
    
    
    
    @objc
    private func handleBtnAction(sender: UIButton) {
        let idx = sender.tag - tagStart
        delegate?.floatView?(self, didClick: idx)
    }
    
    
    /// 刷新状态
    ///
    /// - Parameters:
    ///   - isNarrow: 是否为 ”收起“
    func refreshStatus(isNarrow: Bool) {
        
        var orignX = CGFloat(0)
        if fitLeft {
            if isNarrow {
                orignX -= animateWidth
            }
        }else
        {
            orignX = kScreenWidth - self.width
            if isNarrow {
                orignX += animateWidth
            }
        }
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.x = orignX
        }, completion: nil)
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.height = totalHeight
        let width = self.width
        
        
        var originY = CGFloat(0);
        for i in 0 ..< btns.count {
            let btn = btns[i]
            btn.frame = CGRect(x: 0, y: originY, width: width, height: btn.height)
            
            if i != (btns.count - 1) {
                originY += itemSpace
                originY += btn.height
            }
        }
    }
    
    
    
}


extension CDFloatView {
    
    struct Item {
        var iconName: String
        var title: String
        var bgImgName: String?
        
        var imgPosition: QMUIButtonImagePosition
        var bgColor: UIColor?
        var shadowColor: UIColor
        var titleColor: UIColor
        var titleFont: UIFont
        var height: CGFloat
        
        
        init(iconName: String, title: String, bgImgName: String? = nil, bgColor: UIColor? = nil) {
            self.iconName = iconName
            self.title = title
            self.bgImgName = bgImgName
            self.bgColor = bgColor
            
            imgPosition = .left
            shadowColor = UIColor.black.withAlphaComponent(0.16)
            titleColor = UIColor(hex6: 0x5095F1)
            titleFont = UIFont.systemFont(ofSize: 14, weight: .medium)
            height = 44
        }
    }
}
