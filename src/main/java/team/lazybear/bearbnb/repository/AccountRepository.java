package team.lazybear.bearbnb.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



import team.lazybear.bearbnb.model.Account;

	public interface AccountRepository extends JpaRepository<Account, Long> {
		public Account findFirstByOrderByIdDesc();
		@Query(value = "from Account where username = :name")
		Account findByUserame(String name);
		@Query(value = "select * from \"ACCOUNT\" a \r\n"
				+ "  join \"ACCOUNT_STATUS\" s on \"FK_ACCOUNT_STATUS_ID\"= \"s\".\"ID\"\r\n"
				+ "  where concat(\"a\".\"username\",\"a\".\"uuid\",\"a\".\"id\",\"s\".\"TITLE\")"
				+ " like :likeName",nativeQuery = true)
		List<Account> likeSearch(String likeName);
//		@Query(value = "from Account where username like :likeName")
//		List<Account> likeSearch(String likeName);

}
