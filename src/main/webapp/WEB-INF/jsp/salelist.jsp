<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.smbms.pojo.Sale" %>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>销售信息页面</span>
    </div>
    <div class="search">
    <table class="saleTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">ID</th>
            <th width="30%">商品名称</th>
            <th width="20%">商品类别</th>
            <th width="20%">单价</th>
        </tr>
        <c:forEach var="sale" items="${saleList}" varStatus="status">
            <tr>
                <td>
                    <span>${sale.id}</span>
                </td>
                <td>
                    <span>${sale.name}</span>
                </td>
                <td>
                    <span>${sale.category}</span>
                </td>
                <td>
                    <span>${sale.price}</span>
                </td>

            </tr>
        </c:forEach>
    </table>

    </div>

</div>
<%@ include file="/WEB-INF/jsp/common/foot.jsp" %>