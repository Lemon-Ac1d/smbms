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
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/sys/sale")
public class SaleController extends BaseController{
    @Autowired
    private SaleService saleService;

    //xf TODO: 由谁创建的
    //xf TODO: 显示库存数量


    @RequestMapping(value="/list.html")
    public String saleList(Model model,
                @RequestParam(value="queryName",required=false) String queryName,
                @RequestParam(value="queryCategory",required=false) String queryCategory,
                @RequestParam(value="queryKing",required=false) String queryKing,
                @RequestParam(value="pageIndex",required=false) String pageIndex) throws Exception {

        System.out.println("queryName  " +  queryName);
        System.out.println("queryCategory  " +  queryCategory);
        System.out.println("queryKing  " +  queryKing);
        int currentPageNo = 1; // 当前页

        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex != null){
            try{
                currentPageNo = Integer.valueOf(pageIndex);
            }catch(NumberFormatException e){
                return "redirect:/syserror.html";
            }
        }

        if(queryName==null)
        {
            queryName ="";
        }
        if(queryCategory==null)
        {
            queryCategory ="";
        }

        if(queryKing==null)
        {
            queryKing ="";
        }
        //总数量
        int totalCount = 0;
        try {
            totalCount = saleService.getSaleCount(queryName,queryCategory,queryKing);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //总页数
        PageSupport pages=new PageSupport();
        pages.setCurrentPageNo(currentPageNo);
        pages.setPageSize(pageSize);
        pages.setTotalCount(totalCount);
        int totalPageCount = pages.getTotalPageCount();//总页数


        List<Sale> saleList = saleService.getSaleList(queryName,queryCategory,queryKing,currentPageNo,pageSize);
        model.addAttribute("saleList",saleList);
        //设置回显
        model.addAttribute("queryName",queryName);
        model.addAttribute("queryCategory",queryCategory);
        model.addAttribute("queryKing",queryKing);


        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPageNo", currentPageNo);

        return "salelist";
    }



    @RequestMapping(value="/add.html")
    public String toAdd(Model model) throws Exception {
        return "saleadd";
    }

    @RequestMapping(value="/addsave.html")
    public String add(Sale sale, HttpSession session){

        System.out.println("Sale---->" + sale);
        System.out.println(sale.getName());
        System.out.println(sale.getCategory());
        System.out.println(sale.getPrice());
        System.out.println(sale.getKing());

        try {
            if(saleService.add(sale)){
                return "redirect:/sys/sale/list.html";
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "redirect:/sys/sale/list.html";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(String id, Model model){
        System.out.println("id   " + id);
        Sale sale = saleService.getSaleById(id);
        model.addAttribute("sale",sale);
        return "salemodify";
    }

    @RequestMapping("/modifysave.html")
    public String update(Sale sale){
        boolean result = saleService.update(sale);
        if(result){
            return "redirect:/sys/sale/list.html";
        }
        return "redirect:/sys/sale/toUpdate.html?id="+sale.getId();
    }

    @RequestMapping("/delete")
    public String delete(String id){
        saleService.delete(id);
        return "redirect:/sys/sale/list.html";
    }

}
