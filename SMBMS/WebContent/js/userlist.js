var userobj = null;

// 添加多个函数, 每个函数实现特定的功能
function cancelBtn() {                  // 点击取消按钮, 遮罩层消失
    $(".zhezhao").css('display', 'none');
    $("#removeUse").fadeOut();
}

function openYesOrNoDLG() {             // 点击删除按钮,遮罩层出现
    $(".zhezhao").css('display', 'block');
    $("#removeUse").fadeIn();
}

function changeDLGContent(contentStr) {
    var p = $(".removeMain").find("p");
    p.html(contentStr);
}

function deleteUser(obj) {              // 删除用户
    $.ajax({
        type: "get",
        url: path + "/jsp/user.do",
        data: {
            method : "delUser",
            id : userobj.attr("userid")
        },
        dataType: 'json',
        success: function(data) {
            if (data.code == 1) {   // 删除成功, 移除对应的行
                cancelBtn()
                obj.parents("tr").remove();
            } else  {
                changeDLGContent("对不起, 用户" + obj.attr("username") + data.msg);
            }
        }
    });
}


// 给每个按钮绑定事件
$(function() {
    // 1.绑定查看详情按钮
    $(".viewUser").on("click", function() {
        var obj = $(this);  // 将被绑定的元素a, 转换策划给你jquery对象, 可以使用jquery方法
        window.location.href = path + "/jsp/user.do?method=view&id=" + obj.attr("userid");
    });

    // 2.绑定删除按钮
    $(".deleteUser").on("click", function() {
       // 删除出弹框, 是否确定要删除
        userobj = $(this);
        changeDLGContent("你确定要删除用户[" + userobj.attr("username") + "]吗?");
        openYesOrNoDLG();                   //打开遮罩层和弹出框
    });

    // 3.绑定编辑按钮
    $(".modifyUser").on("click", function() {
        console.log("modifyUser");
        var obj = $(this);
        window.location.href = path + "/jsp/user.do?method=modify&id=" + obj.attr("userid");
    });

    // 4.绑定no  - 取消删除
    $("#no").on("click", function() {
        cancelBtn();
    });

    // 5.绑定yes - 删除
    $("#yes").on("click", function() {
        deleteUser(userobj);
    });
});