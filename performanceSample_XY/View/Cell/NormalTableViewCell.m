//
//  NormalTableViewCell.m
//  performanceSample_XY
//
//  Created by fotor on 2021/12/20.
//

#import "NormalTableViewCell.h"
#import "NormalDataCellModel.h"

@interface NormalTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UIImageView *urlImageView;
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation NormalTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initUserInterface];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUserInterface];
    }
    return self;
}

- (void)initUserInterface
{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.desLabel];
//    [self.contentView addSubview:self.urlImageView];
    [self.contentView addSubview:self.iconView];
}

- (void)setCellModel:(NormalDataCellModel *)cellModel
{
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.title;
    self.desLabel.text = cellModel.des;
    
//    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:cellModel.url]];
//    self.urlImageView.image = [UIImage imageWithData:imgData];
    self.iconView.image = [UIImage imageNamed:cellModel.icon];
//    for (int i = 0; i < 10; i++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:cellModel.icon]];
//        imageView.frame = CGRectMake(120, 10, 120, 120);
//        [self.contentView addSubview:imageView];
//    }
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 14)];
        _titleLabel.font = [UIFont systemFontOfSize:12.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)desLabel
{
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 100, 12)];
        _desLabel.font = [UIFont systemFontOfSize:10.f];
        _desLabel.textColor = [UIColor blueColor];
    }
    return _desLabel;
}

- (UIImageView *)urlImageView
{
    if (!_urlImageView) {
        _urlImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 10, 70, 70)];
        _urlImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _urlImageView;
}

- (UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 10, 120, 120)];
        _iconView.contentMode = UIViewContentModeScaleAspectFit;
        
        CALayer *layer = _iconView.layer;
        layer.shadowColor = UIColor.blackColor.CGColor;
        layer.shadowOpacity = 1.f;
        layer.shadowRadius = 3.f;
        layer.shadowOffset = CGSizeMake(1.f, 1.f);
        layer.shadowPath = CGPathCreateWithRect(CGRectMake(0, 15, 120, 90), NULL);
    }
    return _iconView;
}

@end
