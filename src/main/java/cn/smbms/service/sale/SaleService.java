package cn.smbms.service.sale;

import cn.smbms.pojo.Provider;
import cn.smbms.pojo.Sale;

import java.util.List;

public interface SaleService {


    List<Sale> getSaleList(String name, String category, String king,Integer currentPageNo, Integer pageSize) throws Exception;

    public int getSaleCount(String name, String category, String king) throws Exception;

    public boolean add(Sale sale) throws Exception;

    public Sale getSaleById (String id);

    public boolean update (Sale sale);

    public boolean delete(String id);

}

