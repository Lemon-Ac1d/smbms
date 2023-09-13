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
  public List<Sale> getSaleList() {
    List<Sale> saleList = saleMapper.getSaleList();
    return saleList;
  }
}
