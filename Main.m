#import <Foundation/Foundation.h>
#import "Person.h"
#import "Employee.h"
#import "Organization.h"
int main(void){
    NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
   
   Organization *org=[[ Organization alloc] initWithName:@"Google"  andOrgId:@"564"]; //initialised organ class
   
   Employee *employee = [[Employee alloc] initWithName:@"Mohd" andLastName:@"Raza"  andAge:25 andOrganization:org andEmpId:@"8676"]; //initialised employee class and added organization
   [employee print];//print employee details
    
  
   
   [org addEmployee:employee]; //added employee to organization
   [org print];//print organization details with employee list
  
   Organization *newOrg=[[ Organization alloc] initWithName:@"Microsoft"  andOrgId:@"564" ];// // created new Organizations
   [employee updateEmployeeOrgan:newOrg ];// updated employee's organization to new Organization
   [employee print];//print employee details
   
   [newOrg addEmployee:employee]; //added employee to new organization
   [newOrg print];//print new organization details with employee list
   
   [org removeEmployee:employee];//remove employee from the previous organization
   [org print];//print organization details with employee list
   [org1 print];//print new  organization details with employee list

  //[org1 print];
   [pool drain];
   
  
    return 0;
}