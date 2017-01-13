
--说明：DB2、sqlServer、oracle 需要执行下面SQL

-- 导出
INSERT INTO PT_OPERATOR (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('235d855d7b914d728e434f0f309ab041', 0, null, '导出', null, null, null, '0', '/platform/sysLog/export', '8a40c0353fa828a6013fa898d4ac0029', '1', '0', '0', '1', null, null, '日志');
INSERT INTO PT_ROLEOPERATOR (ids, roleids, operatorids) VALUES ('aedaaa19e1da475d8f9a71c4217a80b9', '8a40c0353fa828a6013fa898d4ac0023', '235d855d7b914d728e434f0f309ab041');

--文件上传
INSERT INTO pt_module (ids, version, description, images, isparent, names, orderids, parentmoduleids, systemsids) VALUES ('8d7a260e02674bd3873656deb716202e', 0, null, '4.png', 'false', '上传文件', 4, '75f9bd430f4a4ec7b0a71928e15ea5f7', '8a40c0353fa828a6013fa898d4ac0020');

INSERT INTO pt_operator (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('8329f58a0eed44e195dec78bddc591b5', 0, null, '上传', null, null, null, '0', '/platform/upload', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', null, null, '上传文件');
INSERT INTO pt_operator (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('1d2b6919b80a4a21821adc3efcda77b2', 0, null, '列表', null, null, null, '0', '/platform/upload/list', '8d7a260e02674bd3873656deb716202e', '1', '0', '0', '1', null, null, '上传文件');
INSERT INTO pt_operator (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('5d6f2bb8faa948108081492179d0c0ad', 0, null, '删除', null, null, null, '0', '/platform/upload/delete', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', null, null, '上传文件');
INSERT INTO pt_operator (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('1329f58a0eed44e195dec78bddc591b6', 0, null, '单文件分片上传', null, null, null, '0', '/platform/upload/slice', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', null, null, '上传文件');
INSERT INTO pt_operator (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('2329f58a0eed44e195dec78bddc591b7', 0, null, '多文件分片上传', null, null, null, '0', '/platform/upload/slices', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', null, null, '上传文件');
INSERT INTO pt_operator (ids, version, description, names, onemany, returnparamkeys, returnurl, rowfilter, url, moduleids, splitpage, formtoken, ipblack, privilegess, ispv, pvtype, modulenames) VALUES ('3329f58a0eed44e195dec78bddc591b8', 0, null, '验证文件md5', null, null, null, '0', '/platform/upload/md5', '8d7a260e02674bd3873656deb716202e', '0', '0', '0', '1', null, null, '上传文件');

INSERT INTO pt_roleoperator (ids, roleids, operatorids) VALUES ('1a0b60e808e145989a031277b83efae6', '8a40c0353fa828a6013fa898d4ac0023', '8329f58a0eed44e195dec78bddc591b5');
INSERT INTO pt_roleoperator (ids, roleids, operatorids) VALUES ('bafd8455940a46d9af5b42fa6d01aeba', '8a40c0353fa828a6013fa898d4ac0023', '1d2b6919b80a4a21821adc3efcda77b2');
INSERT INTO pt_roleoperator (ids, roleids, operatorids) VALUES ('bee5de9aa4714491b9cda9b3430aefd0', '8a40c0353fa828a6013fa898d4ac0023', '5d6f2bb8faa948108081492179d0c0ad');
INSERT INTO pt_roleoperator (ids, roleids, operatorids) VALUES ('2a0b60e808e145989a031277b83efae7', '8a40c0353fa828a6013fa898d4ac0023', '1329f58a0eed44e195dec78bddc591b6');
INSERT INTO pt_roleoperator (ids, roleids, operatorids) VALUES ('2a0b60e808e145989a031277b83efae8', '8a40c0353fa828a6013fa898d4ac0023', '2329f58a0eed44e195dec78bddc591b7');
INSERT INTO pt_roleoperator (ids, roleids, operatorids) VALUES ('2a0b60e808e145989a031277b83efae9', '8a40c0353fa828a6013fa898d4ac0023', '3329f58a0eed44e195dec78bddc591b8');

--upload表 增加字段
alter table pt_upload add column md5 varchar(100);
