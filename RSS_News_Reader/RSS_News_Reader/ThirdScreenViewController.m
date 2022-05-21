#import <WebKit/WKWebView.h>
#import <WebKit/WKWebViewConfiguration.h>
#import "ThirdScreenViewController.h"

@interface ThirdScreenViewController ()
@property(nonatomic) UIButton *button;
@end

@implementation ThirdScreenViewController
- (instancetype)initWithData:(NSString *)urlLink {
    self = [super init];
    if (self) {
        _urlLink = urlLink;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addButton];
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    NSURL *nsurl=[NSURL URLWithString:_urlLink];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webView loadRequest:nsrequest];
    [self.view addSubview:webView];
    webView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[//
        [webView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:10],
        [webView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:10],
        [webView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-10],
        [webView.bottomAnchor constraintEqualToAnchor: _button.topAnchor constant:-10]
    ]];
}

-(void)addButton{
    [_button addTarget:self action:@selector(buttonAction:)  forControlEvents:UIControlEventTouchUpInside];
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

@end
