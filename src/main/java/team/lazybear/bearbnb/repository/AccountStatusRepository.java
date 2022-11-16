package team.lazybear.bearbnb.repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lazybear.bearbnb.model.AccountStatus;

public interface AccountStatusRepository extends JpaRepository<AccountStatus, Integer> {

	@Query(value = "from AccountStatus where id = :id")
	Optional<AccountStatus> findById(Integer id);
}
