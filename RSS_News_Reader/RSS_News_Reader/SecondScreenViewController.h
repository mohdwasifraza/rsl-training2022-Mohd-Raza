

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class CustomDataModel;
@interface SecondScreenViewController : UIViewController
- (instancetype)initWithItemData:(NSArray<CustomDataModel *> *)itemsData;
@end

NS_ASSUME_NONNULL_END
