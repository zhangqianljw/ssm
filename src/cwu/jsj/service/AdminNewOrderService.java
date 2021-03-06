package cwu.jsj.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cwu.jsj.dao.AdminMapper;
import cwu.jsj.model.Order;
@Service
public class AdminNewOrderService {
	@Resource
	private AdminMapper adminMapper;
	
	public List<Order> getUrgencyNewOrder(){
		List<Order> orderList = adminMapper.getUrgencyNewOrder();
		return orderList;
	}
	
	public List<Order> getGeneralNewOrder(){
		List<Order> orderList = adminMapper.getGeneralNewOrder();
		return orderList;
	}
	
	public List<Order> getNewOrder(){
		List<Order> orderList = adminMapper.getNewOrder();
		return orderList;
	}
	
	public int updateStatus(int orderId,int orderStatus){
		Order order  = new Order();
		order.setId(orderId);
		order.setOrderStatus(orderStatus);
		int result = adminMapper.updateOrderStatus(order);
		return result;
	}
}
