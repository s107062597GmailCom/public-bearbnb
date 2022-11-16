package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.AccountInformation;

public interface AccountInformationRepository extends JpaRepository<AccountInformation,Integer > {
	
}
