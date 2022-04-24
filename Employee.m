#import "Person.h"
#import "Employee.h"

@implementation Employee:Person //inherited person class
-(id)initWithName:(NSString *)fName  andLastName:(NSString *)lName andAge:(NSInteger)age andOrganization: (Organization *)organ andEmpId:(NSString *)empId{
   firstName=fName;
   lastName=lName;
   personAge=age;
   organization=organ;
   employeeId=empId;
   fullName=[NSString stringWithFormat:@"%@ %@", firstName,lastName];
   return self;
   }
-(void) updateEmployeeOrgan:(Organization *)newOrg{//updating employees organization for employess who have changed their organization
   organization=newOrg;
  }
 -(NSString*) fullName{
     return fullName;
 }

- (void)print {
   NSLog(@"Name: %@", fullName);
   NSLog(@"EmployeeId: %@ and age is %ld", employeeId, personAge);
   NSLog(@"Organization name is %@ and organization id is %@ ", organization.orgName,organization.orgId);
   
  
   
  
  }
@end

