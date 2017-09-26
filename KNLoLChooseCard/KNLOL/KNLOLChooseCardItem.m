//
//  KNLOLChooseCardCell.m
//  KNLoLChooseCard
//
//  Created by 刘凡 on 2017/9/25.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KNLOLChooseCardItem.h"


@interface KNLOLChooseCardItem()

//LOL图片
@property(nonatomic, strong) UIImageView *LOLimageView;

@end

@implementation KNLOLChooseCardItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.LOLimageView];
        
        //设置大小为cell的大小
        self.LOLimageView.frame = self.contentView.bounds;
    }
    return self;
}


-(void)setImageView:(NSString *)imageString{
    self.LOLimageView.image = [UIImage imageNamed:imageString];
}

//懒加载
-(UIImageView *)LOLimageView{
    if (!_LOLimageView) {
        _LOLimageView = [[UIImageView alloc]init];
        _LOLimageView.layer.shadowColor = [UIColor whiteColor].CGColor;
        _LOLimageView.layer.shadowOffset = CGSizeMake(0.5, 0.5);
        _LOLimageView.layer.shadowRadius = 5;
        _LOLimageView.layer.shadowOpacity = 0.8;
    }
    return _LOLimageView;
}
@end
