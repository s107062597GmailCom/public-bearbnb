package team.lazybear.bearbnb.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import team.lazybear.bearbnb.service.OrderService;

@Component
public class WebAppInitiatingListener implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private OrderService orderService;
	
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		orderService.changeOrderStatusToVisitorHaveCheckedIn();
		orderService.changeOrderStatusToVisitorHaveCheckedOut();
		orderService.changeOrderStatusToOrderInvalid();
		System.out.println("Web啟動更新:到期訂單 已經更新");
	}

}
