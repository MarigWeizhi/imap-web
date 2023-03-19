<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="/static/images/windows-icon@2x.ico"/>

    <title>数据智能监控平台</title>

    <!-- 轮播swiper插件样式 -->
    <link rel="stylesheet" href="/static/js/swiper/swiper.min.css"/>
    <!-- 翻牌器 -->
    <link rel="stylesheet" href="/static/js/cubeflop/cubeflop.css"/>

    <!-- 补间动画包 -->
    <link rel="stylesheet" href="/static/css/custom-animation.css"/>

    <!-- 重置样式 -->
    <link rel="stylesheet" href="/static/css/reset.css"/>

    <!-- 当前页面样式文件 -->
    <link rel="stylesheet" href="/static/css/site.css"/>

    <!-- jquery -->
    <script src="/static/js/jquery.min.js"></script>
    <!-- echarts -->
    <script src="/static/js/echarts/echarts.min.js"></script>
    <!-- echarts 水球图 -->
    <script src="/static/js/echarts/echarts-liquidfill.min.js"></script>
    <!-- echarts 词云 -->
    <script src="/static/js/echarts/echarts-wordcloud.min.js"></script>
    <!-- javascript工具库 -->
    <script src="/static/js/lodash.min.js"></script>
    <!-- 二维码插件 -->
    <script src="/static/js/qrcode.min.js"></script>
    <!-- 轮播插件 -->
    <script src="/static/js/swiper/swiper.min.js"></script>
    <!-- 表格滚动插件 -->
    <script src="/static/js/seamscroll.min.js"></script>
    <!-- day 日期插件 -->
    <script src="/static/js/dayjs/dayjs.min.js"></script>
    <script src="/static/js/dayjs/zh-cn.js"></script>
    <!-- 工具类 -->
    <script src="/static/js/utils.js"></script>
    <!-- 滚动数字所需要的插件 -->
    <script src="/static/js/jquery.countTo.js"></script>
    <!-- 翻牌器 -->
    <script src="/static/js/cubeflop/cubeflop.js"></script>
    <!-- d3 -->
    <script src="/static/js/d3.js"></script>

    <!-- 感谢使用微兔可视化，目前处于内测阶段，存在很多的不足开发人员在不断完善中，请谅解~ -->
</head>

