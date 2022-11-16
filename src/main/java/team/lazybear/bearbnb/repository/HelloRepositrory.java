package team.lazybear.bearbnb.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import team.lazybear.bearbnb.model.Hello;

public interface HelloRepositrory extends JpaRepository< Hello, Long > {}
