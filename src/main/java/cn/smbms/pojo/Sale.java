package cn.smbms.pojo;

import java.math.BigDecimal;

public class Sale {
    private Integer id;   //id
    private String name; //商品名称
    private String category;
    private BigDecimal price; //单价

    private  String king;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getKing() {
        return king;
    }

    public void setKing(String king) {
        this.king = king;
    }
}
