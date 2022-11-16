package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import team.lazybear.bearbnb.model.Account;

public interface AccountReposity extends JpaRepository<Account, Long> {
	
	// 一開頭就讓人刪帳號...但是也可以改權限為"已刪除"並保留帳號，使用者可保有反悔權力
	@Transactional
	@Modifying
	@Query(value="delete from Account where id= :id", nativeQuery=true)
	void deleteAccountById(Long id);
	
	// 用帳號來找Account
	// 宜陽：請在搜尋"username"的時候不區分大小寫，"password"時嚴格區分大小寫
	/* 用加裝的H2搜尋引擎中的IgnoreCase指令可以達成無視大小寫搜尋的效果
	 * 等到整筆資料從資料庫拖到JAVA之後，所有比對都是預設嚴格大小寫的。
	 * 解法二：應該還有靠SQL或HQL可以解決的方式
	*/
	@Query(value = "from Account where username = :username")
	Account findByUsernameIgnoreCase(String username);
	
	/*解法二前來挑戰O皿O*/
	@Query(value = "from Account where lower(username) like lower(:username)")
	Account findByUsername(String username);
	

	

}
