#import <Foundation/Foundation.h>
#import "Organization.h" //forward declaration used here
//@class Organization;
@interface Employee : Person{
    NSString *fullName;
    Organization *organization;
    NSString *employeeId;
    
}

- (id)initWithName:(NSString *)fName andLastName:(NSString *)lName  andAge:(NSInteger)age andOrganization: (Organization *)orgName andEmpId:(NSString *)empId ;
- (void) updateEmployeeOrgan:(NSString *)oName  andOID:(NSString *)andOrgId andEList:(NSMutableArray *)adEmpList;
- (void)print;
@end

