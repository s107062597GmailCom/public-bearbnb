package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import team.lazybear.bearbnb.model.AccountPhoto;

@Repository
public interface AccountPhotoRepository extends JpaRepository<AccountPhoto, Long> {

}
