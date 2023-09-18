package cn.smbms.dao.sale;

import cn.smbms.pojo.Provider;
import cn.smbms.pojo.Sale;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface SaleMapper {

    public List<Sale> getSaleList(@Param("name")String name,
                                      @Param("category")String category,
                                      @Param("king") String king,
                                  @Param("from") Integer currentPageNo,
                                  @Param("pageSize") Integer pageSize
    ) throws Exception;

    public int getSaleCount(@Param("name")String name,
                            @Param("category")String category,
                            @Param("king") String king
    )throws Exception;


    public int insert(Sale sale);

    public Sale getSaleById(@Param("id") String id );// 根据id获取单个用户信息

    public int update(Sale sale);//修改用户信息

    public int delete(@Param("id") String id);

}
