

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdScreenViewController : UIViewController
@property(nonatomic)NSString *urlLink;
- (instancetype)initWithData:(NSString *)urlLink;
@end

NS_ASSUME_NONNULL_END
