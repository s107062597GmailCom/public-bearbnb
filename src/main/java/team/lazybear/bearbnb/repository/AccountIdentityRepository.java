package team.lazybear.bearbnb.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lazybear.bearbnb.model.AccountIdentity;

public interface AccountIdentityRepository extends JpaRepository< AccountIdentity, Integer > {

	@Query(value="from AccountIdentity where id = :id ")
	Optional<AccountIdentity> findById(Integer id);
}
