package team.lazybear.bearbnb.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import team.lazybear.bearbnb.service.OrderService;

@SpringBootApplication
@EnableScheduling
public class ScheduledOrderUpdate {

	@Autowired
	private OrderService orderService;

	public static void main(String[] args) {
		SpringApplication.run(ScheduledOrderUpdate.class, args);

	}

	@Scheduled(cron = "0 0 9 * * *")
	public void sayHello() {
		orderService.changeOrderStatusToVisitorHaveCheckedIn();
		orderService.changeOrderStatusToVisitorHaveCheckedOut();
		orderService.changeOrderStatusToOrderInvalid();
		System.out.println("每日更新系統：到期訂單 已經更新");
	}
}
