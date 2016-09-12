package com.platform.mvc.roleoperator;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.constant.ConstantInit;
import com.platform.dto.SplitPage;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.role.Role;

@Service(name = RoleOperatorService.serviceName)
public class RoleOperatorService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleOperatorService.class);
	
	public static final String serviceName = "roleOperatorService";
	
	/**
	 * 获取角色拥有的功能
	 * @param roleIds
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public void paging(SplitPage splitPage){
		paging(ConstantInit.db_dataSource_main, splitPage, RoleOperator.sqlId_splitPageSelect, RoleOperator.sqlId_splitPageFrom);
		
		String roleIds = (String) splitPage.getQueryParam().get("roleIds");
		
		Role role = Role.dao.findById(roleIds);
		splitPage.setExtData(role);
		
		String sql = getSql("platform.roleOperator.findByModuleAndRoleIds");
		
		List<Record> smList = (List<Record>) splitPage.getList();
		for (Record sm : smList) {
			String mids = sm.getStr("mids");
			List<Record> olist = Db.find(sql, roleIds, mids);
			if(olist != null && olist.size() != 0){
				sm.set("list", olist);
			}else{
				smList.remove(sm);
			}
		}
	}

	/**
	 * 设置角色拥有的功能
	 * @param roleIds
	 * @param operatorIds
	 * @return
	 */
	public String add(String roleIds, String operatorIds){
		RoleOperator ro = new RoleOperator();
		ro.setRoleids(roleIds);
		ro.setOperatorids(operatorIds);
		ro.save();
		return ro.getPKValue();
	}
	
}