<body>
<div class="container">
    <!-- 分组636e2c90-74ff-11ec-9a45-85cd06378d51开始-->
    <div id="item636e2c90-74ff-11ec-9a45-85cd06378d51">
        <!-- 组件cbfec770-74fe-11ec-9a45-85cd06378d51开始-->

        <div id="itemcbfec770-74fe-11ec-9a45-85cd06378d51"></div>

        <script type="text/javascript">
            $(function () {
                const dom = document.querySelector("#itemcbfec770-74fe-11ec-9a45-85cd06378d51");
                const loadTime = () => {
                    dom.innerHTML = dayjs().locale("zh-cn").format('YYYY年MM月DD日 HH:mm:ss');
                }
                loadTime()

                setInterval(loadTime, 1000)
            })
        </script>
        <style>
            #itemcbfec770-74fe-11ec-9a45-85cd06378d51 {
                font-size: 24px;
                color: rgba(101, 119, 128, 1);

                line-height: 60px;
                text-align: right;
                font-weight: bold;
                letter-spacing: 2px;
            }
        </style>
        <!-- 组件cbfec770-74fe-11ec-9a45-85cd06378d51结束-->

        <!-- 组件a6bffd76-26a4-4f7a-80b8-e496cf6f9845开始-->

        <div id="itema6bffd76-26a4-4f7a-80b8-e496cf6f9845">
            <p></p>
        </div>

        <script type="text/javascript">
            $(function () {

                let option = {
                    "textColor": "rgba(27, 99, 222, 1)",
                    "color": ["#ffffff"],
                    "fontSize": 40,
                    "lineHeight": 1.5,
                    "textIndent": 0,
                    "fontWeight": "bold",
                    "fontStyle": "normal",
                    "textAlign": "center",
                    "justifyContent": "center",
                    "alignItems": "center",
                    "textShadow": {"show": true, "x": 0, "y": 0, "value": 14, "color": "rgba(15, 146, 255,1)"}
                };
                const init = () => {
                    $.ajax(
                        {
                            url: '${pageContext.request.contextPath}/api/site/name/${siteId}?',
                            type: 'GET',
                            data: {},
                            headers: {"token": null},
                            dataType: "json",
                            xhrFields: {withCredentials: false},
                            success: function (data) {


                                if (/\&nbsp\;/.test(data[0].data) || /\<br/.test(data[0].data)) {
                                    $("#itema6bffd76-26a4-4f7a-80b8-e496cf6f9845 p").addClass('rich-text')
                                    $("#itema6bffd76-26a4-4f7a-80b8-e496cf6f9845 p").html(data[0].data)
                                } else {
                                    $("#itema6bffd76-26a4-4f7a-80b8-e496cf6f9845 p").addClass('text')
                                    $("#itema6bffd76-26a4-4f7a-80b8-e496cf6f9845 p").html(data[0].data)
                                }

                            }
                        }
                    );
                }
                init()

            })
        </script>

        <style>
            #itema6bffd76-26a4-4f7a-80b8-e496cf6f9845 {
                line-height: 1.5;
                font-size: 40px;
                text-align: center;
                font-weight: bold;
                font-style: normal;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                align-items: center;
                color: rgba(27, 99, 222, 1);

                text-shadow: 0px 0px 14px rgba(15, 146, 255, 1);

            }

            #itema6bffd76-26a4-4f7a-80b8-e496cf6f9845 .rich-text {
                white-space: nowrap;
                overflow: visible;
                line-height: 1.2;
                letter-spacing: -1px;
                margin-top: -2px;
            }
        </style>
        <!-- 组件a6bffd76-26a4-4f7a-80b8-e496cf6f9845结束-->

        <!-- 组件53f09140-74ff-11ec-9a45-85cd06378d51开始-->

        <div id="item53f09140-74ff-11ec-9a45-85cd06378d51">
            <h1>数据智能监控平台</h1>
        </div>

        <style>
            #item53f09140-74ff-11ec-9a45-85cd06378d51 {
                color: #ffffff;
                display: flex;
                text-align: center;
                line-height: 1;
                font-style: normal;
                justify-content: center;
                align-items: center;

            }
        </style>

        <!-- 组件53f09140-74ff-11ec-9a45-85cd06378d51结束-->

        <!-- 组件67dfb2a7-05b3-4c1a-863c-72e8c9af8184开始-->

        <div id="item67dfb2a7-05b3-4c1a-863c-72e8c9af8184">
            <a href="/online">
                <img
                        src="/static/images/d0f4f5f2-6696-4281-b8b4-3f9cd1aa77cc.png"
                        alt=""
                />
            </a>
        </div>
        <style>
            #item67dfb2a7-05b3-4c1a-863c-72e8c9af8184 {
                width: 60px;
                height: 60px;
            }

            #item67dfb2a7-05b3-4c1a-863c-72e8c9af8184 img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件67dfb2a7-05b3-4c1a-863c-72e8c9af8184结束-->

        <!-- 组件fdb138dc-a109-458c-bc48-f73d5cbc9745开始-->

        <div id="itemfdb138dc-a109-458c-bc48-f73d5cbc9745">
            <img
                    src="/static/images/5dfde77d-81cf-4dd8-97d5-b74cc891c395.png"
                    alt=""
            />
        </div>
        <style>
            #itemfdb138dc-a109-458c-bc48-f73d5cbc9745 {
                width: 1920px;
                height: 100px;
            }

            #itemfdb138dc-a109-458c-bc48-f73d5cbc9745 img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件fdb138dc-a109-458c-bc48-f73d5cbc9745结束-->
    </div>
    <!-- 分组636e2c90-74ff-11ec-9a45-85cd06378d51结束-->

    <!-- 分组8b26fd80-7440-11ec-b9a4-a304abb9328e开始-->
    <div id="item8b26fd80-7440-11ec-b9a4-a304abb9328e">
        <!-- 分组ea836a60-7441-11ec-b9a4-a304abb9328e开始-->
        <div id="itemea836a60-7441-11ec-b9a4-a304abb9328e">
            <!-- 组件943b5410-90b1-11ec-aeed-1533f8b11000开始-->

            <div id="item943b5410-90b1-11ec-aeed-1533f8b11000">
                <div class="swiper-container">
                    <div class="swiper-wrapper"></div>
                    <div class="swiper-pagination"></div>
                    <div
                            class="swiper-button-prev home-banner-active banner-prev"
                    ></div>
                    <div
                            class="swiper-button-next home-banner-active banner-next"
                    ></div>
                </div>
            </div>

            <script type="text/javascript">
                $(function () {
                    // 指定图表的配置项
                    let option = {
                        "loop": false,
                        "autoplay": {"delay": 100000},
                        "speed": 500,
                        "direction": "horizontal",
                        "pagination": {"show": true},
                        "arrows": false,
                        "nextEl": false,
                        "preEl": false
                    };

                    const init = () => {
                        $.ajax(
                            {
                                url: '${pageContext.request.contextPath}/api/photo/${siteId}?',
                                type: 'GET',
                                data: {},
                                headers: {"token": null},
                                dataType: "json",
                                xhrFields: {withCredentials: false},
                                success: function (data) {

                                    data = data.map(item => {
                                        return {url: item['url']}
                                    })
                                    $('#item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container').empty()
                                    $('#item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container').append(`<div class="swiper-wrapper">
                      </div>
                      <div class="swiper-pagination"></div>
                      <div class="swiper-button-prev home-banner-active banner-prev"></div>
                      <div class="swiper-button-next home-banner-active banner-next"></div>`)
                                    for (let index = 0; index < data.length; index++) {
                                        let item = data[index]
                                        let node = $(`
                      <div class="swiper-slide">
                          <div class="swiper-box">
                              <img src="\${item.url}" alt="" title="\${item.name}">
                          </div>
                      </div>
                  `);
                                        $("#item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-wrapper").append(node)
                                    }
                                    let mySwiper = new Swiper('#item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container', {
                                        direction: option.direction,
                                        loop: option.loop,
                                        initialSlide: 0,
                                        speed: option.speed,
                                        autoHeight: true,
                                        preloadImages: true,
                                        preventClicksPropagation: false,
                                        autoplay: {
                                            delay: option.autoplay.delay,
                                            stopOnLastSlide: false,
                                            disableOnInteraction: true,
                                            reverseDirection: false,
                                        },
                                        pagination: {
                                            el: '.swiper-pagination',
                                            clickable: true,
                                            observer: true,
                                            observeParents: true,
                                        },
                                        navigation: {
                                            nextEl: ".banner-next",
                                            prevEl: ".banner-prev",
                                        },
                                    })
                                }
                            }
                        );
                    }
                    init()

                    setInterval(() => {
                        init()
                    }, 300000)

                })
            </script>

            <style>
                #item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container {
                    width: 520.03px;
                    height: 287.53px;
                }

                #item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container .swiper-wrapper {
                    width: 100%;
                    height: 100%;
                }

                #item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container .swiper-slide {
                    width: 100%;
                    height: 100%;
                }

                #item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container .swiper-slide .swiper-box {
                    width: 100%;
                    height: 100%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                #item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container .swiper-slide .swiper-box img {
                    width: 70%;
                    height: 65%;
                }

                #item943b5410-90b1-11ec-aeed-1533f8b11000 .swiper-container-horizontal > .swiper-pagination-bullets, .swiper-pagination-custom, .swiper-pagination-fraction {
                    bottom: 23%;
                }
            </style>

            <!-- 组件943b5410-90b1-11ec-aeed-1533f8b11000结束-->

            <!-- 组件a61b51e0-7440-11ec-b9a4-a304abb9328e开始-->

            <div id="itema61b51e0-7440-11ec-b9a4-a304abb9328e">
                <h2>历史画面</h2>
            </div>

            <style>
                #itema61b51e0-7440-11ec-b9a4-a304abb9328e {
                    color: rgba(39, 51, 68, 1);
                    display: flex;
                    text-align: left;
                    line-height: 1;
                    font-style: normal;
                    justify-content: center;
                    align-items: center;

                }
            </style>

            <!-- 组件a61b51e0-7440-11ec-b9a4-a304abb9328e结束-->
        </div>
        <!-- 分组ea836a60-7441-11ec-b9a4-a304abb9328e结束-->

        <!-- 分组efc42c30-7441-11ec-b9a4-a304abb9328e开始-->
        <div id="itemefc42c30-7441-11ec-b9a4-a304abb9328e">
            <!-- 组件efc42c32-7441-11ec-b9a4-a304abb9328e开始-->

            <div id="itemefc42c32-7441-11ec-b9a4-a304abb9328e">
                <h2>告警事件</h2>
            </div>

            <style>
                #itemefc42c32-7441-11ec-b9a4-a304abb9328e {
                    color: rgba(39, 51, 68, 1);
                    display: flex;
                    text-align: center;
                    line-height: 1;
                    font-style: normal;
                    justify-content: center;
                    align-items: center;

                }
            </style>

            <!-- 组件efc42c32-7441-11ec-b9a4-a304abb9328e结束-->

            <!-- 组件ff0d1740-90ae-11ec-aeed-1533f8b11000开始-->

            <div
                    id="itemff0d1740-90ae-11ec-aeed-1533f8b11000"
                    class="scrollTable"
            >
                <table
                        style="width:100%;border-collapse: collapse"
                        cellspacing="0"
                        cellpadding="0"
                >
                    <thead
                            style="display:table;width:inherit;table-layout:fixed;box-sizing: border-box;"
                    >
                    <tr
                            class="thead-tr"
                            style="line-height: 40px;
        color: rgba(251, 250, 250, 1);
        font-size: 16px;
        background-color: rgba(29, 78, 193, 1);"
                    ></tr>
                    </thead>
                    <tbody
                            class="table-body body-style"
                            style=" overflow-y: scroll;display:none;"
                    ></tbody>
                </table>
                <div
                        class="tbody"
                        style="height: 227.04000000000002px;
            overflow: hidden;
            display: table;
            width: inherit;
            table-layout: fixed;
            box-sizing: border-box;
            color: rgba(255, 255, 255, 0.9);
            line-height: 35px;
            font-size: 15px;
            width: 100%;"
                >
                    <ul id="itemff0d1740-90ae-11ec-aeed-1533f8b11000tbody"></ul>
                </div>
            </div>

            <script type="text/javascript">
                $(function () {
                    // 指定文字的配置项
                    let option = {
                        "theader": {
                            "align": "center",
                            "height": 40,
                            "fontSize": 16,
                            "fontColor": "rgba(251, 250, 250, 1)",
                            "backgroundColor": "rgba(29, 78, 193, 1)"
                        },
                        "tbody": {
                            "align": "center",
                            "height": 35,
                            "fontSize": 15,
                            "fontColor": "rgba(255, 255, 255, 0.9)",
                            "backgroundColor": "rgba(6, 152, 218, 1)"
                        },
                        "border": {"show": true, "width": 0, "color": "rgba(79, 141, 170, 1)"},
                        "table": {
                            "stripe": true,
                            "stripeColor": "rgba(23, 121, 200, 1)",
                            "cellpadding": 0,
                            "cellspacing": 0,
                            "borderCollapse": "collapse"
                        },
                        "defaultOption": {
                            "step": 0.6,
                            "limitMoveNum": 5,
                            "hoverStop": true,
                            "direction": 1,
                            "openWatch": true,
                            "singleHeight": 32,
                            "singleWidth": 0,
                            "waitTime": 2000
                        }
                    };
                    let scrollObj = null
                    const init = () => {
                        $.ajax(
                            {
                                url: '${pageContext.request.contextPath}/api/alarm-list/${siteId}?',
                                type: 'GET',
                                data: {},
                                headers: {"token": null},
                                dataType: "json",
                                xhrFields: {withCredentials: false},
                                success: function (data) {

                                    //映射
                                    let show = true;
                                    let stripe = true;
                                    if (data.length) {
                                        const thList = Object.keys(data[0])
                                        let thdom = document.querySelector('#itemff0d1740-90ae-11ec-aeed-1533f8b11000 .thead-tr')
                                        let thstr = ''
                                        for (let i = 0; i < thList.length; i++) {
                                            if (show) {
                                                thstr += `<td class="has-border" style="text-indent: 10px;text-align: center">\${thList[i]}</td>`
                                            } else {
                                                thstr += `<td class="no-border" style="text-indent: 10px;text-align: center">\${thList[i]}</td>`
                                            }
                                        }
                                        thdom.innerHTML = thstr
                                        let tbodydom = document.querySelector('#itemff0d1740-90ae-11ec-aeed-1533f8b11000tbody')
                                        let tbodystr = ''
                                        for (let i = 0; i < data.length; i++) {
                                            let trstr = ''
                                            if (stripe) {
                                                trstr = '<li class="li stripe">'
                                            } else {
                                                trstr = '<li class="li">'
                                            }
                                            for (let j = 0; j < thList.length; j++) {
                                                if (show) {
                                                    trstr += `<div style="text-indent: 10px;display: table-cell;box-sizing: border-box;border: 0px solid  rgba(79, 141, 170, 1);text-align: center;word-break: break-all;">\${data[i][thList[j]]}</div>`
                                                } else {
                                                    trstr += `<div style="text-indent: 10px;display: table-cell;box-sizing: border-box;border: none;text-align: center;word-break: break-all;">\${data[i][thList[j]]}</div>`
                                                }
                                            }
                                            trstr += '</li>'
                                            tbodystr += trstr
                                        }
                                        tbodydom.innerHTML = tbodystr
                                        let optionScroll = JSON.parse(JSON.stringify(option.defaultOption))
                                        delete optionScroll.step
                                        if (scrollObj) {
                                            scrollObj.options.dom = null
                                        }
                                        if (data.length * option.tbody.height + option.theader.height > 267.04) {
                                            scrollObj = seamscroll.init({
                                                dom: document.getElementById('itemff0d1740-90ae-11ec-aeed-1533f8b11000tbody'),
                                                ...optionScroll
                                            })
                                        }
                                    }
                                }
                            }
                        );
                    }
                    init()

                    setInterval(() => {
                        init()
                    }, 60000)

                })
            </script>

            <style>
                #itemff0d1740-90ae-11ec-aeed-1533f8b11000 {
                    overflow: hidden;
                    box-sizing: border-box;
                }

                #itemff0d1740-90ae-11ec-aeed-1533f8b11000 .has-border {
                    border: 0px solid rgba(79, 141, 170, 1);
                }

                #itemff0d1740-90ae-11ec-aeed-1533f8b11000 .no-border {
                    border: none;
                }

                #itemff0d1740-90ae-11ec-aeed-1533f8b11000 .li {
                    display: table;
                    width: inherit;
                    table-layout: fixed;
                    box-sizing: border-box;
                    width: 100%;
                    border-collapse: collapse;
                    border-spacing: 0px;
                }

                #itemff0d1740-90ae-11ec-aeed-1533f8b11000 .li div {
                    background-color: rgba(6, 152, 218, 1);
                }

                #itemff0d1740-90ae-11ec-aeed-1533f8b11000 .stripe:nth-child(2n) div {
                    background: rgba(23, 121, 200, 1);
                }
            </style>

            <!-- 组件ff0d1740-90ae-11ec-aeed-1533f8b11000结束-->
        </div>
        <!-- 分组efc42c30-7441-11ec-b9a4-a304abb9328e结束-->

        <!-- 分组f2b865f0-7441-11ec-b9a4-a304abb9328e开始-->
        <div id="itemf2b865f0-7441-11ec-b9a4-a304abb9328e">
            <!-- 组件1ffe0bbd-638f-46e3-97a7-3483a12e06e9开始-->

            <div id="item1ffe0bbd-638f-46e3-97a7-3483a12e06e9"></div>

            <script type="text/javascript">
                $(function () {
                    // 基于准备好的dom，初始化echarts实例
                    const myChart = echarts.init(document.getElementById("item1ffe0bbd-638f-46e3-97a7-3483a12e06e9"));
                    // 指定图表的配置项
                    const init = () => {
                        let option = {
                            "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                            "tooltip": {
                                "show": true,
                                "trigger": "axis",
                                "animation": true,
                                "alwaysShowContent": false,
                                "triggerOn": "mousemove",
                                "confine": false,
                                "borderColor": "#333",
                                "borderWidth": 2,
                                "padding": 10,
                                "backgroundColor": "rgba(0, 188, 212, 0.27)",
                                "axisPointer": {
                                    "type": "line",
                                    "lineStyle": {
                                        "color": "#555",
                                        "width": 1,
                                        "type": "dashed",
                                        "cap": "butt",
                                        "opacity": 1
                                    },
                                    "crossStyle": {
                                        "color": "#555",
                                        "width": 1,
                                        "type": "dashed",
                                        "cap": "butt",
                                        "opacity": 1
                                    },
                                    "shadowStyle": {"color": "rgba(150,150,150,0.3)", "opacity": 1}
                                },
                                "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20}
                            },
                            "title": {
                                "text": "平滑折线图",
                                "show": false,
                                "link": "http://weitu.yunzhisec.com",
                                "target": "blank",
                                "textStyle": {
                                    "color": "#fff",
                                    "fontStyle": "normal",
                                    "fontWeight": "bolder",
                                    "fontSize": 18,
                                    "lineHeight": 30,
                                    "textBorderColor": "",
                                    "textBorderWidth": 0,
                                    "textBorderType": "solid",
                                    "textBorderDashOffset": 0,
                                    "textShadowColor": "transparent",
                                    "textShadowBlur": 0,
                                    "textShadowOffsetX": 0,
                                    "textShadowOffsetY": 0,
                                    "overflow": "none"
                                },
                                "padding": 0,
                                "itemGap": 10,
                                "z": 10,
                                "left": "center",
                                "top": "top",
                                "right": "auto",
                                "bottom": "auto",
                                "backgroundColor": "transparent",
                                "borderColor": "",
                                "borderWidth": "",
                                "borderRadius": 0,
                                "shadowBlur": 0,
                                "shadowColor": "",
                                "shadowOffsetX": "",
                                "shadowOffsetY": "",
                                "subtext": "",
                                "sublink": "",
                                "subtarget": "blank",
                                "subtextStyle": {
                                    "color": "#ffffff",
                                    "fontStyle": "normal",
                                    "fontWeight": "normal",
                                    "fontSize": 12,
                                    "lineHeight": 0,
                                    "textBorderColor": "",
                                    "textBorderWidth": 0,
                                    "textBorderType": "solid",
                                    "textBorderDashOffset": 0,
                                    "textShadowColor": "transparent",
                                    "textShadowBlur": 0,
                                    "textShadowOffsetX": 0,
                                    "textShadowOffsetY": 0,
                                    "overflow": "none"
                                }
                            },
                            "legend": {
                                "show": true,
                                "top": 10,
                                "left": "center",
                                "orient": "horizontal",
                                "itemWidth": 16,
                                "itemHeight": 2,
                                "itemGap": 10,
                                "icon": "roundRect",
                                "textStyle": {"color": "rgba(0, 0, 0, 1)", "fontSize": 20}
                            },
                            "xAxis": {
                                "show": true,
                                "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 18, "margin": 8},
                                "axisLine": {
                                    "show": true,
                                    "lineStyle": {"color": "rgba(151,151,151,1)", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#cccccc", "type": "solid", "width": 1}
                                },
                                "smooth": false,
                                "type": "category",
                                "data": ["08:07", "10:07", "12:07", "14:07", "16:07", "22:07"]
                            },
                            "yAxis": {
                                "show": true,
                                "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 12, "margin": 8},
                                "axisLine": {
                                    "show": true,
                                    "lineStyle": {"color": "rgba(151,151,151,1)", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": true,
                                    "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "dashed", "width": 1}
                                },
                                "type": "value"
                            },
                            "color": ["#3D9CFF", "#43E8F3"],
                            "series": [{
                                "name": "邮件营销",
                                "type": "line",
                                "yAxisIndex": 0,
                                "data": [120, 132, 101, 134, 90, 230, 210]
                            }, {
                                "name": "短信营销",
                                "type": "line",
                                "yAxisIndex": 0,
                                "data": [140, 112, 171, 134, 120, 250, 260]
                            }]
                        };
                        let seriesStyle = {
                            "label": {
                                "show": false,
                                "position": "top",
                                "color": "#FFFFFF",
                                "fontSize": 12,
                                "offset": [0, 0]
                            },
                            "areaStyle": {
                                "opacity": 0,
                                "shadowBlur": 6,
                                "shadowColor": "#85a5ff",
                                "shadowOffsetX": 0,
                                "shadowOffsetY": 0
                            },
                            "showSymbol": false,
                            "symbol": "circle",
                            "symbolSize": 20,
                            "symbolOffset": [0, 0],
                            "step": false,
                            "lineStyle": {
                                "opacity": 1,
                                "type": "line",
                                "width": 3,
                                "shadowBlur": 20,
                                "shadowOffsetX": 2,
                                "shadowOffsetY": 5
                            },
                            "smooth": true
                        };
                        $.ajax(
                            {
                                url: '${pageContext.request.contextPath}/api/lx/${siteId}?',
                                type: 'GET',
                                data: {},
                                headers: {"token": null},
                                dataType: "json",
                                xhrFields: {withCredentials: false},
                                success: function (data) {
                                    // myChart.clear()

                                    let sKey = "name";
                                    let xKey = "time";
                                    let yKey = "value";
                                    let seriesArr = data.map(item => item[sKey])
                                    seriesArr = [...new Set(seriesArr)]
                                    option.series = []

                                    // X轴赋值
                                    let dataColumn = []
                                    data.forEach(item => dataColumn.push(item[xKey]))
                                    dataColumn = [...new Set(dataColumn)]
                                    option.xAxis.data = dataColumn;

                                    seriesArr.forEach(item => {
                                        const datas = data.filter(oitem => oitem[sKey] === item).map(_item => {
                                            return {name: _item[xKey], value: _item[yKey]}
                                        })
                                        option.series.push({
                                            name: item,
                                            data: datas,
                                            type: "line",
                                            ...seriesStyle
                                        })
                                    })
                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
                                }
                            }
                        );
                    }
                    init()

                })
            </script>

            <!-- 组件1ffe0bbd-638f-46e3-97a7-3483a12e06e9结束-->

            <!-- 组件f2b865f2-7441-11ec-b9a4-a304abb9328e开始-->

            <div id="itemf2b865f2-7441-11ec-b9a4-a304abb9328e">
                <h2>历史亮度变化</h2>
            </div>

            <style>
                #itemf2b865f2-7441-11ec-b9a4-a304abb9328e {
                    color: rgba(39, 51, 68, 1);
                    display: flex;
                    text-align: center;
                    line-height: 1;
                    font-style: normal;
                    justify-content: center;
                    align-items: center;

                }
            </style>

            <!-- 组件f2b865f2-7441-11ec-b9a4-a304abb9328e结束-->
        </div>
        <!-- 分组f2b865f0-7441-11ec-b9a4-a304abb9328e结束-->

        <!-- 组件da89986b-47dc-4287-a774-a9ffb6461ff3开始-->

        <div id="itemda89986b-47dc-4287-a774-a9ffb6461ff3">
            <img
                    src="/static/images/7abedc12-c270-4f0b-85ef-56cf4492bd6c.png"
                    alt=""
            />
        </div>
        <style>
            #itemda89986b-47dc-4287-a774-a9ffb6461ff3 {
                width: 571.85px;
                height: 971.21px;
            }

            #itemda89986b-47dc-4287-a774-a9ffb6461ff3 img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件da89986b-47dc-4287-a774-a9ffb6461ff3结束-->
    </div>
    <!-- 分组8b26fd80-7440-11ec-b9a4-a304abb9328e结束-->

    <!-- 分组75409e50-7444-11ec-b9a4-a304abb9328e开始-->
    <div id="item75409e50-7444-11ec-b9a4-a304abb9328e">
        <!-- 组件5353a7dc-b864-4ae4-b436-5f2632ff3d9e开始-->

        <div id="item5353a7dc-b864-4ae4-b436-5f2632ff3d9e">
            <img src="" alt=""/>
            <svg
                    width="100%"
                    height="100%"
                    viewBox="0 0 183 111"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
            >
                <rect width="183" height="111" fill="#14202D"/>
                <circle cx="130.552" cy="24.8774" r="6" fill="#43E8F3"/>
                <path
                        opacity="0.5"
                        d="M131.509 74L80.0186 111H183L131.509 74Z"
                        fill="url(#paint0_linear_1233:1875)"
                />
                <path
                        d="M66.1027 56.6328L0 111H132.205L66.1027 56.6328Z"
                        fill="url(#paint1_linear_1233:1875)"
                />
                <defs>
                    <linearGradient
                            id="paint0_linear_1233:1875"
                            x1="131.797"
                            y1="112.088"
                            x2="141.911"
                            y2="79.5955"
                            gradientUnits="userSpaceOnUse"
                    >
                        <stop stop-color="#3D9CFF"/>
                        <stop offset="1" stop-color="#43E8F3"/>
                    </linearGradient>
                    <linearGradient
                            id="paint1_linear_1233:1875"
                            x1="66.4719"
                            y1="112.599"
                            x2="83.0284"
                            y2="66.1275"
                            gradientUnits="userSpaceOnUse"
                    >
                        <stop stop-color="#3D9CFF"/>
                        <stop offset="1" stop-color="#43E8F3"/>
                    </linearGradient>
                </defs>
            </svg>
        </div>

        <script type="text/javascript">
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                // 指定图表的配置项
                let option = {};

                // 指定文字的数据
                // //{siteId}
                // 获取监控url
                $.ajax(
                    {
                        url: '${pageContext.request.contextPath}/api/camera/${siteId}',
                        type: 'GET',
                        data: {},
                        headers: {"token": null},
                        dataType: "json",
                        xhrFields: {withCredentials: false},
                        success: function (data) {
                            console.log("获取到url：" + data)
                            $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img").attr("src", data.url)
                            if (data.url) {
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e svg").css('display', 'none')
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img").css('display', 'block')
                            } else {
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img").css('display', 'none')
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e svg").css('display', 'block')
                            }
                        },
                        error : function() {
                            console.log("异常")
                            let data = [{"url": "http://192.168.2.12:5000/device/1"}]
                            data = data.map(item => {
                                return {url: item['url']}
                            })
                            $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img").attr("src", data[0].url)
                            if (data[0].url) {
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e svg").css('display', 'none')
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img").css('display', 'block')
                            } else {
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img").css('display', 'none')
                                $("#item5353a7dc-b864-4ae4-b436-5f2632ff3d9e svg").css('display', 'block')
                            }
                        }
                    }
                );
            })
        </script>

        <style>
            #item5353a7dc-b864-4ae4-b436-5f2632ff3d9e {
                width: 954.76px;
                height: 593.53px;
            }

            #item5353a7dc-b864-4ae4-b436-5f2632ff3d9e img {
                width: 100%;
                height: 100%;
            }
        </style>
        <!-- 组件5353a7dc-b864-4ae4-b436-5f2632ff3d9e结束-->

        <!-- 组件aae92740-f536-46f5-aff0-e7178773154a开始-->

        <div id="itemaae92740-f536-46f5-aff0-e7178773154a">
            <img
                    src="/static/images/c41ba388-6ba1-4842-ad9b-acde2ef58bdd.png"
                    alt=""
            />
        </div>
        <style>
            #itemaae92740-f536-46f5-aff0-e7178773154a {
                width: 1003.6px;
                height: 641.2px;
            }

            #itemaae92740-f536-46f5-aff0-e7178773154a img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件aae92740-f536-46f5-aff0-e7178773154a结束-->
    </div>
    <!-- 分组75409e50-7444-11ec-b9a4-a304abb9328e结束-->

    <!-- 分组92039740-b840-11ed-9b45-97a79d61fdee开始-->
    <div id="item92039740-b840-11ed-9b45-97a79d61fdee">
        <!-- 分组a2662960-7451-11ec-b9a4-a304abb9328e开始-->
        <div id="itema2662960-7451-11ec-b9a4-a304abb9328e">
            <!-- 组件fb0d7710-90a5-11ec-aeed-1533f8b11000开始-->

            <div id="itemfb0d7710-90a5-11ec-aeed-1533f8b11000"></div>

            <!-- 组件fb0d7710-90a5-11ec-aeed-1533f8b11000结束-->

            <!-- 组件faae4300-2153-11ed-9614-054305645041开始-->

            <div id="itemfaae4300-2153-11ed-9614-054305645041">
                <h2>温度</h2>
            </div>

            <style>
                #itemfaae4300-2153-11ed-9614-054305645041 {
                    color: rgba(31, 30, 30, 1);
                    display: flex;
                    text-align: center;
                    line-height: 1;
                    font-style: normal;
                    justify-content: center;
                    align-items: center;

                }
            </style>

            <!-- 组件faae4300-2153-11ed-9614-054305645041结束-->

            <!-- 组件7806a148-85d4-4ccd-a4fe-534f26b9c262开始-->

            <div id="item7806a148-85d4-4ccd-a4fe-534f26b9c262">
                <img
                        src="/static/images/bbf1fa93-054c-4b86-8f75-ba129ce6b30f.png"
                        alt=""
                />
            </div>
            <style>
                #item7806a148-85d4-4ccd-a4fe-534f26b9c262 {
                    width: 311.25px;
                    height: 311px;
                }

                #item7806a148-85d4-4ccd-a4fe-534f26b9c262 img {
                    width: 100%;
                    height: 100%
                }
            </style>
            <!-- 组件7806a148-85d4-4ccd-a4fe-534f26b9c262结束-->
        </div>
        <!-- 分组a2662960-7451-11ec-b9a4-a304abb9328e结束-->

        <!-- 分组9f194850-7451-11ec-b9a4-a304abb9328e开始-->
        <div id="item9f194850-7451-11ec-b9a4-a304abb9328e">
            <!-- 组件9a489600-90a3-11ec-aeed-1533f8b11000开始-->

            <div id="item9a489600-90a3-11ec-aeed-1533f8b11000"></div>

            <script type="text/javascript">
                updateHmt = function (hmt) {
                    // 基于准备好的dom，初始化echarts实例
                    const myChart = echarts.init(document.getElementById("item9a489600-90a3-11ec-aeed-1533f8b11000"));
                    // 指定图表的配置项
                    let option = {
                        "grid": {"top": 15, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                        "angleAxis": {"max": 100, "clockwise": true, "show": false, "startAngle": 0},
                        "radiusAxis": {"type": "category", "show": false},
                        "polar": {"center": ["50%", "50%"], "radius": ["100%", "70%"]},
                        "series": [{
                            "stack": "ring",
                            "type": "bar",
                            "data": [0.01],
                            "useSeriesStyle": false,
                            "showBackground": false,
                            "coordinateSystem": "polar",
                            "roundCap": true,
                            "barWidth": 4,
                            "itemStyle": {"color": "#3D9CFF", "borderColor": "#3D9CFF", "borderWidth": 6},
                            "z": 10
                        }, {
                            "stack": "ring",
                            "type": "bar",
                            "data": [50],
                            "useSeriesStyle": false,
                            "coordinateSystem": "polar",
                            "roundCap": true,
                            "barWidth": 4,
                            "itemStyle": {"color": "#224973", "borderColor": "#224973", "borderWidth": 0},
                            "silent": true
                        }]
                    };
                    let seriesStyle = {
                        "color": [{
                            "type": "linear",
                            "x": 0,
                            "y": 1,
                            "x2": 1,
                            "y2": 1,
                            "colorStops": [{"offset": 0, "color": "#3D9CFF"}, {"offset": 1, "color": "#43E8F3"}],
                            "globalCoord": false
                        }],
                        "outline": {
                            "show": true,
                            "borderDistance": 8,
                            "itemStyle": {
                                "color": "transparent",
                                "borderColor": "rgba(0,0,0,0)",
                                "borderWidth": 0,
                                "shadowBlur": 20,
                                "shadowColor": "rgba(0, 0, 0, 0.25)",
                                "borderType": "solid"
                            }
                        },
                        "itemStyle": {
                            "color": {
                                "type": "linear",
                                "x": 0,
                                "y": 0,
                                "x2": 1,
                                "y2": 0,
                                "colorStops": [{"offset": 0, "color": "#3c9dfe"}, {"offset": 1, "color": "#42e4f3"}],
                                "global": false
                            }, "opacity": 0.95, "shadowBlur": 50, "shadowColor": "rgba(0, 0, 0, 0.4)"
                        },
                        "label": {"show": true, "color": "#ffffff", "fontSize": 35, "lineHeight": 40},
                        "radius": "70%",
                        "center": ["50%", "50%"],
                        "backgroundStyle": {
                            "color": "rgba(241, 248, 255, 0.1)",
                            "borderColor": "rgba(0,0,0,0)",
                            "borderWidth": 0,
                            "shadowBlur": 10,
                            "shadowColor": "rgba(73,97,218,1)",
                            "opacity": 1
                        }
                    };

                    data = [{"value": hmt, "name": "占比"}]
                    // 指定图表的数据
                    if (!hmt) {
                        data = [{"value": 0.55, "name": "占比"}]
                    }

                    data = data.map(item => {
                        return {value: item['value'], name: item['name']}
                    })
                    //数据处理 开始
                    let seriesObj = [
                        {
                            type: "liquidFill",
                            ...seriesStyle,
                            data: [
                                {
                                    value: data[0].value,
                                    itemStyle: {
                                        opacity: 1,
                                    }
                                },
                                {
                                    value: data[0].value,
                                    itemStyle: {
                                        opacity: 0.5,
                                    }
                                }
                            ]
                        }
                    ]
                    let series = seriesObj.concat(option.series)
                    // 数据处理完
                    option.series = series

                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                }
            </script>

            <!-- 组件9a489600-90a3-11ec-aeed-1533f8b11000结束-->

            <!-- 组件68e417e0-74ee-11ec-9a45-85cd06378d51开始-->

            <div id="item68e417e0-74ee-11ec-9a45-85cd06378d51">
                <h2>湿度</h2>
            </div>

            <style>
                #item68e417e0-74ee-11ec-9a45-85cd06378d51 {
                    color: rgba(31, 30, 30, 1);
                    display: flex;
                    text-align: center;
                    line-height: 1;
                    font-style: normal;
                    justify-content: center;
                    align-items: center;

                }
            </style>

            <!-- 组件68e417e0-74ee-11ec-9a45-85cd06378d51结束-->

            <!-- 组件ab51f8f4-7a3b-49d6-88ef-95e4410934c9开始-->

            <div id="itemab51f8f4-7a3b-49d6-88ef-95e4410934c9">
                <img
                        src="/static/images/90c46b71-e92a-4638-a752-58d5a61bcabd.png"
                        alt=""
                />
            </div>
            <style>
                #itemab51f8f4-7a3b-49d6-88ef-95e4410934c9 {
                    width: 313.75px;
                    height: 307.25px;
                }

                #itemab51f8f4-7a3b-49d6-88ef-95e4410934c9 img {
                    width: 100%;
                    height: 100%
                }
            </style>
            <!-- 组件ab51f8f4-7a3b-49d6-88ef-95e4410934c9结束-->
        </div>
        <!-- 分组9f194850-7451-11ec-b9a4-a304abb9328e结束-->

        <style>
            /* 自己加的部分 */
            .mask {
                position: fixed;
                bottom: 0;
                top: 0;
                left: 0;
                right: 0;
                /* background:rgb(85, 204, 240); */
                z-index: -1;
            }
        </style>
        <!-- 分组61c691d6-4da0-4b3e-8635-13fb3f5adae3开始-->
        <div id="item61c691d6-4da0-4b3e-8635-13fb3f5adae3">
            <!-- 组件727fa19f-69a7-4549-807c-7815372fc953开始-->

            <div id="item727fa19f-69a7-4549-807c-7815372fc953">
                <p id="lxData">430 lx</p>
            </div>

            <style>
                #item727fa19f-69a7-4549-807c-7815372fc953 {
                    line-height: 1.5;
                    font-size: 30px;
                    text-align: center;
                    font-weight: bold;
                    font-style: normal;
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: center;
                    align-items: center;
                    color: #ffffff;

                    text-shadow: 0px 0px 14px rgba(15, 146, 255, 1);

                }

                #item727fa19f-69a7-4549-807c-7815372fc953 .rich-text {
                    white-space: nowrap;
                    overflow: visible;
                    line-height: 1.2;
                    letter-spacing: -1px;
                    margin-top: -2px;
                }
            </style>
            <!-- 组件727fa19f-69a7-4549-807c-7815372fc953结束-->

            <!-- 组件c82eb21c-6c42-43d1-93cc-922d8607c118开始-->

            <div id="itemc82eb21c-6c42-43d1-93cc-922d8607c118" class="mask">
                <img src="" alt=""/>
                <svg
                        width="100%"
                        height="100%"
                        viewBox="0 0 183 111"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                >
                    <rect width="183" height="111" fill="#14202D"/>
                    <circle cx="130.552" cy="24.8774" r="6" fill="#43E8F3"/>
                    <path
                            opacity="0.5"
                            d="M131.509 74L80.0186 111H183L131.509 74Z"
                            fill="url(#paint0_linear_1233:1875)"
                    />
                    <path
                            d="M66.1027 56.6328L0 111H132.205L66.1027 56.6328Z"
                            fill="url(#paint1_linear_1233:1875)"
                    />
                    <defs>
                        <linearGradient
                                id="paint0_linear_1233:1875"
                                x1="131.797"
                                y1="112.088"
                                x2="141.911"
                                y2="79.5955"
                                gradientUnits="userSpaceOnUse"
                        >
                            <stop stop-color="#3D9CFF"/>
                            <stop offset="1" stop-color="#43E8F3"/>
                        </linearGradient>
                        <linearGradient
                                id="paint1_linear_1233:1875"
                                x1="66.4719"
                                y1="112.599"
                                x2="83.0284"
                                y2="66.1275"
                                gradientUnits="userSpaceOnUse"
                        >
                            <stop stop-color="#3D9CFF"/>
                            <stop offset="1" stop-color="#43E8F3"/>
                        </linearGradient>
                    </defs>
                </svg>
            </div>

            <script type="text/javascript">
                $(function () {
                    // 基于准备好的dom，初始化echarts实例
                    // 指定图表的配置项
                    let option = {};

                    // 指定文字的数据
                    let data = [{"url": "data:image/png;base64,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"}]

                    data = data.map(item => {
                        return {url: item['url']}
                    })
                    $("#itemc82eb21c-6c42-43d1-93cc-922d8607c118 img").attr("src", data[0].url)
                    if (data[0].url) {
                        $("#itemc82eb21c-6c42-43d1-93cc-922d8607c118 svg").css('display', 'none')
                        $("#itemc82eb21c-6c42-43d1-93cc-922d8607c118 img").css('display', 'block')
                    } else {
                        $("#itemc82eb21c-6c42-43d1-93cc-922d8607c118 img").css('display', 'none')
                        $("#itemc82eb21c-6c42-43d1-93cc-922d8607c118 svg").css('display', 'block')
                    }
                })

                // 自己加的部分
                updateLx = function (cur_lx) {
                    $('#lxData').text(cur_lx + ' lx');
                    var mask = document.getElementsByClassName("mask")[0];
                    var max_lx = 1000
                    // 亮度比
                    var proportion = cur_lx / max_lx
                    var update = function (proportion) {
                        mask.style.opacity = 1 - proportion
                    }
                    update(proportion)
                }
            </script>

            <style>
                #itemc82eb21c-6c42-43d1-93cc-922d8607c118 {
                    width: 257.5px;
                    height: 255px;
                }

                #itemc82eb21c-6c42-43d1-93cc-922d8607c118 img {
                    width: 100%;
                    height: 100%;
                }
            </style>
            <!-- 组件c82eb21c-6c42-43d1-93cc-922d8607c118结束-->

            <!-- 组件0585c100-b811-11ed-a51a-f909d4e91548开始-->

            <div id="item0585c100-b811-11ed-a51a-f909d4e91548">
                <h2>亮度</h2>
            </div>

            <style>
                #item0585c100-b811-11ed-a51a-f909d4e91548 {
                    color: rgba(31, 30, 30, 1);
                    display: flex;
                    text-align: center;
                    line-height: 1;
                    font-style: normal;
                    justify-content: center;
                    align-items: center;

                }
            </style>

            <!-- 组件0585c100-b811-11ed-a51a-f909d4e91548结束-->

            <!-- 组件c3b50f36-a928-46e2-9445-5148b08afb94开始-->

            <div id="itemc3b50f36-a928-46e2-9445-5148b08afb94">
                <img
                        src="/static/images/f5edd60a-acb5-4df7-9968-d46406d99718.png"
                        alt=""
                />
            </div>
            <style>
                #itemc3b50f36-a928-46e2-9445-5148b08afb94 {
                    width: 311.25px;
                    height: 311px;
                }

                #itemc3b50f36-a928-46e2-9445-5148b08afb94 img {
                    width: 100%;
                    height: 100%
                }
            </style>
            <!-- 组件c3b50f36-a928-46e2-9445-5148b08afb94结束-->
        </div>
        <!-- 分组61c691d6-4da0-4b3e-8635-13fb3f5adae3结束-->
    </div>
    <!-- 分组92039740-b840-11ed-9b45-97a79d61fdee结束-->

    <!-- 分组8854a6d0-7444-11ec-b9a4-a304abb9328e开始-->
    <div id="item8854a6d0-7444-11ec-b9a4-a304abb9328e">
        <!-- 组件32a59930-b83e-11ed-9b45-97a79d61fdee开始-->

        <div id="item32a59930-b83e-11ed-9b45-97a79d61fdee"></div>

        <script type="text/javascript">
            // 基于准备好的dom，初始化echarts实例
            $(function () {
                const myChart = echarts.init(document.getElementById("item32a59930-b83e-11ed-9b45-97a79d61fdee"));
                // 指定图表的配置项
                let option = {
                    "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                    "tooltip": {
                        "show": false,
                        "trigger": "axis",
                        "animation": true,
                        "alwaysShowContent": false,
                        "triggerOn": "mousemove",
                        "confine": false,
                        "borderColor": "#333",
                        "borderWidth": 2,
                        "padding": 10,
                        "backgroundColor": "rgba(50,50,50,0.7)",
                        "axisPointer": {
                            "type": "line",
                            "lineStyle": {"color": "#555", "width": 1, "type": "dashed", "cap": "butt", "opacity": 1},
                            "crossStyle": {"color": "#555", "width": 1, "type": "dashed", "cap": "butt", "opacity": 1},
                            "shadowStyle": {"color": "rgba(150,150,150,0.3)", "opacity": 1}
                        },
                        "textStyle": {"color": "#fff", "fontWeight": "normal", "fontSize": 14}
                    },
                    "title": {
                        "text": "       %",
                        "show": true,
                        "link": "http://weitu.yunzhisec.com",
                        "target": "blank",
                        "textStyle": {
                            "color": "rgba(0,0,0,1)",
                            "fontStyle": "normal",
                            "fontWeight": "normal",
                            "fontSize": 20,
                            "lineHeight": 30,
                            "textBorderColor": "",
                            "textBorderWidth": 1,
                            "textBorderType": "solid",
                            "textBorderDashOffset": 1,
                            "textShadowColor": "transparent",
                            "textShadowBlur": 1,
                            "textShadowOffsetX": 1,
                            "textShadowOffsetY": 1,
                            "overflow": "none"
                        },
                        "padding": 1,
                        "itemGap": 10,
                        "z": 10,
                        "left": "left",
                        "top": "top",
                        "right": "auto",
                        "bottom": "auto",
                        "backgroundColor": "transparent",
                        "borderColor": "",
                        "borderWidth": "",
                        "borderRadius": 1,
                        "shadowBlur": 0,
                        "shadowColor": "",
                        "shadowOffsetX": "",
                        "shadowOffsetY": "",
                        "subtext": "",
                        "sublink": "",
                        "subtarget": "blank",
                        "subtextStyle": {
                            "color": "#ffffff",
                            "fontStyle": "normal",
                            "fontWeight": "normal",
                            "fontSize": 12,
                            "lineHeight": 0,
                            "textBorderColor": "",
                            "textBorderWidth": 0,
                            "textBorderType": "solid",
                            "textBorderDashOffset": 0,
                            "textShadowColor": "transparent",
                            "textShadowBlur": 0,
                            "textShadowOffsetX": 0,
                            "textShadowOffsetY": 0,
                            "overflow": "none"
                        }
                    },
                    "legend": {
                        "show": false,
                        "top": 10,
                        "left": "center",
                        "orient": "horizontal",
                        "itemWidth": 16,
                        "itemHeight": 2,
                        "itemGap": 10,
                        "icon": "roundRect",
                        "textStyle": {"color": "#ffffff", "fontSize": 12}
                    },
                    "xAxis": {
                        "show": false,
                        "axisLabel": {"show": false, "color": "rgba(0,0,0,1)", "fontSize": 16, "margin": 8},
                        "axisLine": {
                            "show": false,
                            "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "solid", "width": 1}
                        },
                        "axisTick": {"show": false, "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}},
                        "splitLine": {"show": false, "lineStyle": {"color": "#cccccc", "type": "solid", "width": 1}},
                        "smooth": false,
                        "data": ["8:00", "10:00", "12:00", "14:00", "16:00", "18:00", "20:00"],
                        "type": "category"
                    },
                    "yAxis": {
                        "show": true,
                        "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 16, "margin": 8},
                        "axisLine": {
                            "show": false,
                            "lineStyle": {"color": "rgba(151,151,151,1)", "type": "solid", "width": 1}
                        },
                        "axisTick": {"show": false, "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}},
                        "splitLine": {
                            "show": true,
                            "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "dashed", "width": 1}
                        },
                        "type": "value"
                    },
                    "color": [{
                        "type": "linear",
                        "x": 0,
                        "y": 0,
                        "x2": 0,
                        "y2": 1,
                        "colorStops": [{"offset": 0, "color": "rgba(3,136,209,1)"}, {
                            "offset": 1,
                            "color": "rgba(37,198,218,1)"
                        }],
                        "global": false
                    }],
                    "series": []
                };
                let seriesStyle = {
                    "label": {
                        "show": false,
                        "position": "top",
                        "color": "#FFFFFF",
                        "fontSize": 12,
                        "offset": [0, 0]
                    },
                    "areaStyle": {
                        "opacity": 0,
                        "shadowBlur": 0,
                        "shadowColor": "#85a5ff",
                        "shadowOffsetX": 0,
                        "shadowOffsetY": 0
                    },
                    "showSymbol": false,
                    "symbol": "circle",
                    "symbolSize": 20,
                    "symbolOffset": [0, 0],
                    "step": false,
                    "lineStyle": {
                        "opacity": 1,
                        "type": "line",
                        "width": 0,
                        "shadowBlur": 0,
                        "shadowOffsetX": 0,
                        "shadowOffsetY": 0
                    },
                    "smooth": true
                };
                // 指定图表的数据
                let data = [{"time": "8:00", "value": 0.2, "name": "温度"}, {
                    "time": "10:00",
                    "value": 0.4,
                    "name": "温度"
                }, {"time": "12:00", "value": 0.6, "name": "温度"}, {
                    "time": "14:00",
                    "value": 0.2,
                    "name": "温度"
                }, {"time": "16:00", "value": 0.5, "name": "温度"}, {
                    "time": "18:00",
                    "value": 80,
                    "name": "温度"
                }, {"time": "20:00", "value": 100, "name": "温度"}]

                let sKey = "name";
                let xKey = "time";
                let yKey = "value";
                let seriesArr = data.map(item => item[sKey])
                seriesArr = [...new Set(seriesArr)]
                option.series = []
                seriesArr.forEach((item, index) => {
                    const datas = data.filter(oitem => oitem[sKey] === item).map(_item => {
                        return {name: _item[xKey], value: _item[yKey]}
                    })
                    option.series.push({
                        name: item,
                        data: datas,
                        type: "line",
                        ...seriesStyle
                    })
                })
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            })
        </script>

        <!-- 组件32a59930-b83e-11ed-9b45-97a79d61fdee结束-->

        <!-- 组件354c6bb0-b83d-11ed-9b45-97a79d61fdee开始-->

        <div id="item354c6bb0-b83d-11ed-9b45-97a79d61fdee"></div>

        <script type="text/javascript">
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                const myChart = echarts.init(document.getElementById("item354c6bb0-b83d-11ed-9b45-97a79d61fdee"));
                // 指定图表的配置项
                const init = () => {
                    let option = {
                        "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                        "tooltip": {
                            "show": true,
                            "trigger": "axis",
                            "animation": true,
                            "alwaysShowContent": false,
                            "triggerOn": "mousemove",
                            "confine": false,
                            "borderColor": "#333",
                            "borderWidth": 2,
                            "padding": 10,
                            "backgroundColor": "rgba(0, 188, 212, 0.27)",
                            "axisPointer": {
                                "type": "line",
                                "lineStyle": {
                                    "color": "#555",
                                    "width": 1,
                                    "type": "dashed",
                                    "cap": "butt",
                                    "opacity": 1
                                },
                                "crossStyle": {
                                    "color": "#555",
                                    "width": 1,
                                    "type": "dashed",
                                    "cap": "butt",
                                    "opacity": 1
                                },
                                "shadowStyle": {"color": "rgba(150,150,150,0.3)", "opacity": 1}
                            },
                            "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20}
                        },
                        "title": {
                            "text": "      ℃",
                            "show": true,
                            "link": "http://weitu.yunzhisec.com",
                            "target": "blank",
                            "textStyle": {
                                "color": "rgba(0,0,0,1)",
                                "fontStyle": "normal",
                                "fontWeight": "normal",
                                "fontSize": 20,
                                "lineHeight": 30,
                                "textBorderColor": "",
                                "textBorderWidth": 1,
                                "textBorderType": "solid",
                                "textBorderDashOffset": 1,
                                "textShadowColor": "transparent",
                                "textShadowBlur": 1,
                                "textShadowOffsetX": 1,
                                "textShadowOffsetY": 1,
                                "overflow": "none"
                            },
                            "padding": 1,
                            "itemGap": 10,
                            "z": 10,
                            "left": "left",
                            "top": "top",
                            "right": "auto",
                            "bottom": "auto",
                            "backgroundColor": "transparent",
                            "borderColor": "",
                            "borderWidth": "",
                            "borderRadius": 1,
                            "shadowBlur": 0,
                            "shadowColor": "",
                            "shadowOffsetX": "",
                            "shadowOffsetY": "",
                            "subtext": "",
                            "sublink": "",
                            "subtarget": "blank",
                            "subtextStyle": {
                                "color": "#ffffff",
                                "fontStyle": "normal",
                                "fontWeight": "normal",
                                "fontSize": 12,
                                "lineHeight": 0,
                                "textBorderColor": "",
                                "textBorderWidth": 0,
                                "textBorderType": "solid",
                                "textBorderDashOffset": 0,
                                "textShadowColor": "transparent",
                                "textShadowBlur": 0,
                                "textShadowOffsetX": 0,
                                "textShadowOffsetY": 0,
                                "overflow": "none"
                            }
                        },
                        "legend": {
                            "show": false,
                            "top": 10,
                            "left": "center",
                            "orient": "horizontal",
                            "itemWidth": 16,
                            "itemHeight": 2,
                            "itemGap": 10,
                            "icon": "roundRect",
                            "textStyle": {"color": "#ffffff", "fontSize": 12}
                        },
                        "xAxis": {
                            "show": true,
                            "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 18, "margin": 8},
                            "axisLine": {
                                "show": false,
                                "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "solid", "width": 1}
                            },
                            "axisTick": {"show": false, "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}},
                            "splitLine": {
                                "show": false,
                                "lineStyle": {"color": "#cccccc", "type": "solid", "width": 1}
                            },
                            "smooth": false,
                            "data": ["08:07", "10:07", "12:07", "14:07", "16:07", "22:07"],
                            "type": "category"
                        },
                        "yAxis": {
                            "show": true,
                            "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 16, "margin": 8},
                            "axisLine": {
                                "show": true,
                                "lineStyle": {"color": "rgba(151,151,151,1)", "type": "solid", "width": 1}
                            },
                            "axisTick": {"show": false, "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}},
                            "splitLine": {
                                "show": true,
                                "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "dashed", "width": 1}
                            },
                            "type": "value"
                        },
                        "color": [{
                            "type": "linear",
                            "x": 0,
                            "y": 0,
                            "x2": 0,
                            "y2": 1,
                            "colorStops": [{"offset": 0, "color": "rgba(224,32,32,1)"}, {
                                "offset": 1,
                                "color": "rgba(245,124,2,1)"
                            }],
                            "global": false
                        }],
                        "series": []
                    };
                    let seriesStyle = {
                        "label": {
                            "show": false,
                            "position": "top",
                            "color": "#FFFFFF",
                            "fontSize": 12,
                            "offset": [0, 0]
                        },
                        "areaStyle": {
                            "opacity": 0.5,
                            "shadowBlur": 0,
                            "shadowColor": "#85a5ff",
                            "shadowOffsetX": 0,
                            "shadowOffsetY": 0
                        },
                        "showSymbol": false,
                        "symbol": "circle",
                        "symbolSize": 20,
                        "symbolOffset": [0, 0],
                        "step": false,
                        "lineStyle": {
                            "opacity": 1,
                            "type": "line",
                            "width": 4,
                            "shadowBlur": 0,
                            "shadowOffsetX": 0,
                            "shadowOffsetY": 0
                        },
                        "smooth": true
                    };
                    $.ajax(
                        {
                            url: '${pageContext.request.contextPath}/api/tmp/${siteId}?',
                            type: 'GET',
                            data: {},
                            headers: {"token": null},
                            dataType: "json",
                            xhrFields: {withCredentials: false},
                            success: function (data) {
                                // myChart.clear()

                                let sKey = "name";
                                let xKey = "time";
                                let yKey = "value";
                                let seriesArr = data.map(item => item[sKey])
                                seriesArr = [...new Set(seriesArr)]
                                option.series = []

                                // X轴赋值
                                let dataColumn = []
                                data.forEach(item => dataColumn.push(item[xKey]))
                                dataColumn = [...new Set(dataColumn)]
                                option.xAxis.data = dataColumn;

                                seriesArr.forEach((item, index) => {
                                    const datas = data.filter(oitem => oitem[sKey] === item).map(_item => {
                                        return {name: _item[xKey], value: _item[yKey]}
                                    })
                                    option.series.push({
                                        name: item,
                                        data: datas,
                                        type: "line",
                                        ...seriesStyle
                                    })
                                })
                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            }
                        }
                    );
                }
                init()

            })
        </script>

        <!-- 组件354c6bb0-b83d-11ed-9b45-97a79d61fdee结束-->

        <!-- 组件23c5e994-927c-4d9f-96e9-a0456f4a93c2开始-->

        <div id="item23c5e994-927c-4d9f-96e9-a0456f4a93c2"></div>

        <script type="text/javascript">
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                const myChart = echarts.init(document.getElementById("item23c5e994-927c-4d9f-96e9-a0456f4a93c2"));
                // 指定图表的配置项
                const init = () => {
                    let option = {
                        "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                        "tooltip": {
                            "show": true,
                            "trigger": "axis",
                            "animation": true,
                            "alwaysShowContent": false,
                            "triggerOn": "mousemove",
                            "confine": false,
                            "borderColor": "#333",
                            "borderWidth": 2,
                            "padding": 10,
                            "backgroundColor": "rgba(0, 188, 212, 0.27)",
                            "axisPointer": {
                                "type": "line",
                                "lineStyle": {
                                    "color": "#555",
                                    "width": 1,
                                    "type": "dashed",
                                    "cap": "butt",
                                    "opacity": 1
                                },
                                "crossStyle": {
                                    "color": "#555",
                                    "width": 1,
                                    "type": "dashed",
                                    "cap": "butt",
                                    "opacity": 1
                                },
                                "shadowStyle": {"color": "rgba(150,150,150,0.3)", "opacity": 1}
                            },
                            "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20}
                        },
                        "title": {
                            "text": "    ",
                            "show": false,
                            "link": "http://weitu.yunzhisec.com",
                            "target": "blank",
                            "textStyle": {
                                "color": "rgba(0,0,0,1)",
                                "fontStyle": "normal",
                                "fontWeight": "normal",
                                "fontSize": 20,
                                "lineHeight": 30,
                                "textBorderColor": "",
                                "textBorderWidth": 1,
                                "textBorderType": "solid",
                                "textBorderDashOffset": 1,
                                "textShadowColor": "transparent",
                                "textShadowBlur": 1,
                                "textShadowOffsetX": 1,
                                "textShadowOffsetY": 1,
                                "overflow": "none"
                            },
                            "padding": 1,
                            "itemGap": 10,
                            "z": 10,
                            "left": "left",
                            "top": "top",
                            "right": "auto",
                            "bottom": "auto",
                            "backgroundColor": "transparent",
                            "borderColor": "",
                            "borderWidth": "",
                            "borderRadius": 1,
                            "shadowBlur": 0,
                            "shadowColor": "",
                            "shadowOffsetX": "",
                            "shadowOffsetY": "",
                            "subtext": "",
                            "sublink": "",
                            "subtarget": "blank",
                            "subtextStyle": {
                                "color": "#ffffff",
                                "fontStyle": "normal",
                                "fontWeight": "normal",
                                "fontSize": 12,
                                "lineHeight": 0,
                                "textBorderColor": "",
                                "textBorderWidth": 0,
                                "textBorderType": "solid",
                                "textBorderDashOffset": 0,
                                "textShadowColor": "transparent",
                                "textShadowBlur": 0,
                                "textShadowOffsetX": 0,
                                "textShadowOffsetY": 0,
                                "overflow": "none"
                            }
                        },
                        "legend": {
                            "show": false,
                            "top": 10,
                            "left": "center",
                            "orient": "horizontal",
                            "itemWidth": 16,
                            "itemHeight": 2,
                            "itemGap": 10,
                            "icon": "roundRect",
                            "textStyle": {"color": "#ffffff", "fontSize": 12}
                        },
                        "xAxis": {
                            "show": false,
                            "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 16, "margin": 8},
                            "axisLine": {
                                "show": false,
                                "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "solid", "width": 1}
                            },
                            "axisTick": {"show": false, "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}},
                            "splitLine": {
                                "show": false,
                                "lineStyle": {"color": "#cccccc", "type": "solid", "width": 1}
                            },
                            "smooth": false,
                            "data": ["08:07", "10:07", "12:07", "14:07", "16:07", "22:07"],
                            "type": "category"
                        },
                        "yAxis": {
                            "show": false,
                            "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 16, "margin": 8},
                            "axisLine": {
                                "show": true,
                                "lineStyle": {"color": "rgba(151,151,151,1)", "type": "solid", "width": 1}
                            },
                            "axisTick": {"show": false, "lineStyle": {"color": "#01FCE3", "type": "solid", "width": 1}},
                            "splitLine": {
                                "show": true,
                                "lineStyle": {"color": "rgba(241, 248, 255, 0.1)", "type": "dashed", "width": 1}
                            },
                            "type": "value"
                        },
                        "color": [{
                            "type": "linear",
                            "x": 0,
                            "y": 0,
                            "x2": 0,
                            "y2": 1,
                            "colorStops": [{"offset": 0, "color": "rgba(3,136,209,1)"}, {
                                "offset": 1,
                                "color": "rgba(37,198,218,1)"
                            }],
                            "global": false
                        }],
                        "series": []
                    };
                    let seriesStyle = {
                        "label": {
                            "show": false,
                            "position": "top",
                            "color": "#FFFFFF",
                            "fontSize": 12,
                            "offset": [0, 0]
                        },
                        "areaStyle": {
                            "opacity": 0.5,
                            "shadowBlur": 0,
                            "shadowColor": "#85a5ff",
                            "shadowOffsetX": 0,
                            "shadowOffsetY": 0
                        },
                        "showSymbol": false,
                        "symbol": "circle",
                        "symbolSize": 20,
                        "symbolOffset": [0, 0],
                        "step": false,
                        "lineStyle": {
                            "opacity": 1,
                            "type": "line",
                            "width": 4,
                            "shadowBlur": 0,
                            "shadowOffsetX": 0,
                            "shadowOffsetY": 0
                        },
                        "smooth": true
                    };
                    $.ajax(
                        {
                            url: '${pageContext.request.contextPath}/api/hmt/${siteId}?',
                            type: 'GET',
                            data: {},
                            headers: {"token": null},
                            dataType: "json",
                            xhrFields: {withCredentials: false},
                            success: function (data) {
                                // myChart.clear()

                                let sKey = "name";
                                let xKey = "time";
                                let yKey = "value";
                                let seriesArr = data.map(item => item[sKey])
                                seriesArr = [...new Set(seriesArr)]
                                option.series = []

                                // X轴赋值
                                let dataColumn = []
                                data.forEach(item => dataColumn.push(item[xKey]))
                                dataColumn = [...new Set(dataColumn)]
                                option.xAxis.data = dataColumn;

                                seriesArr.forEach((item, index) => {
                                    const datas = data.filter(oitem => oitem[sKey] === item).map(_item => {
                                        return {name: _item[xKey], value: _item[yKey]}
                                    })
                                    option.series.push({
                                        name: item,
                                        data: datas,
                                        type: "line",
                                        ...seriesStyle
                                    })
                                })
                                // 使用刚指定的配置项和数据显示图表。
                                myChart.setOption(option);
                            }
                        }
                    );
                }
                init()

            })
        </script>

        <!-- 组件23c5e994-927c-4d9f-96e9-a0456f4a93c2结束-->

        <!-- 组件8de8acf1-74ed-11ec-9a45-85cd06378d51开始-->

        <div id="item8de8acf1-74ed-11ec-9a45-85cd06378d51">
            <h2>昨日温湿度</h2>
        </div>

        <style>
            #item8de8acf1-74ed-11ec-9a45-85cd06378d51 {
                color: rgba(31, 30, 30, 1);
                display: flex;
                text-align: center;
                line-height: 1;
                font-style: normal;
                justify-content: center;
                align-items: center;

            }
        </style>

        <!-- 组件8de8acf1-74ed-11ec-9a45-85cd06378d51结束-->

        <!-- 组件03ba64c5-0eb3-4c85-892a-699fddff22c2开始-->

        <div id="item03ba64c5-0eb3-4c85-892a-699fddff22c2">
            <img
                    src="/static/images/2d854e2f-c5a7-44cc-9f35-7dee188fea60.png"
                    alt=""
            />
        </div>
        <style>
            #item03ba64c5-0eb3-4c85-892a-699fddff22c2 {
                width: 986.2099999999999px;
                height: 299.49px;
            }

            #item03ba64c5-0eb3-4c85-892a-699fddff22c2 img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件03ba64c5-0eb3-4c85-892a-699fddff22c2结束-->
    </div>
    <!-- 分组8854a6d0-7444-11ec-b9a4-a304abb9328e结束-->
