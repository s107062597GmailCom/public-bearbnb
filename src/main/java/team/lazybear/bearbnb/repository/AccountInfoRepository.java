package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.AccountInformation;

@Repository
public interface AccountInfoRepository extends JpaRepository<AccountInformation, Long> {

	@Query(value = "from AccountInformation where email = :email")
	AccountInformation findByEmail(String email);
	
	@Query(value = "from AccountInformation where phoneNumber = :phoneNumber")
	AccountInformation findByPhoneNumber(String phoneNumber);
}
