// 等待页面加载完成
document.addEventListener('DOMContentLoaded', function() {
    // 获取表单元素
    var saleForm = document.getElementById('saleForm');

    // 表单提交事件处理函数
    saleForm.addEventListener('submit', function(event) {
        // 阻止表单默认的提交行为
        event.preventDefault();

        // 执行表单验证
        if (validateForm()) {
            // 验证通过，提交表单
            saleForm.submit();
        }
    });

    // 返回按钮点击事件处理函数
    var backButton = document.getElementById('back');
    backButton.addEventListener('click', function() {
        // 执行返回操作，这里可以根据实际需求进行实现
        // 比如跳转到指定的页面或执行其他操作
        console.log('返回按钮被点击');
    });

    // 表单验证函数
    function validateForm() {
        // 获取表单字段元素
        var nameField = document.getElementById('name');
        var categoryField = document.getElementById('category');
        var priceField = document.getElementById('price');

        // 获取字段值
        var nameValue = nameField.value.trim();
        var categoryValue = categoryField.value.trim();
        var priceValue = priceField.value.trim();

        // 执行验证逻辑
        if (nameValue === '') {
            // 商品名称为空，显示错误提示信息
            displayErrorMessage(nameField, '请输入商品名称');
            return false;
        }

        if (categoryValue === '') {
            // 商品类别未选择，显示错误提示信息
            displayErrorMessage(categoryField, '请选择商品类别');
            return false;
        }

        if (priceValue === '') {
            // 单价为空，显示错误提示信息
            displayErrorMessage(priceField, '请输入单价');
            return false;
        }

        // 所有字段验证通过
        return true;
    }

    // 显示错误提示信息
    function displayErrorMessage(field, message) {
        // 获取错误提示元素
        var errorElement = field.nextElementSibling;

        // 设置错误提示信息
        errorElement.textContent = message;
    }
});