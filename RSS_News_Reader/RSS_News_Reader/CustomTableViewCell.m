
#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _urlLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _urlLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _urlLabel.numberOfLines = 0;
        [_urlLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [self.contentView addSubview:_urlLabel];
        _urlDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        _urlDescription.translatesAutoresizingMaskIntoConstraints = NO;
        _urlDescription.numberOfLines = 3;
        [self.contentView addSubview:_urlDescription];
        _urlImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _urlImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_urlImageView];        
        [self addConstraints];
    }
    return self;
}

-(void)addConstraints {
    [NSLayoutConstraint activateConstraints:@[
        
        [self.urlImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10],
        [self.urlImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
        [self.urlImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],
        [self.urlImageView.heightAnchor constraintLessThanOrEqualToConstant:150],
        [self.urlImageView.widthAnchor constraintEqualToConstant:100],
        
        [self.urlLabel.leadingAnchor constraintEqualToAnchor:self.urlImageView.trailingAnchor constant:10],
        [self.urlLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10],
        [self.urlLabel.bottomAnchor constraintEqualToAnchor:self.urlDescription.topAnchor constant:-5],
        [self.urlLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
        
        [self.urlDescription.leadingAnchor constraintEqualToAnchor:self.urlLabel.leadingAnchor constant:10],
        [self.urlDescription.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10],
        [self.urlDescription.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
    ]];
}

@end
