
#import "Person.h"
@implementation Person
- (id)initWithName:(NSString *)fName andLastName:(NSString *)lName andAge:(NSInteger)age{//initialser
firstName=fName;
lastName=lName;
personAge=age;
    return self;
}
- (void)print {
   NSLog(@"Name: %@", firstName);
   NSLog(@"Name: %@", lastName);
   NSLog(@"Age: %ld", personAge);
}

@end