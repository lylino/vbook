
$(function() {                                          // 滚动定位
    $("#nav-ul").onePageNav();
});

$(document).ready(function(){

    var activeColor = "#19b2e5";

    //搜索框点击变色，搜索图标变色,背景变色
    var searchInput = document.getElementsByClassName("search-input");
    var searchBar = document.getElementsByClassName("search-bar");
    var searchIcon = document.getElementsByClassName("search-icon");

    $(searchInput).focus(function(){
        $(searchBar).eq($(searchInput).index(this)).css({"border-color":activeColor,"box-shadow":"0 0 5px "+activeColor+"55","background-color":"#f5f5f560"});
        $(searchIcon).eq($(searchInput).index(this)).css("color",activeColor);
        console.log("focused")
    });
    $(searchInput).blur(function(){
        $(searchBar).eq($(searchInput).index(this)).css({"border-color":"inherit","box-shadow":"none"});
        $(searchIcon).eq($(searchInput).index(this)).css("color","inherit");
        console.log("blured")

    });

    // 回到顶部
    $(".backTop").hide();

    //展开登录
    // var userName = "";
    // var login_button = document.getElementById("header-icon");
    // var login_dropdown = document.getElementById("login-nav");
    //
    // $(login_button).click(function(){
    //     console.log("clicked")
    //     if(userName.length == 0){
    //         if($(login_dropdown).hasClass("show")){
    //             $(login_dropdown).removeClass("show");
    //             $(login_dropdown).hide();
    //             console.log("open")
    //         }else{
    //             $(login_dropdown).addClass("show");
    //             $(login_dropdown).show();
    //             console.log("close")
    //         }
    //     }else{
    //         window.location.href="profile.html";
    //     }
    //
    // });

    //展开分类
    var dropdown_button = document.getElementById("mobile-nav-button");
    var nav_dropdown = document.getElementById("navbar");

    $(dropdown_button).click(function(){
        console.log("clicked")
        if($(nav_dropdown).hasClass("nav-height")){
            $(nav_dropdown).removeClass("nav-height");
            $(dropdown_button).css("color","#19b2e5");
            console.log("open")
        }else{
            $(nav_dropdown).addClass("nav-height");
            $(dropdown_button).css("color","inherit");
            console.log("close")
        }
    });

    //竖分类定位
    $(window).scroll(function(){

        var sectionItems = document.getElementById("section-items");
        var offset = $(sectionItems).offset().top - $(document).scrollTop();
        var itemsNav = document.getElementById("items-nav");
        var itemsNavWidth = $(itemsNav).width();

        if(offset <= 70){
            $(itemsNav).css("width",itemsNavWidth);
            $(itemsNav).addClass("items-nav-fixed");
        }else{
                $(itemsNav).removeClass("items-nav-fixed");
        }

    })

    //竖分类点击展开右边商品栏
    var itemsWrapper = document.getElementsByClassName("items-wrapper");
    var itemsContent = document.getElementsByClassName("items-content");
    // var itemsGood = document.getElementsByClassName("items-content");
    var navLi = document.getElementsByClassName("nav-li");
    var itemLink = document.getElementsByClassName("items-link");
    var width = $(window).width();

        //右边商品栏高度
    var itemsWrapperHeight = $(itemsContent).eq(0).height();
    $(itemsWrapper).css("height",itemsWrapperHeight);

    srcMove(0);

    $(navLi).click(function(){
        $(itemsContent).css("transition","left 0.6s");
        var index = $(this).attr("data-category-link");
        $(itemLink).removeClass("active");
        $(navLi).removeClass("active");
        $(itemLink).eq(index).addClass("active");
        $(this).addClass("active");
        srcMove(index);
        var itemsWrapperHeight = $(itemsContent).eq(index).height();
        $(itemsWrapper).css("height",itemsWrapperHeight);
    });

    $(itemLink).click(function(){
        $(itemsContent).css("transition","left 0.6s");
        var index = $(this).attr("data-category-link");
        $(itemLink).removeClass("active");
        $(this).addClass("active");
        srcMove(index);
        var itemsWrapperHeight = $(itemsContent).eq(index).height();
        $(itemsWrapper).css("height",itemsWrapperHeight);
    });

    function srcMove(n){
        $(itemsContent).each(function(){
            var index = $(this).attr("data-category-tab");
            var left = width * (index - n) + 7;
            $(this).css("left",left);
            // $(this).animate({"left":left},1);
        });
    }


    //点击表单
    var input = document.getElementsByClassName("form-input");
    var placeholder = document.getElementsByClassName("placeholder");
    $(input).click(function(e){
        $(input).each(function(){
            var t = $(this).val();
            if("" === t || "" === t.replace(/^\s+|\s+$/g, "") ){
                $(placeholder).eq($(input).index(this)).css({"bottom":"10px","font-size":"87.5%"});
            }
        });
        $(placeholder).eq($(input).index(this)).css({"bottom":"2rem","font-size":"70%"});

        $(document).one("click",function(){
            $(input).each(function(){
                var t = $(this).val();
                if("" === t || "" === t.replace(/^\s+|\s+$/g, "") ){
                    $(placeholder).eq($(input).index(this)).css({"bottom":"10px","font-size":"87.5%"});
                }
            });
        });

        e.stopPropagation();
    });




})