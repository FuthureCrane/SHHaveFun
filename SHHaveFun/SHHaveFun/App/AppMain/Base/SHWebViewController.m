
#import "SHWebViewController.h"

@interface SHWebViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation SHWebViewController

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 页面字体缩放功能
- (void)changeWebFontScale {
    NSString *jsString = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust=";
    NSString *fontScale = @"'100%'";
    
    jsString = [jsString stringByAppendingString:fontScale];
    [self.webView stringByEvaluatingJavaScriptFromString:jsString];
    
//    if (nSize < 75 || nSize > 125)
//        nSize = 100;
//    NSString* str = [NSString stringWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%ld%%'", (long)nSize];
//    
//    NSString* strJS = [str tztencodeURLString];
//    //
//    [self.pWebView tztStringByEvaluatingJavaScriptFromString:strJS];
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

@end
