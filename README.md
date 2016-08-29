# 介绍
Jfinal实现的用户权限管理系统，非常适合很多初学jfinal和beetl的朋友们，可以说算是很全面的demo工程。对于初学权限设计的人来说，也算是个最简洁基于RBAC模型的权限实现.
你也可以基于它来做项目，它只是做了一些绝大部分项目都应该做的一些基础功能。charisma ui和rapdio UI的使用和扩展，改造后，支持基于jquery form的Ajax交互，
自带弹出框的使用，表单数据校验.ztree的详细使用方法，有简单的树形展示，单选多选的使用，默认选中效果的实现，复杂的树操作有还有部门+人员组合，模块+功能组合.

## 运行环境

* java1.6+
* beetl
* jfinal
* charisma ui
* rapdio ui

# 功能介绍：

1. 系统实现了基于URL的权限管理，页面操作控制到按钮级别，根据权限配置进行显示，并在拦截器再次认证，只有分配权限后才能进行操作

2. 所有的URL访问都进行了详细的日志记录，包括action耗时、视图耗时、总耗时，不管是访问成功还是失败，或者有没权限，在日志表都详细记录

3. 基于charisma的UI进行了二次扩展，实现了表单数据校验，单页面Ajax请求（基于jqueryform，它本身的支持很局限）

# 演示效果

![首页演示效果图](http://static.oschina.net/uploads/space/2014/0603/163426_ycJe_99629.png)

# 支持
[作者:littleant](http://my.oschina.net/dongcb678/home)
