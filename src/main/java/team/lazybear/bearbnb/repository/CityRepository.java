package team.lazybear.bearbnb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import team.lazybear.bearbnb.model.City;
import team.lazybear.bearbnb.projection.NumberProjection;

public interface CityRepository extends JpaRepository< City, Integer > {

    @Query(value = "SELECT TOP 1 c.id AS number "
            + "FROM city AS c ORDER BY id DESC", nativeQuery = true)
    public NumberProjection findLargestId();

}
