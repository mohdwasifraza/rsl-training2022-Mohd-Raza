
#import "SecondScreenViewController.h"
#import "CustomDataModel.h"
#import "CustomTableViewCell.h"
#import "ThirdScreenViewController.h"
@interface SecondScreenViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic) UITableView *customTableView;
@property(nonatomic)NSArray<CustomDataModel *> *itemsData;
@property(nonatomic) UIButton *button;
@end

@implementation SecondScreenViewController

- (instancetype)initWithItemData:(NSArray<CustomDataModel *> *)itemsData {
    self = [super init];
    if (self) {
        _itemsData = itemsData;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Items";
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.customTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.customTableView.dataSource = self;
    self.customTableView.delegate = self;
    [self.customTableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    [self addButton];
    [self.view addSubview:self.customTableView];
    self.customTableView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.customTableView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
        [self.customTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10],
        [self.customTableView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-10],
        [self.customTableView.bottomAnchor constraintEqualToAnchor: _button.topAnchor constant:-10]
    ]];
}

-(void)addButton{
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_button setTitle:@"BACK" forState:UIControlStateNormal];
    _button.backgroundColor = UIColor.grayColor;
    [self.view addSubview:_button];
    _button.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [_button.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
        [_button.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-10],
        [_button.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-10],
        [_button.heightAnchor constraintEqualToConstant:60]
    ]];
}

-(void)buttonAction:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier"];
    cell.urlLabel.text = self.itemsData[indexPath.row].labelName;
    cell.urlDescription.text = self.itemsData[indexPath.row].labelDescription;
    cell.urlImageView.image = self.itemsData[indexPath.row].labelImage;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellText = self.itemsData[indexPath.row].labelLink;
    NSString *trim = [cellText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *trimmed = [trim stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSString *trimm = [trimmed stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    ThirdScreenViewController *thirdScreenViewController = [[ThirdScreenViewController alloc] initWithData:trimm];
    [thirdScreenViewController setModalPresentationStyle: UIModalPresentationFullScreen];
    [self presentViewController:thirdScreenViewController animated:YES completion:nil];
}

@end
