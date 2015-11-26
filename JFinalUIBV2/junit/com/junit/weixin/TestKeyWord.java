package com.junit.weixin;

import org.junit.Test;

import com.junit.TestBase;
import com.weixin.mvc.keyword.Keyword;

public class TestKeyWord extends TestBase {
	
	@Test
    public void deleteSysLog() {
		System.out.println("==============");
		
		for (int i = 0; i < 10000; i++) {
			Keyword kw = new Keyword();
			kw.setQuestion("你喜欢的歌手是谁？你早餐喜欢吃什么？");
			kw.setQuestionkey("歌手，早餐");
			kw.setAnswer("刘德华张学友郭富城黎明");
			kw.save();
		}
		
		System.out.println("==============");
    }

}
