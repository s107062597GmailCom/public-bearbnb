package team.lazybear.bearbnb.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.model.AccountIdentity;
import team.lazybear.bearbnb.model.AccountStatus;
import team.lazybear.bearbnb.repository.AccountStatusRepository;

@Service
public class AccountStatusService {

    @Autowired
    private AccountStatusRepository accountStatusRepository;

    private List< AccountStatus > accountStatusList;

    public List< AccountStatus > findAll() {
        return accountStatusRepository.findAll();
    }

    public String findTitleById( Integer id ) {
        if ( accountStatusList == null )
            accountStatusList = findAll();

        for ( AccountStatus accountStatus : accountStatusList )
            if ( accountStatus.getId().equals(id) )
                return accountStatus.getTitle();
        return null;
    }

    public Integer findIdByTitle( String title ) {
        if ( accountStatusList == null )
            accountStatusList = findAll();

        for ( AccountStatus accountStatus : accountStatusList )
            if ( accountStatus.getTitle().equals(title) )
                return accountStatus.getId();
        return null;
    }
    
    public AccountStatus findById(Integer id) {
   	 	Optional<AccountStatus> opt = accountStatusRepository.findById(id);
   	 	if(opt.isPresent()) {
   	 		return opt.get();
   	 	}
   	 	return null;
    }
}
