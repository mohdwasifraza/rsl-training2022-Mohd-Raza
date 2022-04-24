#import "Person.h"
#import "Organization.h"
//#import "Employee.h"
@class Employee;
@implementation Organization

@synthesize orgName, orgId, empList;

-(id)initWithName:(NSString *)orName  andOrgId:(NSString *)orId {
  orgName=orName;
   orgId=orId;
   empList=[[NSMutableArray alloc] init];
   return self;
 }

-(NSMutableArray *) addEmployee:(Employee *)array1{//Adding objects of employee type in the ampList array
    [empList addObject:array1 ];
    return empList;
}
-(void) removeEmployee:(Employee *)emp{//removing employee object from empList Array who have left the organization
   
    for(id item in empList) {
        if(item==emp){
        [empList removeObject:item];
        break;
         }
    }
}
    
-(void) print{
    
    NSLog(@"Employee List %@ " ,orgName);
    int size=[empList count];
    if(size==0){
        NSLog(@"Empty list ");
    }
    for(int i =0;i<size;i++){//printing the employee full name from emplyee list
        id element=[empList objectAtIndex:i];
        NSLog(@"%d  %@",i+1, [element fullName]);
        
    }
    
}
@end
