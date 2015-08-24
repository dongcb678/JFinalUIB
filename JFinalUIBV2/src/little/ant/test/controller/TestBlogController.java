package little.ant.test.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.controller.BaseController;
import little.ant.platform.model.BaseModel;
import little.ant.test.service.TestBlogService;
import little.ant.test.validator.TestBlogValidator;
import little.ant.test.model.TestBlog;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/test/testBlog
 * /jf/test/testBlog/save
 * /jf/test/testBlog/edit
 * /jf/test/testBlog/update
 * /jf/test/testBlog/view
 * /jf/test/testBlog/delete
 * /common/testBlog/add.html
 * 
 */
@Controller(controllerKey = "/jf/test/testBlog")
public class TestBlogController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TestBlogController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPage_select, TestBlog.sqlId_splitPage_from);
		render("/test/testBlog/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TestBlogValidator.class)
	public void save() {
		getModel(TestBlog.class).save();
		render("/test/testBlog/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		TestBlog testBlog = TestBlog.dao.findById(getPara());
		setAttr("testBlog", testBlog);
		render("/test/testBlog/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TestBlogValidator.class)
	public void update() {
		getModel(TestBlog.class).update();
		redirect("/jf/test/testBlog");
	}

	/**
	 * 查看
	 */
	public void view() {
		TestBlog testBlog = TestBlog.dao.findById(getPara());
		setAttr("testBlog", testBlog);
		render("/test/testBlog/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		TestBlogService.service.delete("test_blog", getPara() == null ? ids : getPara());
		redirect("/jf/test/testBlog");
	}
	
}


