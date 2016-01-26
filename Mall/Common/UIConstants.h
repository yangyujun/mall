/*!
 @header UIConstants
 @abstract 定义所有与UI有关的常量
 @author wenchuang
 @version 1.0
 */

#import "UIKit+Additions.h"

//定义所有与UI有关的常量
/*** universal font constants ***/

// Note: we need to stop using these.
// Devices with Retina displays use Helvetica Neue instead of Helvetica.
// Use systemFontOfSize and boldSystemFontOfSize instead.

//标准字体和加粗字体
#define STANDARD_FONT @"Helvetica"
#define BOLD_FONT @"Helvetica-Bold"

/*** 索搜栏常量 ***/
//搜索栏前景色
#define SEARCH_BAR_TINT_COLOR [UIColor colorWithRed:0.6 green:0.0 blue:0.0 alpha:1.0]

/*** 表视图常量 ***/
//表头字体大小
#define TABLE_HEADER_FONT_SIZE 20.0
//表分割线颜色
#define TABLE_SEPARATOR_COLOR [UIColor colorWithWhite:0.8 alpha:1.0]
//主分组表背景颜色
#define PRIMARY_GROUP_BACKGROUND_COLOR [UIColor whiteColor]
//次分组表背景颜色
#define SECONDARY_GROUP_BACKGROUND_COLOR [UIColor colorWithWhite:1.0 alpha:0.65]
//单元格标准字体颜色
#define CELL_STANDARD_FONT_COLOR [UIColor colorWithHexString:@"#171717"]
//单元格标准字体大小
#define CELL_STANDARD_FONT_SIZE 17.0
//单元格详细信息字体颜色
#define CELL_DETAIL_FONT_COLOR [UIColor colorWithHexString:@"#4C4C4C"]
//单元格详细信息字体大小
#define CELL_DETAIL_FONT_SIZE 13.0
//单元格水平边距
#define CELL_HORIZONTAL_PADDING 10.0
//单元格竖直边距
#define CELL_VERTICAL_PADDING 10.0
//单元格两条线之间高度
#define CELL_TWO_LINE_HEIGHT 56.0 /* the height needed for a standard cell to have 10 pixel padding */
//不分组表区头高度
#define UNGROUPED_SECTION_HEADER_HEIGHT 22.0
//不分组表区字体颜色
#define UNGROUPED_SECTION_FONT_COLOR [UIColor colorWithHexString:@"#CCCCCC"]
//不分组表区背景颜色
#define UNGROUPED_SECTION_BACKGROUND_COLOR [UIColor colorWithHexString:@"#333333"]
//分组表区头高度
#define GROUPED_SECTION_HEADER_HEIGHT 36.0
//分组表区字体颜色
#define GROUPED_SECTION_FONT_COLOR [UIColor colorWithHexString:@"#333333"]
//单元格选中颜色
#define CELL_SELECTION_BLUE [UIColor colorWithHexString:@"#0257EE"]
//单元格中内容的标准字体和颜色

/*** 表内容视图常量 ***/
//表标准内容字体大小
#define STANDARD_CONTENT_FONT_SIZE 17.0
//表标准内容字体颜色
#define STANDARD_CONTENT_FONT_COLOR [UIColor colorWithHexString:@"#202020"]
//链接字体颜色
#define EMBEDDED_LINK_FONT_COLOR [UIColor colorWithHexString:@"#993333"]

/*** 布局常量 ***/
//导航栏高度
#define NAVIGATION_BAR_HEIGHT 44.0f
//自定义滚动视图选项卡的水平边距
#define SCROLL_TAB_HORIZONTAL_PADDING 5.0
//自定义滚动视图选项卡的水平间距
#define SCROLL_TAB_HORIZONTAL_MARGIN  5.0
