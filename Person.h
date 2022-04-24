#import <Foundation/Foundation.h>
@interface Person: NSObject{
    NSString *firstName;
    NSString *lastName;
    NSInteger personAge;
    
}

- (id)initWithName:(NSString *)firstName andLastName:(NSString *)lastName andAge:(NSInteger)age;
- (void)print;
@end

