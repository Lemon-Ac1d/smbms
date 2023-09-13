package cn.smbms.dao.sale;

import cn.smbms.pojo.Sale;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface SaleMapper {
    public List<Sale> getSaleList();

}
