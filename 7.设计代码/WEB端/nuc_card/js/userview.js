var backBtn = null;

$(function(){
    backBtn = $("#back");
    console.log("referer = " + referer);
    backBtn.on('click', function() {
       if (referer != undefined && null != referer && referer != "" && referer != "null" && referer.length > 4) {
            window.location.href = referer;  // 跳转
        } else {
           history.back(-1); // 退后一步
       }
    });
})
