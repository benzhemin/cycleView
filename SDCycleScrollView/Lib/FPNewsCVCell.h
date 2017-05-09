//
//  FPNewsCVCell.h
//  SDCycleScrollView
//
//  Created by peer on 09/05/2017.
//  Copyright © 2017 GSD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FPNewsTagLabel : UILabel
@end

@interface FPNewsItemModel : NSObject

@property (nonatomic, copy) NSString *newsTag;
@property (nonatomic, copy) NSString *newsTitle;

@end

@interface FPNewsItemView : UIView

@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UILabel *titleLabel;

-(id)initWithNewsModel:(FPNewsItemModel *)itemModel;

@end

@interface FPNewsCVCell : UICollectionViewCell

@property (nonatomic, strong) FPNewsItemView *firstItemView;
@property (nonatomic, strong) FPNewsItemView *secondItemView;

-(void)configItems:(NSArray<FPNewsItemModel *> *)items;

@end
