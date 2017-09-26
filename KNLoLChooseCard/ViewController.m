//
//  ViewController.m
//  KNLoLChooseCard
//
//  Created by 刘凡 on 2017/9/25.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "ViewController.h"
#import "KNLOLChooseCardItem.h"
#import "KNLOLFlowLayout.h"


#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong)UICollectionView *KNLOLCollectionView;

//图片列表
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getData];
    [self CreateKNLOLCollectionView];

}

//获取数据
-(void)getData{
    _dataArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 15; i++) {
        NSString *str = [NSString stringWithFormat:@"img%d.jpg",i];
        [_dataArray addObject:str];
    }
}

-(void)CreateKNLOLCollectionView
{
    //创建layout , 所有的配置都在layout 里面
    KNLOLFlowLayout *layout = [[KNLOLFlowLayout alloc]init];
    
    _KNLOLCollectionView = ({
        UICollectionView *contionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, kScreenHeight) collectionViewLayout:layout];
        
        contionView.dataSource = self;
        contionView.delegate = self;
        
        //注册cell
        [contionView registerClass:[KNLOLChooseCardItem class] forCellWithReuseIdentifier:NSStringFromClass([KNLOLChooseCardItem class])];
        contionView;
    });
    
    [self.view addSubview:_KNLOLCollectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //返回数量
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //直接返回注册好了的Item
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([KNLOLChooseCardItem class]) forIndexPath:indexPath];
}


-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(KNLOLChooseCardItem *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    //给图片赋值
    [cell setImageView:_dataArray[indexPath.row]];
}

@end