</div>
</body>

<script type="text/javascript">
    // 更新全部实时数据
    $(function () {
        // 准备 echarts渲染的dom元素
        const myChart = echarts.init(document.getElementById("itemfb0d7710-90a5-11ec-aeed-1533f8b11000"))
        const init = () => {
            // 设置 echarts 代码的头 与  尾
            let codeHeader = "function (echarts,myChart,chartDom){ \n let option;\let ROOT_PATH = 'https://cdn.jsdelivr.net/gh/apache/echarts-website@asf-site/examples';\n";
            let codeFooter = "\nreturn option; \n }"
            //  拿到可见的配置项代码 进行拼接
            let code = codeHeader + "option = {\n    // title: {\n    //     text: \"imap-温度监控\",\n    //     left: \"center\"\n    // },\n    series: [{\n        type: 'gauge', center: [\"50%\", \"60%\"], startAngle: 200, endAngle: -20, min: 0, max: 60, splitNumber: 6,\n        itemStyle: {color: '#FFAB91'},\n        progress: {show: true, width: 20},\n        pointer: {show: false,},\n        axisLine: {lineStyle: {width: 25}},\n        axisTick: {distance: -33, splitNumber: 5, lineStyle: {width: 2, color: '#999'}},\n        splitLine: {distance: -45, length: 14, lineStyle: {width: 3, color: '#999'}},\n        axisLabel: {distance: -20, color: '#999', fontSize: 20},\n        anchor: {show: false},\n        title: {show: false},\n        detail: {\n            valueAnimation: true,\n            width: '50%',\n            lineHeight: 40,\n            height: '15%',\n            borderRadius: 6,\n            offsetCenter: ['10%', '-1%'],\n            fontSize: 40,\n            fontWeight: 'bolder',\n            formatter: '{value}°C',\n            color: 'inherit'\n        },\n        data: [{value: 20}]\n    },\n    {\n        type: 'gauge', center: [\"50%\", \"60%\"], startAngle: 200, endAngle: -20, min: 0, max: 60,\n        itemStyle: {color: '#FD7347',},\n        progress: {show: true, width: 6},\n        pointer: {show: false},\n        axisLine: {show: false},\n        axisTick: {show: false},\n        splitLine: {show: false},\n        axisLabel: {show: false},\n        detail: {show: false},\n        data: [{value: 20}]\n    }\n    ],\n}" + codeFooter;
            const codeFunction = {init: eval("(" + code + ")")};
            const option = codeFunction.init(echarts, this.myChart, this.chartDom);
            if (myChart) {
                // myChart.clear();
                $.ajax(
                    {
                        url: '${pageContext.request.contextPath}/api/cur/${siteId}',
                        type: 'GET',
                        data: {},
                        headers: {"token": null},
                        dataType: "json",
                        xhrFields: {withCredentials: false},
                        success: function (data) {

                            //温度数据处理
                            option.series[0].data[0].value = data.tmp;
                            option.series[1].data[0].value = data.tmp;
                            myChart.setOption(option);

                            // 湿度数据处理
                            updateHmt(data.hmt)
                            // 亮度数据处理
                            updateLx(data.lx)
                        }
                    }
                );

                // myChart.setOption(option);
            }
        }
        init()
        setInterval(() => {
            init()
        }, 3000)
    })
