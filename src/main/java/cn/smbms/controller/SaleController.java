package cn.smbms.controller;

import cn.smbms.pojo.Provider;
import cn.smbms.pojo.Sale;
import cn.smbms.service.provider.ProviderService;
import cn.smbms.tools.Constants;
import cn.smbms.tools.PageSupport;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;
import cn.smbms.service.sale.SaleService;

import javax.annotation.Resource;

@Controller
@RequestMapping("/sys/sale")
public class SaleController extends BaseController{
    @Autowired
    private SaleService saleService;

    @RequestMapping(value="/list.html")
    public String saleList(Model model,
                @RequestParam(value="querySaleCode",required=false) String querySaleCode,
                @RequestParam(value="querySaleName",required=false) String querySaleName,
                @RequestParam(value="pageIndex",required=false) String pageIndex){
//        List<Sale> saleList = saleService.getSaleList();
//        model.addAttribute("saleList",saleList);
        List<Provider> providerList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;

        if(querySaleCode == null){
            querySaleCode = "";
        }
        if(querySaleName == null){
            querySaleName = "";
        }
        if(pageIndex != null){
            try{
                currentPageNo = Integer.valueOf(pageIndex);
            }catch(NumberFormatException e){
                return "redirect:/sys/provider/syserror.html";
            }
        }

        //总数量（表）
        int totalCount = 0;
        try {
            totalCount = saleService.getproviderCount(queryProCode,queryProName);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }



        return "salelist";
    }


}
