基于SSM的客户关系管理系统 2023.10-2023.11

开发环境：idea2021

操作系统：Windows10

技术栈：前端主要使用html，css，js，jQuery和jsp，后端主要使用Spring，
SpringMVC和Mybatis框架，前端与后端数据交互使用Ajax技术。

项目地址：https://github.com/axios123456789/CRM.git

项目描述：本系统主要使用人群为销售和贸易企业的内部人员，首先由市场部的人员
设计各种市场活动宣传公司产品，产品信息打响出去以后，可能会有客户（指别的公
司和企业）主动联系公司，公司也会主动联系各种客户询问对本公司的产品了解等
等。这个时候由初级销售人员与这些客户交流，搜集客户各种信息，得到一条一条线
索。每一条线索都包含个人信息和客户信息，初级销售人员对每一条线索进行跟踪，
如果发现对方有购买产品的意向，就将该线索转换成客户和联系人，由更高级的销售
人员与之联系，沟通，如果发现对方没有购买意向，可以过一段时间再联系或者将线
索删除。对于那些转换成了客户和联系人的线索，都是有购买意向的，这时由更高级
的销售人员进行跟踪联系，如果确定要购买产品的就给他创建一笔交易，不购买的可
以过一段时间再跟踪。对于创建好的交易，则由最高级的销售人员来跟踪，他们负责
一步一步帮助客户完成交易，期间要贴心的引导客户，提高客户的满意度，让其成为
公司的永久客户。

项目功能：主要的功能模块有市场活动，线索，客户，联系人，交易。这些功能模块
都可以进行添加或修改记录，删除一条或多条记录，单/多条件查询和分页查询记
录。每一个功能模块的每一条记录都可以进入查看详细信息，其中有这条记录的所有
信息，以及可以对这条记录进行评价(备注）。其中线索的详细信息页中可以将该线索
与市场活动进行关联（也就是该线索是因为哪些市场活动而获得的），同时还有线索
的转换功能（就是将线索转换成客户和联系人）。在客户详细信息页可以创建交易以
及看到其关联的联系人，以及增删联系人。在联系人详细信息页可以创建交易和关联
市场活动（也就是这个联系人参加了哪些市场活动）。

项目难点：1.最核心的业务”转换“涉及到10张以上表的操作，是一个难点。在进行
转换时，需要将线索中的客户信息转换到客户表中，个人信息转换到联系人表中，线
索备注信息都转换一份到客户备注表，联系人备注表中，如果创建了交易还要将备注
信息转换到交易备注表中和创建的交易信息添加到交易表中，将线索与市场活动的关
联关系转换到联系人市场活动关联关系表中，最后删除线索与市场活动关联关系，删
除线索备注，删除线索。2.在做关联线索和市场活动，联系人和市场活动功能时，需
要根据线索id查询到没有与之关联的所有市场活动，其中涉及到6张表以上的多表查
询和子查询。

项目优化：1.在创建联系人填写客户信息的时候，有一个键盘弹起事件在客户表中根
据名字模糊查询客户名字进行自动补全。2.在删除客户的时候，客户对应的联系人会
全部删掉，被删掉的联系人对应的备注信息会全部删掉，对应的和市场活动的关联关
系会全部删掉。