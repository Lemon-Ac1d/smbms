package cn.smbms.service.sale;

import cn.smbms.dao.bill.BillMapper;
import cn.smbms.dao.provider.ProviderMapper;
import cn.smbms.dao.sale.SaleMapper;
import cn.smbms.pojo.Sale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SaleServiceImpl implements SaleService{


  @Autowired
  private SaleMapper saleMapper;



  @Override
  public List<Sale> getSaleList(String name, String category,String king,Integer currentPageNo, Integer pageSize) throws Exception {
    currentPageNo = (currentPageNo-1)*pageSize;
    List<Sale> saleList = saleMapper.getSaleList(name, category,king, currentPageNo,pageSize);
    return saleList;
  }

  @Override
  public int getSaleCount(String name, String category, String king) throws Exception {
    return saleMapper.getSaleCount(name, category, king);
  }

  @Override
  public boolean add(Sale sale) throws Exception {
    boolean flag = false;
    if(saleMapper.insert(sale) > 0){
      flag = true;
    }
    return flag;
  }

  @Override
  public Sale getSaleById(String id) {
    return saleMapper.getSaleById(id);
  }

  @Override
  public boolean update(Sale sale) {
    int result = saleMapper.update(sale);
    if(result > 0){
      return true;
    }
    return false;
  }

  @Override
  public boolean delete(String id) {
    int result = saleMapper.delete(id);
    if(result>0){
      return true;
    }
    return false;
  }
}