</script>

<script>
    $(function () {
        /**
         *
         * 自适应宽度处理
         * 通过当前网页具体宽高 / 设计稿画板实际宽高 得到比例最终缩放页面
         *
         * 如果是同比例，比如12:9的尺寸比例，不管分辨率多大，都是能完全适应且不会被拉伸
         * 如果不是在同一比例，简单来就像图片改变了比例就会被拉升
         *
         * 具体大小可自行设置，下面这句话也可以不要，修改style.css样式也可以，方法很多
         *
         */

        document.getElementsByClassName("container")[0].style.transform = `scaleX(\${window.innerWidth / 1920}) scaleY(\${window.innerHeight / 1080})`


        /**
         *
         * 窗口发生改变自动刷新页面
         * 这样做不太友好，一般做法当前页面大小发生改变去重新加载echarts对象
         * 最好自行修改一下，当然。不要也可以，不会影响功能使用
         *
         */
        $(window).resize(() => location.reload())

    })


    playAnimation('#itemcbfec770-74fe-11ec-9a45-85cd06378d51', [{
        "type": "fadeInLeft",
        "name": "向右移入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }, {
        "type": "fadeInRight",
        "name": "向左移入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }, {
        "type": "fadeInDown",
        "name": "向下移入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }, {
        "type": "fadeIn",
        "name": "淡入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#item636e2c90-74ff-11ec-9a45-85cd06378d51', [{
        "type": "bounceInDown",
        "name": "向下弹入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }, {
        "type": "fadeIn",
        "name": "淡入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#item8b26fd80-7440-11ec-b9a4-a304abb9328e', [{
        "type": "bounceInLeft",
        "name": "向右弹入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#item75409e50-7444-11ec-b9a4-a304abb9328e', [{
        "type": "fadeInDown",
        "name": "向下移入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#itema2662960-7451-11ec-b9a4-a304abb9328e', [{
        "type": "flipInY",
        "name": "翻转进入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }, {
        "type": "bounceInRight",
        "name": "向左弹入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#item9f194850-7451-11ec-b9a4-a304abb9328e', [{
        "type": "flipInY",
        "name": "翻转进入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#item61c691d6-4da0-4b3e-8635-13fb3f5adae3', [{
        "type": "flipInY",
        "name": "翻转进入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }, {
        "type": "bounceInRight",
        "name": "向左弹入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    playAnimation('#item8854a6d0-7444-11ec-b9a4-a304abb9328e', [{
        "type": "bounceInUp",
        "name": "向上弹入",
        "delayed": 0,
        "loop": false,
        "frequency": 1,
        "duration": 1,
        "isPlayer": false,
        "isDisabled": false
    }])


    /**
     *
     * @param {*} id
     * @param {*} animations
     * 执行动画库函数【不用修改,可自行调整位置】
     * 声明初始值
     * 判断动画是否结束
     */
    function playAnimation(id, animations) {

        let index = 0
        let ele = document.querySelector(id)
        setAnimation(ele, animations[index])
        ele.addEventListener('webkitAnimationEnd', function () {
            if (index < animations.length - 1) {
                index++
                setAnimation(ele, animations[index])
            }
        })
    }

    /**
     *
     * @param {*} element
     * @param {*} animation
     * 执行动画库函数【不用修改,可自行调整位置】
     * 取index对应的动画
     * 给元素animation重新赋值
     */
    function setAnimation(element, animation) {
        const action = `\${animation.duration * 1000}ms ease \${animation.delayed * 1000}ms \${animation.loop ? "infinite" : animation.frequency} normal both running \${animation.type}`
        element.style.animation = action
    }
</script>
</html>
