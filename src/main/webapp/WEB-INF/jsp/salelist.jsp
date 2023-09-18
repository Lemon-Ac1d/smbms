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
        <form method="post" action="${pageContext.request.contextPath }/sys/sale/list.html">
            <span>商品名称：</span>
            <input name="queryName" type="text" value="${queryName}">

            <span>商品类型：</span>
            <select name="queryCategory" onchange="updateQueryFields(this.value)">
                <option value="">--全部--</option>
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

            <script>
                var queryCategory = "${queryCategory}";

                function updateQueryFields(selectedCategory) {
                    var queryNameInput = document.getElementsByName("queryName")[0];
                    var queryCategoryInput = document.getElementsByName("queryCategory")[0];

                    if (selectedCategory === "") {
                        queryCategoryInput.value = "";
                    } else {
                        queryCategoryInput.value = selectedCategory;
                        queryNameInput.value = "";
                    }

                    console.log("选中的商品类型：" + selectedCategory);
                }

                // 判断是否有填充的queryCategory值
                if (queryCategory !== "") {
                    var queryCategoryInput = document.getElementsByName("queryCategory")[0];
                    queryCategoryInput.value = queryCategory;
                }
            </script>


            <span>是否特价：</span>
            <select name="querySelection" onchange="updateQueryKing(this)">
                <option value="">--请选择--</option>
                <option value="是">是</option>
                <option value="否">否</option>
            </select>

            <script>
                var queryKing = "${queryKing}";

                function updateQueryKing(selectElement) {
                    var queryKingElement = document.getElementById("queryKing");
                    if (selectElement.value === "") {
                        queryKingElement.value = "";
                    } else {
                        queryKingElement.value = selectElement.value;
                    }
                }

                // 判断是否有填充的queryKing值
                if (queryKing !== "") {
                    var querySelectionInput = document.getElementsByName("querySelection")[0];
                    querySelectionInput.value = queryKing;
                }
            </script>

            <!-- 隐藏的表单域用于存储 queryKing 的值 -->
            <input type="hidden" name="queryKing" id="queryKing" value="">


            <input type="hidden" name="pageIndex" value="1"/>
            <input value="查 询" type="submit" id="searchbutton">


            <a href="${pageContext.request.contextPath }/sys/sale/add.html">添加商品</a>
        </form>
    </div>


    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">ID</th>
            <th width="15%">商品名称</th>
            <th width="15%">商品类别</th>
            <th width="15%">单价</th>
            <th width="20%">是否特价</th>
            <th width="25%">操作</th>
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
                <td>
                    <span>${sale.king}</span>
                </td>
                <td>

                    <span>
                      <a class="modifyProvider" href="/smbms/sys/sale/toUpdate?id=${sale.id}">
                        <img src="${pageContext.request.contextPath}/statics/images/xiugai.png" alt="修改" title="修改"/>
                      </a>
                    </span>
                    <span>
                          <a class="deleteProvider" href="/smbms/sys/sale/delete?id=${sale.id}">
                            <img src="${pageContext.request.contextPath}/statics/images/schu.png" alt="删除" title="删除"/>
                          </a>
                    </span>
                </td>
            </tr>
        </c:forEach>
    </table>

    <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
    <c:import url="rollpage.jsp">
        <c:param name="totalCount" value="${totalCount}"/>
        <c:param name="currentPageNo" value="${currentPageNo}"/>
        <c:param name="totalPageCount" value="${totalPageCount}"/>
    </c:import>

</div>
</section>
<%@ include file="/WEB-INF/jsp/common/foot.jsp" %>