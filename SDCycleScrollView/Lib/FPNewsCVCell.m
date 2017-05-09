//
//  FPNewsCVCell.m
//  SDCycleScrollView
//
//  Created by peer on 09/05/2017.
//  Copyright © 2017 GSD. All rights reserved.
//

#import "FPNewsCVCell.h"
#import "Masonry.h"

@implementation FPNewsTagLabel

-(CGSize)intrinsicContentSize{
    CGSize size = [super intrinsicContentSize];
    size.height += 8;
    size.width += 10;
    return size;
}

@end

@implementation FPNewsItemModel
@end

@implementation FPNewsItemView

-(UILabel *)labelFactory{
    UILabel *label = [[FPNewsTagLabel alloc] init];
    label.backgroundColor = UIColor.clearColor;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

-(id)initWithNewsModel:(FPNewsItemModel *)itemModel{
    self = [super initWithFrame:CGRectZero];
    if (self){
        _tagLabel = [self labelFactory];
        _titleLabel = [self labelFactory];
        
        _tagLabel.layer.borderColor = UIColor.redColor.CGColor;
        _tagLabel.layer.borderWidth = 1.5;
        _tagLabel.layer.cornerRadius = 5.0;
        _tagLabel.font = [UIFont systemFontOfSize:13];
        _tagLabel.text = itemModel.newsTag;
        [self addSubview:_tagLabel];
        
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = itemModel.newsTitle;
        [self addSubview:_titleLabel];
        
        [self makeConstraints];
    }
    return self;
}

-(void)makeConstraints{
    CGFloat lrPading = 10;
    CGFloat tbPading = 0;
    CGFloat padding = 8;
    
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).offset(lrPading);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.tagLabel.mas_trailing).offset(padding);
        make.centerY.equalTo(self.mas_centerY);

    }];
}

@end


@implementation FPNewsCVCell

-(void)configItems:(NSArray<FPNewsItemModel *> *)items{
    self.firstItemView = [[FPNewsItemView alloc] initWithNewsModel:items[0]];
    self.secondItemView = [[FPNewsItemView alloc] initWithNewsModel:items[1]];
    
    [self.contentView addSubview:self.firstItemView];
    [self.contentView addSubview:self.secondItemView];
    
    [self.firstItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing);
        make.top.equalTo(self.contentView.mas_top);
    }];
    
    [self.secondItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView.mas_leading);
        make.trailing.equalTo(self.contentView.mas_trailing);
        make.top.equalTo(self.firstItemView.mas_bottom);
        make.bottom.equalTo(self.contentView.mas_bottom);
        
        make.height.equalTo(self.firstItemView.mas_height).priorityHigh();
    }];
}

@end
