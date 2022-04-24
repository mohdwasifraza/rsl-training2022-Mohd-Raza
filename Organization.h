#import <Foundation/Foundation.h>
@class Employee;//forward class declaration
@interface Organization: NSObject{
    NSString *orgName;
    NSString *orgId;
    NSMutableArray *empList;// array of objects 
    
}
@property(readonly,copy) NSString *orgName, *orgId;//readonly properties
@property(readonly,assign) NSMutableArray *empList;
-(void) removeEmployee:(Employee *)emp;
-(id)initWithName:(NSString *)orName  andOrgId:(NSString *)orId ;
-(NSMutableArray*) addEmployee:(Employee* )array1;
- (void)print;
@end

