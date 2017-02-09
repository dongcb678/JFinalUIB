
#namespace("platform.user")

	#sql("findByUserName")
		select * from pt_user where username = ?
	#end
	
#end