<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>销售信息页面 >> 商品添加页面</span>
    </div>
    <div class="providerAdd">
        <form id="saleForm" name="saleForm" method="post" action="${pageContext.request.contextPath }/sys/sale/addsave.html">
            <!--div的class 为error是验证错误，ok是验证成功-->
            <div>
                <label for="name">商品名称：</label>
                <input type="text" name="name" id="name" value="">
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>

            <div>
                <label for="category">商品类别：</label>
                <select name="category" id="category">
                    <option value="">--请选择--</option>
                    <option value="水果">水果</option>
                    <option value="乳制品">乳制品</option>
                    <option value="糕点">糕点</option>
                    <option value="肉类">肉类</option>
                    <option value="海鲜">海鲜</option>
                    <option value="谷物">谷物</option>
                    <option value="调料">调料</option>
                    <option value="饮料">饮料</option>
                    <option value="蔬菜">蔬菜</option>
                    <option value="豆制品">豆制品</option>
                    <option value="零食">零食</option>
                    <option value="个护">个护</option>
                    <option value="家居">家居</option>
                </select>
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>

            <div>
                <label for="price">单价：</label>
                <input type="text" name="price" id="price" value="">
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>

            <div>
                <label for="king">是否特价：</label>
                <select name="king" id="king">
                    <option value="否" selected>否</option>
                    <option value="是">是</option>
                </select>
                <!-- 放置提示信息 -->
                <font color="red"></font>
            </div>


            <div class="providerAddBtn">
                <input type="submit" name="add" id="add" value="保存">
                <input type="button" id="back" name="back" value="返回">
            </div>
        </form>
    </div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/saleadd.js"></script>
