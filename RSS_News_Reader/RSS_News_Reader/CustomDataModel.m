

#import "CustomDataModel.h"

@implementation CustomDataModel
- (instancetype)initWithlabelName:(NSString *)labelName labelDescription:(NSString *)labelDescription
                       labelImage:(UIImage *)image labelLink:(NSString *)labelLink{
    self = [super init];
    if (self) {
        _labelName = labelName;
        _labelDescription = labelDescription;
        _labelImage = image;
        _labelLink = labelLink;
    }
    return self;
}
@end
