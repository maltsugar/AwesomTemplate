# 新项目模板
---
### 功能介绍
- 修改bundleID直接修改就行，[这里](https://github.com/maltsugar/AwesomTemplate#awdes)有怎么修改Target名(如果不能跳转，你往下翻吧(⊙﹏⊙)b)
- 此模板可以帮助快速搭建一个APP的“地基”，省却设置pch，宏，info.plist的一堆配置等步骤
- 集成几乎必用到的库，具体用法可以百度搜，也可以咨询我（我有空的话）省去导库 找库的时间
- 编译build值自增1，可以显示这个项目经过了多少次“打磨”，也方便传iTunes Connect 或者标记测试包，值必须不一样。（不需要的话删除Build Phases下的 Run Script）  
- 项目目录分区明确，参考[iOS App开发那些事](http://www.cocoachina.com/programmer/20140526/8551.html)，我也一直用这种模式，不得不说，目录层次确实清晰，coding要优雅，也方便别人维护  
![目录结构](http://wx3.sinaimg.cn/mw690/72aba7efgy1flhcn16kbqj21120yggrh.jpg)  

---

#### 最后，郑重提醒：  
这只是一个模板，没有什么实质性的东西，只是为了省去每次开发新项目，做的一些繁琐且没有技术含量的无用功，只是一个简单的收集整理，用git方便维护，之前一直放网盘。  
感谢为开源无私奉献的前辈，这里面使用的库，也是亲身实践较好用的，没有其他目的，只是我感觉比较顺手。当然你也可以找自己顺手的，替换里面的库。
库如果有重大更新，比如适配iPhone X的MJRefresh，我也会更新的！

# 更改项目target教程
<a id="awdes">-</a>
此处演示是xcode9，我之前用xcode8 也改过，从xcode5以后基本都一样。[我参考的这篇文章](http://www.cnblogs.com/tbfirstone/p/3601541.html)
#### 将Awesome改为MyProject
1. 修改工程名  
	![](http://wx2.sinaimg.cn/mw690/72aba7efgy1flhiprp2unj20dq0b0taa.jpg)   
	点击如图箭头所示，键盘Enter键，修改为MyProject，会出现以下提示
	![](http://wx2.sinaimg.cn/mw690/72aba7efgy1flhdl2mkvbj20rs0l4gnn.jpg)   
	点击 Rename，OK
	
	
2. 修改Scheme   
	![](http://wx3.sinaimg.cn/mw690/72aba7efgy1flhdl3b32kj20ju0bi40s.jpg)   
	选中Awesome，Enter键，修改为MyProject
	![](http://wx1.sinaimg.cn/mw690/72aba7efgy1flhdl3uel1j216o0o0q4j.jpg)

3. 修改工程目录名称   
	![](http://wx3.sinaimg.cn/mw690/72aba7efgy1flhdl4k7qaj20ky0vqq7w.jpg)   
	Show In Finder,修改此目录为MyProject，修改后所有文件变红色
	![](http://wx3.sinaimg.cn/mw690/72aba7efgy1flhi3a4r3yj20fm0r2765.jpg)   
	修改此处Name 为 MyProject,点击灰色文件夹图标
	![](http://wx2.sinaimg.cn/mw690/72aba7efgy1flhdl5s9cij20p80nmq5r.jpg)   
	选中项目目录
4. 修改pch文件和info.plist文件目录   
	![](http://wx1.sinaimg.cn/mw690/72aba7efgy1flhdl6bermj21a20j4die.jpg)
	![](http://wx1.sinaimg.cn/mw690/72aba7efgy1flhdl6wv4dj21c00vqgqu.jpg)
5. bulid succeed!别忘了把最外面的文件夹名称也改下，删除`.git`隐藏文件夹   
	![](http://wx1.sinaimg.cn/mw690/72aba7efgy1flhdl7g077j20og01wwem.jpg)   
# 注意
该项目使用了YYCache，所有Xcode要8.0以上，可能有的同学的xcode版本问题，编译报错.   
##### 尝试导入 `lizb.tbd`  `libsqlite3.tbd`