<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>销售信息页面 >> 商品添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="saleForm" name="saleForm" method="post" action="${pageContext.request.contextPath }/sys/sale/modifysave.html">
            <!--div的class 为error是验证错误，ok是验证成功-->
            <input type="hidden" name="id" value="${sale.id }"/>
            <div>
                <label for="name">商品名称：</label>
                <input type="text" name="name" id="name" value="${sale.name}">
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>

            <div>
                <label for="category">商品类别：</label>
                <select name="category" id="category">
                    <option value="">--请选择--</option>
                    <option value="水果" ${sale.category == '水果' ? 'selected' : ''}>水果</option>
                    <option value="乳制品" ${sale.category == '乳制品' ? 'selected' : ''}>乳制品</option>
                    <option value="糕点" ${sale.category == '糕点' ? 'selected' : ''}>糕点</option>
                    <option value="肉类" ${sale.category == '肉类' ? 'selected' : ''}>肉类</option>
                    <option value="海鲜" ${sale.category == '海鲜' ? 'selected' : ''}>海鲜</option>
                    <option value="谷物" ${sale.category == '谷物' ? 'selected' : ''}>谷物</option>
                    <option value="调料" ${sale.category == '调料' ? 'selected' : ''}>调料</option>
                    <option value="饮料" ${sale.category == '饮料' ? 'selected' : ''}>饮料</option>
                    <option value="蔬菜" ${sale.category == '蔬菜' ? 'selected' : ''}>蔬菜</option>
                    <option value="豆制品" ${sale.category == '豆制品' ? 'selected' : ''}>豆制品</option>
                    <option value="零食" ${sale.category == '零食' ? 'selected' : ''}>零食</option>
                    <option value="个护" ${sale.category == '个护' ? 'selected' : ''}>个护</option>
                    <option value="家居" ${sale.category == '家居' ? 'selected' : ''}>家居</option>
                </select>
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>

            <div>
                <label for="price">单价：</label>
                <input type="text" name="price" id="price" value="${sale.price}">
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>

            <div>
                <label for="king">是否特价：</label>
                <select name="king" id="king">
                    <option value="否" ${sale.king == '否' ? 'selected' : ''}>否</option>
                    <option value="是" ${sale.king == '是' ? 'selected' : ''}>是</option>
                </select>
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>


            <div class="providerAddBtn">
                <input type="submit" name="add" id="add" value="保存">
                <input type="button" id="back" name="back" value="返回">
            </div>
            <script type="text/javascript">
                document.getElementById("back").addEventListener("click", function() {
                    history.back();
                });
            </script>
        </form>
    </div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/saleadd.js"></script>
