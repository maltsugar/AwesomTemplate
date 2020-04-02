//
//  AWEmptyView.h
//  Pods
//
//  Created by zgy on 2020/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AWEmptyView : UIView

@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewCenterY; // -20


@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipLabTop; // 15



+ (instancetype)emptyViewView;




@end

NS_ASSUME_NONNULL_END
