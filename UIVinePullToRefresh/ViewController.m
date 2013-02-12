//
//  ViewController.m
//  UIVinePullToRefresh
//
//  Created by Bill on 2/9/13.
//  Copyright (c) 2013 Bill Richards. All rights reserved.
//

#import "ViewController.h"
#import "TriangleRefreshView.h"

@interface ViewController () {
    BOOL isDragging;
    BOOL isLoading;
}
@property (strong, nonatomic) TriangleRefreshView *trf;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)addPullToRefreshHeader;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addPullToRefreshHeader];
}

- (void)addPullToRefreshHeader
{
    self.trf = [[TriangleRefreshView alloc] initWithFrame:CGRectMake(5, -60, 18, 40)];
    self.trf.center = CGPointMake(self.view.frame.size.width/2, self.trf.frame.origin.y+self.trf.frame.size.height/2);
    [self.tableView addSubview:self.trf];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    return cell;
}


#pragma mark - UIScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float minY = 20.0f;
    float maxY = 70.0f;
    float curY = fabsf(scrollView.contentOffset.y);
    float perY = (curY-minY)/(maxY-minY);
    if(perY < 0) perY = 0;
    if(perY >= 1) perY = 1;
    
    
    float triminY1 = 35.0f;
    float trimaxY1 = 50.0f;
    float perTri1  = (curY-triminY1)/(trimaxY1-triminY1);
    if(perTri1 < 0) perTri1 = 0;
    if(perTri1 >= 1) perTri1 = 1;
    self.trf.tv3.alpha = perTri1 > .33 ? .33 : perTri1;
    self.trf.tv3.transform = CGAffineTransformMakeScale(perTri1,perTri1);

    triminY1 += 10;
    float trimaxY2 = 60.0f;
    float perTri2  = (curY-triminY1)/(trimaxY2-triminY1);
    if(perTri2 < 0) perTri2 = 0;
    if(perTri2 >= 1) perTri2 = 1;
    self.trf.tv2.alpha = perTri2 > .66 ? .66 : perTri2;;
    self.trf.tv2.transform = CGAffineTransformMakeScale(perTri2,perTri2);
    
    triminY1 += 10;
    float trimaxY3 = 70.0f;
    float perTri3  = (curY-triminY1)/(trimaxY3-triminY1);
    if(perTri3 < 0) perTri3 = 0;
    if(perTri3 >= 1) perTri3 = 1;
    self.trf.tv.alpha = perTri3;
    self.trf.tv.transform = CGAffineTransformMakeScale(perTri3,perTri3);


}

@end
