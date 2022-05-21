
#import "ViewController.h"
#import "CustomDataModel.h"
#import "SecondScreenViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate>{
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSMutableString *description;
    NSString *element;
    UIActivityIndicatorView *activityIndicator;
    UIButton *button;
}
@property(nonatomic) UITableView *urlTableView;
@property(nonatomic) UITextField *textfield;
@property(nonatomic) NSMutableArray *urls;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    _urls = [[NSMutableArray alloc]init];
    [self textField];
    [self addButton];
    self.urlTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.urlTableView.dataSource = self;
    self.urlTableView.delegate = self;
    [self.urlTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    [self.view addSubview:self.urlTableView];
    [self.view addSubview:self.textfield];
    [self.view addSubview:button];
    [self addConstraints];
    
}

- (void)addConstraints {
    self.urlTableView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.urlTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10],
        [self.urlTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10],
        [self.urlTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-10]
    ]];
    self.textfield.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.textfield.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
        [self.textfield.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10],
        [self.textfield.trailingAnchor constraintEqualToAnchor:button.leadingAnchor constant:-10],
        [self.textfield.bottomAnchor constraintEqualToAnchor:self.urlTableView.topAnchor constant:-10]
    ]];
    button.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [button.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
        [button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-10],
        [button.bottomAnchor constraintEqualToAnchor:self.urlTableView.topAnchor constant:-10],
        [button.widthAnchor constraintEqualToConstant:80],
        [button.heightAnchor constraintEqualToConstant: 60]
    ]];
    

}
- (void)textField {
    self.textfield = [[UITextField alloc] initWithFrame:CGRectZero];
    self.textfield.borderStyle = UITextBorderStyleRoundedRect;
       self.textfield.font = [UIFont systemFontOfSize:18];
      self.textfield.placeholder = @"enter text";
}

-(void)addButton{
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"ADD" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.grayColor;
    
    
}

-(void)buttonAction:(id)sender {
  // sender is the object that was tapped, in this case its the button.
    NSString *strValue = self.textfield.text;
    [self.urlTableView beginUpdates];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: _urls.count inSection:0];
    [_urls addObject:strValue];
    [self.urlTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self.urlTableView endUpdates];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _urls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    cell.textLabel.text = self.urls[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    activityIndicator.alpha = 1.0;
    [self.view addSubview:activityIndicator];
    activityIndicator.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2);
    [activityIndicator startAnimating];
    [self performSelector:@selector(secondMethod) withObject:nil afterDelay:2.0 ];
    NSString *cellText = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    feeds = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString: cellText];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
}

- (void)secondMethod{
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    NSArray<CustomDataModel *> *items = [self createDataModel];
    SecondScreenViewController *secondScreenViewController = [[SecondScreenViewController alloc] initWithItemData:items];
    [secondScreenViewController setModalPresentationStyle: UIModalPresentationFullScreen];
    [self presentViewController:secondScreenViewController animated:YES completion:nil];
    [activityIndicator stopAnimating];
}

- (NSMutableArray<CustomDataModel *> *)createDataModel {
    NSMutableArray *customArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *currItem in feeds) {
        NSMutableString *label= [NSMutableString string], *link=[NSMutableString string], *description=[NSMutableString string] ;
        for(NSString *key in currItem.allKeys) {
            if([key  isEqual: @"title"]){
                label = currItem[key];
            }
            else if([key  isEqual: @"link"]){
                link = currItem[key];
            }
            if([key  isEqual: @"description"]){
                description = currItem[key];
            }
        }
        CustomDataModel *item1 = [[CustomDataModel alloc] initWithlabelName:label labelDescription:description labelImage:[UIImage imageNamed:@"five"] labelLink:link];
        [customArray addObject:item1];
    }
    return customArray;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"item"]) {
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
        description = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    }
    else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
    else if ([element isEqualToString:@"description"]) {
        [description appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [item setObject:description forKey:@"description"];
        [feeds addObject:[item copy]];
    }
}
@end


