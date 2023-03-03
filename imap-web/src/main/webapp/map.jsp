<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="/static//images/windows-icon@2x.ico"/>

    <title>数据智能监控平台</title>

    <link rel="stylesheet" href="/resources/plugins/xadmin/css/font.css">
    <link rel="stylesheet" href="/resources/plugins/xadmin/css/xadmin.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/scroll/smallscroll.css">
    <script src="/resources/plugins/xadmin/js/jquery.min.js"></script>
    <script src="/resources/plugins/xadmin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/resources/plugins/xadmin/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/qfPassValue.js"></script>

    <!-- 轮播swiper插件样式 -->
    <link rel="stylesheet" href="/static/js/swiper/swiper.min.css"/>
    <!-- 翻牌器 -->
    <link rel="stylesheet" href="/static/js/cubeflop/cubeflop.css"/>

    <!-- 补间动画包 -->
    <link rel="stylesheet" href="/static/css/custom-animation.css"/>

    <!-- 重置样式 -->
    <link rel="stylesheet" href="/static/css/reset.css"/>

    <!-- 当前页面样式文件 -->
    <link rel="stylesheet" href="/static/css/map.css"/>

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
    <!-- 分组c984bb50-b835-11ed-9b45-97a79d61fdee开始-->
    <div id="itemc984bb50-b835-11ed-9b45-97a79d61fdee">
        <!-- 组件206558bf-f378-454d-b229-611a5eadcde9开始-->

        <div id="item206558bf-f378-454d-b229-611a5eadcde9" class="scrollTable">
            <table
                    style="width:100%;border-collapse: separate"
                    cellspacing="0"
                    cellpadding="0"
            >
                <thead
                        style="display:table;width:inherit;table-layout:fixed;box-sizing: border-box;"
                >
                <tr
                        class="thead-tr"
                        style="line-height: 40px;
        color: rgba(255, 255, 255, 1);
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
                    style="height: 845.99px;
            overflow: hidden;
            display: table;
            width: inherit;
            table-layout: fixed;
            box-sizing: border-box;
            color: rgba(222, 222, 222, 0.9);
            line-height: 35px;
            font-size: 16px;
            width: 100%;"
            >
                <ul id="item206558bf-f378-454d-b229-611a5eadcde9tbody"></ul>
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
                        "fontColor": "rgba(255, 255, 255, 1)",
                        "backgroundColor": "rgba(29, 78, 193, 1)"
                    },
                    "tbody": {
                        "align": "center",
                        "height": 35,
                        "fontSize": 16,
                        "fontColor": "rgba(222, 222, 222, 0.9)",
                        "backgroundColor": "rgba(23, 121, 200, 1)"
                    },
                    "border": {"show": true, "width": 0, "color": "rgba(255, 255, 255, 1)"},
                    "table": {
                        "stripe": true,
                        "stripeColor": "rgba(6, 152, 218, 1)",
                        "cellpadding": 0,
                        "cellspacing": 0,
                        "borderCollapse": "separate"
                    },
                    "defaultOption": {
                        "step": 0.6,
                        "limitMoveNum": 5,
                        "hoverStop": true,
                        "direction": 1,
                        "openWatch": true,
                        "singleHeight": 32,
                        "singleWidth": 0,
                        "waitTime": 1000
                    }
                };
                let scrollObj = null
                const init = () => {
                    $.ajax(
                        {
                            url: 'http://localhost:8080/api/alarm-all?',
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
                                    let thdom = document.querySelector('#item206558bf-f378-454d-b229-611a5eadcde9 .thead-tr')
                                    let thstr = ''
                                    for (let i = 0; i < thList.length; i++) {
                                        if (show) {
                                            thstr += `<td class="has-border" style="text-indent: 10px;text-align: center">\${thList[i]}</td>`
                                        } else {
                                            thstr += `<td class="no-border" style="text-indent: 10px;text-align: center">\${thList[i]}</td>`
                                        }
                                    }
                                    thdom.innerHTML = thstr
                                    let tbodydom = document.querySelector('#item206558bf-f378-454d-b229-611a5eadcde9tbody')
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
                                                trstr += `<div style="text-indent: 10px;display: table-cell;box-sizing: border-box;border: 0px solid  rgba(255, 255, 255, 1);text-align: center;word-break: break-all;">\${data[i][thList[j]]}</div>`
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
                                    if (data.length * option.tbody.height + option.theader.height > 885.99) {
                                        scrollObj = seamscroll.init({
                                            dom: document.getElementById('item206558bf-f378-454d-b229-611a5eadcde9tbody'),
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
            #item206558bf-f378-454d-b229-611a5eadcde9 {
                overflow: hidden;
                box-sizing: border-box;
            }

            #item206558bf-f378-454d-b229-611a5eadcde9 .has-border {
                border: 0px solid rgba(255, 255, 255, 1);
            }

            #item206558bf-f378-454d-b229-611a5eadcde9 .no-border {
                border: none;
            }

            #item206558bf-f378-454d-b229-611a5eadcde9 .li {
                display: table;
                width: inherit;
                table-layout: fixed;
                box-sizing: border-box;
                width: 100%;
                border-collapse: separate;
                border-spacing: 0px;
            }

            #item206558bf-f378-454d-b229-611a5eadcde9 .li div {
                background-color: rgba(23, 121, 200, 1);
            }

            #item206558bf-f378-454d-b229-611a5eadcde9 .stripe:nth-child(2n) div {
                background: rgba(6, 152, 218, 1);
            }
        </style>

        <!-- 组件206558bf-f378-454d-b229-611a5eadcde9结束-->

        <!-- 组件ec3ee3d0-b837-11ed-9b45-97a79d61fdee开始-->

        <div id="itemec3ee3d0-b837-11ed-9b45-97a79d61fdee">
            <h2>全站告警信息</h2>
        </div>

        <style>
            #itemec3ee3d0-b837-11ed-9b45-97a79d61fdee {
                color: rgba(39, 51, 68, 1);
                display: flex;
                text-align: center;
                line-height: 1;
                font-style: normal;
                justify-content: center;
                align-items: center;

            }
        </style>

        <!-- 组件ec3ee3d0-b837-11ed-9b45-97a79d61fdee结束-->

        <!-- 组件20a15e90-b834-11ed-9b45-97a79d61fdee开始-->

        <div id="item20a15e90-b834-11ed-9b45-97a79d61fdee">
            <img
                    src="/static/images/567ba222-4198-4ddf-b93c-e23293031439.png"
                    alt=""
            />
        </div>
        <style>
            #item20a15e90-b834-11ed-9b45-97a79d61fdee {
                width: 346.98px;
                height: 1013.11px;
            }

            #item20a15e90-b834-11ed-9b45-97a79d61fdee img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件20a15e90-b834-11ed-9b45-97a79d61fdee结束-->
    </div>
    <!-- 分组c984bb50-b835-11ed-9b45-97a79d61fdee结束-->

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
            <img
                    src="/static/images/2a67309e-36bf-451a-b7d9-cd4a39ecf940.png"
                    alt=""
            />
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
                    src="/static/images/1b9e6228-00aa-4b4e-957e-a39858880cab.png"
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
            <!-- 组件d2c36d65-04ee-419c-8252-fd8b146bf9b1开始-->

            <div id="itemd2c36d65-04ee-419c-8252-fd8b146bf9b1"></div>

            <script type="text/javascript">
                $(function () {
                    // 基于准备好的dom，初始化echarts实例
                    const myChart = echarts.init(document.getElementById("itemd2c36d65-04ee-419c-8252-fd8b146bf9b1"));
                    // 指定图表的配置项
                    const init = () => {
                        let option = {
                            "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                            "tooltip": {
                                "show": true,
                                "trigger": "item",
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
                                "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20},
                                "formatter": null
                            },
                            "title": {
                                "text": "",
                                "show": false,
                                "link": "http://weitu.yunzhisec.com",
                                "target": "blank",
                                "textStyle": {
                                    "color": "#fff",
                                    "fontStyle": "normal",
                                    "fontWeight": "normal",
                                    "fontSize": 14,
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
                                "left": "auto",
                                "top": "auto",
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
                                "top": "top",
                                "left": "center",
                                "orient": "horizontal",
                                "itemWidth": 8,
                                "itemHeight": 8,
                                "itemGap": 10,
                                "icon": "roundRect",
                                "textStyle": {"color": "rgba(1, 1, 1, 1)", "fontSize": 16}
                            },
                            "xAxis": {
                                "type": "value",
                                "show": false,
                                "axisLabel": {"show": false, "color": "#ffffff", "fontSize": 14, "margin": 8},
                                "axisLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "dashed", "width": 1}
                                },
                                "data": []
                            },
                            "yAxis": [{
                                "inverse": true,
                                "type": "category",
                                "show": true,
                                "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 14, "margin": 20},
                                "axisLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "dashed", "width": 1}
                                },
                                "data": []
                            }, {
                                "inverse": true,
                                "type": "category",
                                "show": true,
                                "axisLabel": {"show": true, "color": "rgba(0,0,0,1)", "fontSize": 14, "margin": 20},
                                "axisLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#27292d", "type": "dashed", "width": 1}
                                },
                                "data": [],
                                "position": "right"
                            }],
                            "color": [],
                            "series": []
                        };
                        let seriesStyle = {
                            "showBackground": true,
                            "backgroundStyle": {"color": "transparent", "opacity": 1},
                            "symbol": "data:image/png;base64,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",
                            "symbolSize": ["100%", "100%"],
                            "symbolRepeat": false,
                            "itemStyle": {
                                "shadowBlur": 0,
                                "shadowColor": "#5c1717",
                                "shadowOffsetX": 0,
                                "shadowOffsetY": 0,
                                "borderRadius": 0,
                                "borderColor": "#292929",
                                "borderWidth": 0,
                                "borderType": "dotted"
                            },
                            "label": {"show": false, "position": "right", "color": "#fff", "fontSize": 14},
                            "opacity": 1,
                            "z": 1,
                            "barWidth": 14
                        };
                        $.ajax(
                            {
                                url: 'http://localhost:8080/api/alarm-top5?',
                                type: 'GET',
                                data: {},
                                headers: {"token": null},
                                dataType: "json",
                                xhrFields: {withCredentials: false},
                                success: function (data) {
                                    // myChart.clear()

                                    //数据处理 开始
                                    let xKey = "value"
                                    let yKey = "time"
                                    let sKey = "name"
                                    let dataSeries = deepCopy(option.series)
                                    let seriesArr = []
                                    let dataColumn = []
                                    const colorList = option.color;
                                    data.forEach(item => seriesArr.push(item[sKey]))
                                    seriesArr = [...new Set(seriesArr)]
                                    if (xKey && xKey) {
                                        data.forEach(item => dataColumn.push(item[yKey]))
                                        dataColumn = [...new Set(dataColumn)]
                                        seriesArr.forEach(item => {
                                            let data1 = []
                                            data.forEach(oitem => {
                                                if (oitem[sKey] === item) {
                                                    data1.push({
                                                        name: oitem[yKey],
                                                        value: oitem[xKey]
                                                    })
                                                }
                                            })
                                            dataSeries.unshift({
                                                name: item,
                                                data: data1,
                                                type: 'bar'
                                            })
                                        })
                                    }
                                    seriesStyle.symbol = seriesStyle.symbol || 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAP8AAAAUCAYAAABCi+uLAAAAAXNSR0IB2cksfwAAAAlwSFlzAAALEwAACxMBAJqcGAAAChxJREFUeJztXDGyJDUMlWeIuQY34AJLFdEuAQkXIOAAROREHICAA0BCFSkJByDhAgRcgIAYftPdY7mfnp7c/XfD/a7a325blmVZT5I9s9PspbyUl/Jelrb9uX+8vFkfvzze7MfRsziFKPei/bb+e+rP54y7wvdK+536UBYlG66P52be1buSrbctwL+tbcvT47n3wXxtpVuWx5P5LTO5tr7/LK8b67hmpV9sa6JN6e1MV4rHlXmdbiaztzfRBmW5KC/vixxf8eG5n2v/z8VXsy9W3r+tz0+WN+2poLpUMvgd8Ar8k/ogVe3etr3cJuMK/huAWkUPPFMf0aMsO88+ftvkZtRuBz224ZyDNxtjn8vfd+NajmcyPF5zn2/waLGPx4068uYxG88FDFr0BxnYoNXeoV4KPch9ZfsivUj9I/8ncIi3g607Wtddgz1yHulJaw16F+/c7vINgUlHY7zoC09VBx0NPl7u9vMK/s/tHcoB/raCX4HdhcY+dgxiIR7JykWyozGig37esMCjF3QQiQ/IgsYUHBM6C1w3eXIHT0PZSP5FOKa93MDgFOBm4Mf+WzYGNnQELALDxycdzhwBA/ZGulJ8eRy2Oy06Xgc8rH0Aq0fl5IQNdN3bUG+Dj2UbWqo1us7YUdrRj4APssJcgxYd2wlmlH4S1rx9K3f7YXUAX9pblgP8W+RXwqhMoBA4Rf9qYcwP21g6mjcB1g2IgWbQTmNHFOb3yilwCoeG6lFdGLmK3ME43TCE8YaIwgbe09QENo46wD8YJcsFgA5rZIOrxuO74sVZBM5hlG01kNcOvXok9zLoBOjGWMwIyXY84iPIEy+QsbL7ILeJMcB3xkfavj9J997UbfO71QF8bW9RIviVAAgq5cGU4JWXw/G4kWbJowfDYJreH44DCxgH0xmBimh3PssRMb0+5kOA4xg3LurzOaUR4CYqcHb6s8iPIAtRSvSHdtZPFa2rualtgIyPHGfjqz0iAJvzd1kx5RfgR6CltB9kXFgGp1fpOQCQI31wymbJCWDbXp9l0cwL+4sA1PXyzeoAvrVnlgh+ZnrFG2Eft6ORYHSs0ph2gY/ZkZa3I7oHIwRFpvsCdBomDKUCm9Ojc7BjXlyfTC3ZAfR2GW3U8UDoQp5HUX9+PGBgTtZXgpT4GsgtQe/tFZgMdAX2wen0Xr+RnvmIQ2vgex3UUegzvRdjzgXa+lrC/lnmH3Rv1Ic6EfuZsmyiTRkEjGt3++rpdfvenlEO8PuZHwV0CkSKeE9ncVwMgIXbp2cgAkV4msVIi/RK0ZT+mfMC2hFx/BiBvDsvBvhOItL+KmXktaRNFc5iWsc2YcwlrdDN6XxmcwfC/SRbmgvHkU69DVP+wRYit78vYGe4T+n+AJ9m6TY/XaKKrGyAH+ewLDuvT9KQ/pJdo0Mg2lR/0H2xfNZ+sovlAD+m/eytlfcWQoVI4I7B2xj8lQERHQIxna2djo0LZRKOY+9Gh4BRn5xFuoGGC7905sd5q/MkA11EeXQOsxt6eTNN+lsjwhEtJhE4OYVG7dh3AuJTwMMzpcS+NqALt/097R9mRGDnufhM7vPghe2YEx2DkNX5JZ0LOtnnazhL+xUd88E60pt9ujqAX+1CyeCvPE01eeUwvA+88S4fXdo0pOU5CFiz2/7ggIRhD+Bh9MY2vABUhlI5luI+IKxFpYwMNnIS7ATSmoWjkHpRRwiuV2m7olfZQpVFzJwNPEeEpv1MRzRs88AAexoivYHjhfVXt/MpzZ/oYoxxvtV5HPfHYj3oQ9hX2DOb9CGPx/s/69/tOwC/20m5Dv6zPuZaOY4ZYEU/ghk/K1cf+YTIDU+8RArOgN+RF8pImxuiepcp9ZGxy8hPIMX1NMWrxXHTM78VbTNgz+pCxnfi2598lEupuu95B/xe7rB/IvLv2Q5+mcqnA5r0ToA1vlcA2ws6pag9HEM75uW+MB/U0QZVFsIf7yYZjva/1r+vVgfwp03KAX7+nF+BXYH/xCmktB8X6xtaXThRXwAoX7wRuAM/VC6MDbyRDzkDdds/1lb0OU8f78sxmCeAuDDCs8gfxihnQf0ypZ+d/0/mDZnWc5wG0YWsC/RiZiFyhjP/JFoH0KgLQlj37iycD9nF7IIP7a48++O8oq9sw31Sx4KOnfTpwcHnj/X5annd/raiHOA/+6jPXY4rRgkECwjAPnMO3uZHBB/L/WgoENXRS/I86rbfiI43LtGItI7PioPeNwQ3DcAVnIBHEpwDHYKBXNzPBq2A5c+zunK+s/O90K10NtgunEv6HobTIF9aX0Mb6XKG9L1RJqAcQpcnZAuUJbhMEtDtWFJ5jGjEC5+qLkCOtpL4aMDHtmX+NeAI/jMB00ghSCVQ4b1K4RGcHlnFHMEA+UlOIRwh+pdk0o0y0e1F3PQH5+T9YNwqtVcGiXOywQVjLdYXaCZ6CHUE4xl91VZF8yq7mPDCT15C3eI+JDq/ALyBHuzQM35yMxwu2wXwqr5zsT8w5XcVTs76aa1jkMmMs8SX4juj53arvwYcwa8YVulHBXg7oWfa2a0mjA0fzRGtzDIIpFsJkQEMP134db78uXOa06gfaK6e+dHQT0G2Ed0fT5nKsmPgM6oJnrN5GcRgvEHnuL8XMoYgA9UT6EDX+LHe3lek/UPXN3Dq/c/S+UzvZSz24Ts6kqRDXjdlF4medUL1aq7Rjns0y7IX/TXgCH4WQL3TBOFyDCTbvGJ3zNmzETCDh1+g36Bf1MP8DniMwNAfooKn4Ax+nlM5jXZEEyO+bADqaJDOhgwWWIt1HU3/M44bmRu6kKME+RnQDfptQivkTvPyOCWP2XGJ6vuJdkIOYa+jrl0PsL/8SYCBPsM+4D6anot1wMFh5jjCXLj2KqDOgqJ6n/HeF5S/BjwH/5kj4E1WNMXtfFnHp/CkSSl4B0EACqkfZg8NIkKL9EMEan9O5A8f7YD86FgGuNsRnUOkIrqwVm5vlqLf4LfQ2DNgc10Zleqv+M4cj2cRRqBrwGrr3yJI/0ov71cAnVk4u6vv9ks768+Q9Ykjw6Azi47d3yt7tYIG17gc9pHuC9CpsZ6BR0xzRH2JXwOO4GdPZMW7ugCzQ3gpFBsGCIqbjwAa/FTaD5sz2sQGJLmQP89l2WtX4E+03uaOZnL2DU4Db6/R4BgohdHyx2OnY6r6Vs5u5ZWBq3Fenzgrf4Zsi8bv0wEAh14QlFi3AyR+gx905PNgG2ZWOK/SKY8jh2EF7aX0n9s8e1nIFpiW6GW2AG3rY3wN2MH/0Vr70GZF/WhERfe2/dUPU8x+gEP1q3mEt8WCBsA/6sD06Wuhm6H993gOGrHO4SA+WOv/Pp6Jhsal/7DDhee5+mMdih/LU+n8bA4ey7rGHzE52Rc5l+tR6fhkfLqkUzq1vA9j/Jn9qrYZbor5L/1YCvZVPyDCwXgty+vHF4BE10t5KS/lfSj/A0bORlHG5bGkAAAAAElFTkSuQmCC'
                                    let seriesObj = dataSeries.map((item) => _.merge(item, seriesStyle));
                                    seriesObj[0].type = "pictorialBar";
                                    seriesObj[0].data = seriesObj[0].data.map(function (item) {
                                        return {
                                            name: item.name,
                                            value: item.value,
                                            symbol: 'image://' + seriesStyle.symbol
                                        };
                                    });
                                    let arr1 = [],
                                        arr2 = [];
                                    seriesObj[0].data.forEach((item) => {
                                        arr1.push(item.name);
                                        arr2.push(item.value);
                                    });
                                    option.yAxis[0].data = arr1;
                                    option.yAxis[1].data = arr2;
                                    // 数据处理完
                                    option.series = seriesObj

                                    myChart.setOption(option);
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

            <!-- 组件d2c36d65-04ee-419c-8252-fd8b146bf9b1结束-->

            <!-- 组件a61b51e0-7440-11ec-b9a4-a304abb9328e开始-->

            <div id="itema61b51e0-7440-11ec-b9a4-a304abb9328e">
                <h2>异常站点</h2>
            </div>

            <style>
                #itema61b51e0-7440-11ec-b9a4-a304abb9328e {
                    color: rgba(28, 31, 37, 1);
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
                <h2>监控事件类型</h2>
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

            <!-- 组件593872f5-ca97-498f-a0a9-d568087b7f72开始-->

            <div id="item593872f5-ca97-498f-a0a9-d568087b7f72"></div>

            <script type="text/javascript">
                $(function () {
                    // 基于准备好的dom，初始化echarts实例
                    const myChart = echarts.init(document.getElementById("item593872f5-ca97-498f-a0a9-d568087b7f72"));
                    // 指定图表的配置项
                    const init = () => {
                        let option = {
                            "grid": {"top": 15, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                            "tooltip": {
                                "show": true,
                                "trigger": "item",
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
                                "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20},
                                "formatter": null
                            },
                            "title": {
                                "text": "",
                                "show": false,
                                "link": "http://weitu.yunzhisec.com",
                                "target": "blank",
                                "textStyle": {
                                    "color": "#fff",
                                    "fontStyle": "normal",
                                    "fontWeight": "normal",
                                    "fontSize": 14,
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
                                "left": "auto",
                                "top": "auto",
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
                            "color": ["rgba(78,195,247,1)", "rgba(0,151,167,1)", "rgba(76,175,80,1)", "#3D9CFF", "rgba(157,39,176,1)", "rgba(255,193,6,1)"],
                            "series": [{
                                "itemStyle": {
                                    "borderWidth": 3,
                                    "borderColor": "rgba(246, 246, 249, 1)",
                                    "shadowColor": "rgba(33, 150, 243, 1)",
                                    "borderRadius": 2,
                                    "shadowBlur": 0,
                                    "shadowOffsetX": 0,
                                    "shadowOffsetY": 0
                                },
                                "label": {
                                    "show": true,
                                    "position": "outside",
                                    "formatter": null,
                                    "fontSize": 18,
                                    "lineHeight": 22,
                                    "color": "rgba(0, 0, 0, 1)"
                                },
                                "labelLine": {
                                    "length": 15,
                                    "length2": 15,
                                    "show": true,
                                    "color": "#00ffff",
                                    "lineStyle": {"width": 1, "type": "solid"}
                                },
                                "radius": ["35%", "60%"],
                                "type": "pie"
                            }]
                        };
                        option.series[0].label.formatter = (params) => {
                            return parseInt(params.percent) + "%" + "\n" + params.name;
                        };
                        $.ajax(
                            {
                                url: 'http://localhost:8080/api/alarm-types?',
                                type: 'GET',
                                data: {},
                                headers: {"token": null},
                                dataType: "json",
                                xhrFields: {withCredentials: false},
                                success: function (data) {
                                    // myChart.clear()

                                    //映射
                                    data = data.map(item => {
                                        return {value: item['value'], name: item['name']}
                                    })
                                    option.series[0].data = data
                                    // 使用刚指定的配置项和数据显示图表。
                                    myChart.setOption(option);
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

            <!-- 组件593872f5-ca97-498f-a0a9-d568087b7f72结束-->
        </div>
        <!-- 分组efc42c30-7441-11ec-b9a4-a304abb9328e结束-->

        <!-- 分组f2b865f0-7441-11ec-b9a4-a304abb9328e开始-->
        <div id="itemf2b865f0-7441-11ec-b9a4-a304abb9328e">
            <!-- 组件f2b865f2-7441-11ec-b9a4-a304abb9328e开始-->

            <div id="itemf2b865f2-7441-11ec-b9a4-a304abb9328e">
                <h2>每月告警数</h2>
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

            <!-- 组件ccfb645f-19a6-4e78-b5db-6a6b349adcc0开始-->

            <div id="itemccfb645f-19a6-4e78-b5db-6a6b349adcc0"></div>

            <script type="text/javascript">
                $(function () {
                    // 基于准备好的dom，初始化echarts实例
                    const myChart = echarts.init(document.getElementById("itemccfb645f-19a6-4e78-b5db-6a6b349adcc0"));
                    // 指定图表的配置项
                    const init = () => {
                        let option = {
                            "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                            "tooltip": {
                                "show": true,
                                "trigger": "item",
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
                                "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20},
                                "formatter": null
                            },
                            "title": {
                                "text": "",
                                "show": false,
                                "link": "http://weitu.yunzhisec.com",
                                "target": "blank",
                                "textStyle": {
                                    "color": "#fff",
                                    "fontStyle": "normal",
                                    "fontWeight": "normal",
                                    "fontSize": 14,
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
                                "left": "auto",
                                "top": "auto",
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
                                    "lineHeight": 1,
                                    "textBorderColor": "",
                                    "textBorderWidth": 1,
                                    "textBorderType": "solid",
                                    "textBorderDashOffset": 1,
                                    "textShadowColor": "transparent",
                                    "textShadowBlur": 1,
                                    "textShadowOffsetX": 1,
                                    "textShadowOffsetY": 1,
                                    "overflow": "none"
                                }
                            },
                            "legend": {
                                "show": false,
                                "top": "top",
                                "left": "right",
                                "orient": "horizontal",
                                "itemWidth": 25,
                                "itemHeight": 10,
                                "itemGap": 10,
                                "icon": "circle",
                                "textStyle": {"color": "#ffffff", "fontSize": 12, "lineHeight": 14}
                            },
                            "xAxis": {
                                "show": true,
                                "axisLabel": {
                                    "show": true,
                                    "color": "rgba(0,0,0,1)",
                                    "fontSize": 18,
                                    "margin": 20,
                                    "height": "14px"
                                },
                                "axisLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#181919", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#181919", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#181919", "type": "dashed", "width": 1}
                                },
                                "data": []
                            },
                            "yAxis": {
                                "show": true,
                                "name": "单位",
                                "nameTextStyle": {"color": "A3A7A9", "fontSize": 12, "padding": [0, 40, 0, 0]},
                                "axisLabel": {"show": true, "margin": 8, "color": "rgba(0,0,0,1)", "fontSize": 12},
                                "axisLine": {
                                    "show": false,
                                    "lineStyle": {"color": "#181919", "type": "solid", "width": 1}
                                },
                                "axisTick": {
                                    "show": false,
                                    "lineStyle": {"color": "#181919", "type": "solid", "width": 1}
                                },
                                "splitLine": {
                                    "show": true,
                                    "lineStyle": {"color": "rgba(172,167,167,1)", "type": "dashed", "width": 1}
                                }
                            },
                            "color": [{
                                "type": "linear",
                                "x": 0,
                                "y": 0,
                                "x2": 0,
                                "y2": 1,
                                "colorStops": [{"offset": 0, "color": "#399efe"}, {"offset": 0.82, "color": "#06f6f0"}]
                            }, "rgba(6,246,240,1)", "rgba(102,200,255,1)"],
                            "series": [{
                                "z": 2,
                                "type": "pictorialBar",
                                "data": [],
                                "symbol": "diamond",
                                "symbolOffset": [0, "50%"],
                                "useSeriesStyle": false,
                                "itemStyle": {"normal": {"borderWidth": 0}}
                            }, {
                                "z": 3,
                                "type": "pictorialBar",
                                "useSeriesStyle": false,
                                "symbolPosition": "end",
                                "data": [],
                                "symbol": "diamond",
                                "symbolOffset": [0, "-50%"],
                                "itemStyle": {"normal": {"borderWidth": 0}}
                            }]
                        };
                        let seriesStyle = {
                            "showBackground": false,
                            "backgroundStyle": {"color": "#0F2024", "opacity": 1},
                            "itemStyle": {
                                "shadowBlur": 0,
                                "shadowColor": "#5c1717",
                                "shadowOffsetX": 0,
                                "shadowOffsetY": 0,
                                "borderRadius": 0,
                                "borderColor": "#292929",
                                "borderWidth": 0,
                                "borderType": "dotted"
                            },
                            "barWidth": 24,
                            "label": {
                                "show": true,
                                "position": "top",
                                "color": "#3D9CFF",
                                "fontSize": 12,
                                "lineHeight": 16
                            },
                            "barGap": "50%"
                        };
                        $.ajax(
                            {
                                url: 'http://localhost:8080/api/alarm-month?',
                                type: 'GET',
                                data: {},
                                headers: {"token": null},
                                dataType: "json",
                                xhrFields: {withCredentials: false},
                                success: function (data) {
                                    // myChart.clear()

                                    //数据处理 开始
                                    let xKey = "time"
                                    let yKey = "value"
                                    let sKey = "name"
                                    let seriesArr = []
                                    let dataColumn = []
                                    data.forEach(item => seriesArr.push(item[sKey]))
                                    seriesArr = [...new Set(seriesArr)]
                                    let complexSeries = [];
                                    if (xKey && xKey) {
                                        data.forEach(item => dataColumn.push(item[xKey]))
                                        dataColumn = [...new Set(dataColumn)]

                                        function calcOffset(index) {
                                            const ofe = 70;
                                            const length = seriesArr.length;
                                            const startX = -(ofe * (length - 1));
                                            const offsetX = startX + ofe * index * 2;
                                            return offsetX + "%";
                                        }

                                        seriesArr.forEach((item, index) => {
                                            let arr = [];
                                            data.forEach(oitem => {
                                                if (oitem[sKey] === item) {
                                                    arr.push({
                                                        name: oitem[xKey],
                                                        value: oitem[yKey]
                                                    })
                                                }
                                            })
                                            complexSeries.push({
                                                name: item,
                                                data: arr,
                                                type: 'bar'
                                            })
                                            let copyStyleSeries = deepCopy(option.series);
                                            copyStyleSeries[0].data = arr;
                                            copyStyleSeries[1].data = arr;


                                            copyStyleSeries[0].symbolSize = [
                                                seriesStyle.barWidth,
                                                seriesStyle.barWidth * 0.5,
                                            ];
                                            copyStyleSeries[1].symbolSize = [
                                                seriesStyle.barWidth,
                                                seriesStyle.barWidth * 0.5,
                                            ];
                                            copyStyleSeries[0].symbolOffset = [calcOffset(index), "50%"];
                                            copyStyleSeries[1].symbolOffset = [calcOffset(index), "-50%"];
                                            complexSeries.push(...copyStyleSeries);
                                        });
                                    }
                                    let seriesObj = complexSeries.map((item) => {
                                        if (item.useSeriesStyle != false) {
                                            return (item = Object.assign(item, seriesStyle));
                                        } else {
                                            return (item = item);
                                        }
                                    });
                                    // 数据处理完
                                    option.yAxis.type = "value";
                                    option.xAxis.type = "category";
                                    option.xAxis.data = dataColumn;
                                    option.series = seriesObj

                                    myChart.setOption(option);
                                }
                            }
                        );
                    }
                    init()

                })
            </script>

            <!-- 组件ccfb645f-19a6-4e78-b5db-6a6b349adcc0结束-->
        </div>
        <!-- 分组f2b865f0-7441-11ec-b9a4-a304abb9328e结束-->

        <!-- 组件da89986b-47dc-4287-a774-a9ffb6461ff3开始-->

        <div id="itemda89986b-47dc-4287-a774-a9ffb6461ff3">
            <img
                    src="/static/images/05a03441-0572-4e06-83f9-4297575329f9.png"
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

    <!-- 分组8854a6d0-7444-11ec-b9a4-a304abb9328e开始-->
    <div id="item8854a6d0-7444-11ec-b9a4-a304abb9328e">
        <!-- 组件8015f312-20ec-4cd2-bacd-d52b5826e288开始-->

        <div id="item8015f312-20ec-4cd2-bacd-d52b5826e288"></div>

        <script type="text/javascript">
            $(function () {
                // 基于准备好的dom，初始化echarts实例
                const myChart = echarts.init(document.getElementById("item8015f312-20ec-4cd2-bacd-d52b5826e288"));
                // 指定图表的配置项
                const init = () => {
                    let option = {
                        "grid": {"top": 35, "left": 15, "right": 15, "bottom": 15, "containLabel": true},
                        "tooltip": {
                            "show": true,
                            "trigger": "item",
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
                            "textStyle": {"color": "rgba(31, 30, 30, 1)", "fontWeight": "normal", "fontSize": 20},
                            "formatter": null
                        },
                        "title": {
                            "text": "设备异常数",
                            "show": false,
                            "link": "http://weitu.yunzhisec.com",
                            "target": "blank",
                            "textStyle": {
                                "color": "rgba(0,0,0,1)",
                                "fontStyle": "normal",
                                "fontWeight": "normal",
                                "fontSize": 14,
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
                            "left": "auto",
                            "top": "auto",
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
                            "show": true,
                            "top": "top",
                            "left": "right",
                            "orient": "horizontal",
                            "itemWidth": 5,
                            "itemHeight": 5,
                            "itemGap": 10,
                            "icon": "circle",
                            "padding": [5, 30, 5, 30],
                            "textStyle": {"color": "rgba(4, 4, 4, 1)", "fontSize": 16, "lineHeight": 14}
                        },
                        "xAxis": {
                            "show": true,
                            "axisLabel": {
                                "show": true,
                                "axisLabel": {"show": true, "color": "#A9AEB2", "fontSize": 12},
                                "color": "rgba(0,0,0,1)",
                                "fontSize": 18,
                                "height": "14px",
                                "margin": 14
                            },
                            "axisLine": {"show": true, "lineStyle": {"color": "#181919", "type": "solid", "width": 1}},
                            "axisTick": {"show": false, "lineStyle": {"color": "#181919", "type": "solid", "width": 1}},
                            "splitLine": {
                                "show": false,
                                "lineStyle": {"color": "#181919", "type": "dashed", "width": 1}
                            },
                            "data": []
                        },
                        "yAxis": {
                            "show": true,
                            "axisLabel": {"margin": 10, "show": true, "color": "rgba(0,0,0,1)", "fontSize": 14},
                            "axisLine": {"show": false, "lineStyle": {"color": "#181919", "type": "solid", "width": 1}},
                            "axisTick": {"show": false, "lineStyle": {"color": "#181919", "type": "solid", "width": 1}},
                            "splitLine": {"show": true, "lineStyle": {"color": "#181919", "type": "dashed", "width": 1}}
                        },
                        "color": ["rgba(255,167,38,1)", "rgba(76,175,80,1)"]
                    };
                    let seriesStyle = {
                        "showBackground": false,
                        "backgroundStyle": {"color": "#0F2024", "opacity": 1},
                        "symbol": "path://M0,10 L10,10 C5.5,10 5.5,5 5,0 C4.5,5 4.5,10 0,10 z",
                        "itemStyle": {
                            "shadowBlur": 0,
                            "shadowColor": "#5c1717",
                            "shadowOffsetX": 0,
                            "shadowOffsetY": 0,
                            "borderRadius": 0,
                            "borderColor": "#292929",
                            "borderWidth": 0,
                            "borderType": "dotted"
                        },
                        "barWidth": 70,
                        "label": {"show": false, "position": "top", "color": "#ffffff", "fontSize": 12},
                        "barGap": "-100%"
                    };
                    $.ajax(
                        {
                            url: 'http://localhost:8080/api/alarm-site?',
                            type: 'GET',
                            data: {},
                            headers: {"token": null},
                            dataType: "json",
                            xhrFields: {withCredentials: false},
                            success: function (data) {
                                // myChart.clear()

                                //数据处理 开始
                                let xKey = "time"
                                let yKey = "value"
                                let sKey = "name"
                                let dataSeries = [];
                                let seriesArr = []
                                let dataColumn = []
                                data.forEach(item => seriesArr.push(item[sKey]))
                                seriesArr = [...new Set(seriesArr)]
                                if (xKey && xKey) {
                                    if (sKey) {
                                        data.forEach(item => dataColumn.push(item[xKey]))
                                        dataColumn = [...new Set(dataColumn)]
                                        seriesArr.forEach(item => {
                                            let data1 = []
                                            data.forEach(oitem => {
                                                if (oitem[sKey] === item) {
                                                    data1.push({
                                                        name: oitem[xKey],
                                                        value: oitem[yKey]
                                                    })
                                                }
                                            })
                                            dataSeries.push({
                                                name: item,
                                                data: data1,
                                                type: 'pictorialBar'
                                            })
                                        })
                                    } else {
                                        let data = [];
                                        data.forEach((item) => {
                                            data.push({
                                                name: item[xKey],
                                                value: item[yKey],
                                            });
                                            dataColumn.push(item[xKey]);
                                        });
                                        dataSeries.push({
                                            type: 'pictorialBar',
                                            data: data,
                                        });
                                    }
                                }
                                // 数据处理完
                                option.series = dataSeries.map((item, index) =>
                                    _.merge(item, seriesStyle)
                                );
                                option.yAxis.type = "value";
                                option.xAxis.type = "category";
                                option.xAxis.data = dataColumn;

                                myChart.setOption(option);
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

        <!-- 组件8015f312-20ec-4cd2-bacd-d52b5826e288结束-->

        <!-- 组件8de8acf1-74ed-11ec-9a45-85cd06378d51开始-->

        <div id="item8de8acf1-74ed-11ec-9a45-85cd06378d51">
            <h3>设备告警数汇总</h3>
        </div>

        <style>
            #item8de8acf1-74ed-11ec-9a45-85cd06378d51 {
                color: rgba(39, 51, 68, 1);
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
                    src="/static/images/21050e53-9b95-40d3-964e-08567f8c3a6e.png"
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

    <!-- 分组75409e50-7444-11ec-b9a4-a304abb9328e开始-->
    <div id="item75409e50-7444-11ec-b9a4-a304abb9328e">
        <!-- 组件db023df8-378f-403c-ba2b-0a062a1f6d8b开始-->

        <div id="itemdb023df8-378f-403c-ba2b-0a062a1f6d8b"></div>

        <script type="text/javascript">
            $(function () {

                const option = {
                    "ak": "A7k1gG8kkYyeaH18ChpXPgccKherDKDe",
                    "center": {"lng": 121.550181, "lat": 31.229274},
                    "zoom": 10,
                    "switch3D": "BMAP_NORMAL_MAP",
                    "baiduMap": {
                        "tools": {
                            "scale": {
                                "show": false,
                                "anchor": "BMAP_ANCHOR_TOP_RIGHT",
                                "offset": [0, 0]
                            },
                            "citylist": {"name": "", "show": false, "anchor": "BMAP_ANCHOR_TOP_LEFT", "offset": [0, 0]},
                            "navigation": {"show": false, "anchor": "BMAP_ANCHOR_TOP_RIGHT", "offset": [0, 0]},
                            "zoom": {"show": false, "anchor": "BMAP_ANCHOR_TOP_RIGHT", "offset": [0, 0]},
                            "personality": {"show": true, "styleId": "0aa7d7abbac6d3aaef9f0b94afad1ad2"}
                        }
                    },
                    "series": []
                };
                const source = [];
                /**
                 * 创建script 动态引入百度地图API
                 * 等待script加载完成后初始化地图
                 * 根据option渲染相对应的控件和组件
                 */
                const url = `https://api.map.baidu.com/api?type=webgl&v=1.0&ak=\${option.ak}&callback=init`
                const _script = document.createElement('script')
                _script.src = url
                _script.type = "text/javascript"
                _script.setAttribute("id", 'VT-BMP')

                const BMPId = document.getElementById("VT-BMP")
                if (!BMPId) {
                    document.head.appendChild(_script)
                }
                console.log(_script._proto_)
                //监听加载事件
                window.onload = function () {
                    const baiduMap = option.baiduMap;
                    const map = new BMapGL.Map("itemdb023df8-378f-403c-ba2b-0a062a1f6d8b");
                    let scale, citylist, navigation, zoom, personality = null;
                    map.centerAndZoom(new BMapGL.Point(option.center.lng, option.center.lat), option.zoom);
                    map.enableScrollWheelZoom(true);
                    option.switch3D == "BMAP_NORMAL_MAP"
                        ? map.setMapType(BMAP_NORMAL_MAP)
                        : map.setMapType(BMAP_EARTH_MAP);

                    //比例尺
                    if (baiduMap.tools.scale.show) {
                        switch (baiduMap.tools.scale.anchor) {
                            case "BMAP_ANCHOR_TOP_LEFT":
                                scale = new BMapGL.ScaleControl({
                                    anchor: BMAP_ANCHOR_TOP_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_TOP_RIGHT":
                                scale = new BMapGL.ScaleControl({
                                    anchor: BMAP_ANCHOR_TOP_RIGHT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_LEFT":
                                scale = new BMapGL.ScaleControl({
                                    anchor: BMAP_ANCHOR_BOTTOM_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_RIGHT":
                                scale = new BMapGL.ScaleControl({
                                    anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                                });
                                break;

                            default:
                                break;
                        }
                        map.addControl(scale)
                    }
                    // 城市列表
                    if (baiduMap.tools.citylist.show) {
                        switch (option.baiduMap.tools.citylist.anchor) {
                            case "BMAP_ANCHOR_TOP_LEFT":
                                citylist = new BMapGL.CityListControl({
                                    anchor: BMAP_ANCHOR_TOP_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_TOP_RIGHT":
                                citylist = new BMapGL.CityListControl({
                                    anchor: BMAP_ANCHOR_TOP_RIGHT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_LEFT":
                                citylist = new BMapGL.CityListControl({
                                    anchor: BMAP_ANCHOR_BOTTOM_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_RIGHT":
                                citylist = new BMapGL.CityListControl({
                                    anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                                });
                                break;

                            default:
                                break;
                        }
                        map.addControl(citylist)
                    }
                    // 视角切换
                    if (baiduMap.tools.navigation.show) {
                        switch (baiduMap.tools.navigation.anchor) {
                            case "BMAP_ANCHOR_TOP_LEFT":
                                navigation = new BMapGL.NavigationControl3D({
                                    anchor: BMAP_ANCHOR_TOP_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_TOP_RIGHT":
                                navigation = new BMapGL.NavigationControl3D({
                                    anchor: BMAP_ANCHOR_TOP_RIGHT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_LEFT":
                                navigation = new BMapGL.NavigationControl3D({
                                    anchor: BMAP_ANCHOR_BOTTOM_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_RIGHT":
                                navigation = new BMapGL.NavigationControl3D({
                                    anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                                });
                                break;

                            default:
                                break;
                        }
                        map.addControl(navigation)
                    }
                    // 缩放
                    if (baiduMap.tools.zoom.show) {
                        switch (baiduMap.tools.zoom.anchor) {
                            case "BMAP_ANCHOR_TOP_LEFT":
                                zoom = new BMapGL.ZoomControl({
                                    anchor: BMAP_ANCHOR_TOP_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_TOP_RIGHT":
                                zoom = new BMapGL.ZoomControl({
                                    anchor: BMAP_ANCHOR_TOP_RIGHT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_LEFT":
                                zoom = new BMapGL.ZoomControl({
                                    anchor: BMAP_ANCHOR_BOTTOM_LEFT,
                                });
                                break;
                            case "BMAP_ANCHOR_BOTTOM_RIGHT":
                                zoom = new BMapGL.ZoomControl({
                                    anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                                });
                                break;

                            default:
                                break;
                        }
                        map.addControl(zoom)
                    }
                    //个性化地图
                    if (baiduMap.tools.personality.show && baiduMap.tools.personality.styleId !== '' && option.baiduMap.tools.personality.styleId.length == 32) {
                        map.setMapStyleV2({
                            styleId: baiduMap.tools.personality.styleId,
                        });
                    }
                    const series = option.series
                    if (source && source.length <= 0) {
                        map.clearOverlays();
                    } else {
                        source.forEach((item, index) => {
                            const findSeries = option.series.find((oitem) => oitem.name == item.name)
                            const findSeriesIndex = option.series.findIndex((oitem) => oitem.name == item.name)
                            if (item.source.mapping !== null) {
                                const {type, mapping} = item.source;
                                if (type == 'static') {
                                    // 处理多边形样式和数据
                                    if (item.value == "polygon") {
                                        let points = [];
                                        item.source.static.forEach((_item) => {
                                            points.push(new BMapGL.Point(_item.lng, _item.lat));
                                        });
                                        const polygon = new BMapGL.Polygon(points, {
                                            fillColor: series[index].itemStyle.fillColor,
                                            strokeStyle: series[index].itemStyle.strokeStyle,
                                            fillOpacity: series[index].itemStyle.fillOpacity,
                                            strokeColor: series[index].itemStyle.strokeColor,
                                            strokeWeight: series[index].itemStyle.strokeWeight,
                                            strokeOpacity: series[index].itemStyle.strokeOpacity,
                                        });
                                        map.addOverlay(polygon);
                                    }
                                    // 处理圆形样式和数据
                                    if (item.value == "circular") {
                                        const circle = new BMapGL.Circle(
                                            new BMapGL.Point(
                                                item.source.static.center.lng,
                                                item.source.static.center.lat
                                            ),
                                            item.source.static.radius,
                                            {
                                                fillColor: series[index].itemStyle.fillColor,
                                                strokeStyle: series[index].itemStyle.strokeStyle,
                                                fillOpacity: series[index].itemStyle.fillOpacity,
                                                strokeColor: series[index].itemStyle.strokeColor,
                                                strokeWeight: series[index].itemStyle.strokeWeight,
                                                strokeOpacity: series[index].itemStyle.strokeOpacity,
                                            }
                                        );
                                        map.addOverlay(circle);
                                    }
                                    if (item.value == "brokenLine") {
                                        const polyline = new BMapGL.Polyline(item.source.static, {
                                            strokeColor: series[index].itemStyle.strokeColor,
                                            strokeStyle: series[index].itemStyle.strokeStyle,
                                            strokeWeight: series[index].itemStyle.strokeWeight,
                                            strokeOpacity: series[index].itemStyle.strokeOpacity,
                                        });
                                        map.addOverlay(polyline);
                                    }

                                    if (item.value == "marker") {
                                        const cityGeo = new BMapGL.Geocoder();
                                        item.source.static.forEach((_item) => {
                                            cityGeo.getPoint(_item.name, (point) => {
                                                let marker = null;
                                                const pt = new BMapGL.Point(point.lng, point.lat);
                                                const icon = new BMapGL.Icon(
                                                    _item.icon,
                                                    new BMapGL.Size(40, 40)
                                                );
                                                if (_item.icon) {
                                                    marker = new BMapGL.Marker3D(pt, _item.high, {
                                                        size: 80,
                                                        icon: icon,
                                                    });
                                                } else {
                                                    marker = new BMapGL.Marker(pt);
                                                }
                                                map.addOverlay(marker);
                                            });
                                        });
                                    }
                                } else if (type == "api") {
                                    const {
                                        requestType,
                                        requestHeader,
                                        getParam,
                                        postParam,
                                        requestUrl,
                                        cookie,
                                        sources
                                    } = item.source.api;
                                    const init = () => {
                                        $.ajax({
                                            url: sources.baseURL + requestUrl + '?' + getParam,
                                            type: requestType,
                                            data: JSON.stringify(postParam),
                                            headers: JSON.stringify(requestHeader),
                                            dataType: "json",
                                            xhrFields: {withCredentials: cookie},
                                            success: function (data) {
                                                // 过滤器
                                                if (item.source.filter.isFilter) {
                                                    function filterFn(data, callbackArgs) {
                                                        item.source.filter.data.code
                                                    }

                                                    data = filterFn(data)
                                                }

                                                data.forEach((item, index) => {
                                                    // 处理多边形样式和数据
                                                    if (item.value == "polygon") {
                                                        let points = [];
                                                        item.source.static.forEach((_item) => {
                                                            points.push(new BMapGL.Point(_item.lng, _item.lat));
                                                        });
                                                        const polygon = new BMapGL.Polygon(points, {
                                                            fillColor: series[index].itemStyle.fillColor,
                                                            strokeStyle: series[index].itemStyle.strokeStyle,
                                                            fillOpacity: series[index].itemStyle.fillOpacity,
                                                            strokeColor: series[index].itemStyle.strokeColor,
                                                            strokeWeight: series[index].itemStyle.strokeWeight,
                                                            strokeOpacity: series[index].itemStyle.strokeOpacity,
                                                        });
                                                        map.addOverlay(polygon);
                                                    }
                                                    // 处理圆形样式和数据
                                                    if (item.value == "circular") {
                                                        const circle = new BMapGL.Circle(
                                                            new BMapGL.Point(
                                                                item.source.static.center.lng,
                                                                item.source.static.center.lat
                                                            ),
                                                            item.source.static.radius,
                                                            {
                                                                fillColor: series[index].itemStyle.fillColor,
                                                                strokeStyle: series[index].itemStyle.strokeStyle,
                                                                fillOpacity: series[index].itemStyle.fillOpacity,
                                                                strokeColor: series[index].itemStyle.strokeColor,
                                                                strokeWeight: series[index].itemStyle.strokeWeight,
                                                                strokeOpacity: series[index].itemStyle.strokeOpacity,
                                                            }
                                                        );
                                                        map.addOverlay(circle);
                                                    }
                                                    if (item.value == "brokenLine") {
                                                        const polyline = new BMapGL.Polyline(item.source.static, {
                                                            strokeColor: series[index].itemStyle.strokeColor,
                                                            strokeStyle: series[index].itemStyle.strokeStyle,
                                                            strokeWeight: series[index].itemStyle.strokeWeight,
                                                            strokeOpacity: series[index].itemStyle.strokeOpacity,
                                                        });
                                                        map.addOverlay(polyline);
                                                    }

                                                    if (item.value == "marker") {
                                                        const cityGeo = new BMapGL.Geocoder();
                                                        item.source.static.forEach((_item) => {
                                                            cityGeo.getPoint(_item.name, (point) => {
                                                                let marker = null;
                                                                const pt = new BMapGL.Point(point.lng, point.lat);
                                                                const icon = new BMapGL.Icon(
                                                                    _item.icon,
                                                                    new BMapGL.Size(40, 40)
                                                                );
                                                                if (_item.icon) {
                                                                    marker = new BMapGL.Marker3D(pt, _item.high, {
                                                                        size: 80,
                                                                        icon: icon,
                                                                    });
                                                                } else {
                                                                    marker = new BMapGL.Marker(pt);
                                                                }
                                                                map.addOverlay(marker);
                                                            });
                                                        });
                                                    }
                                                })
                                            }
                                        })
                                    }
                                }
                            }

                        })
                    }
                    // 创建图标
                    var myIcon = new BMapGL.Icon("/img/camera.png", new BMapGL.Size(52, 52));
                    addSite = function (site_info) {
                        var site_id = site_info.site_id
                        var name = site_info.site_name
                        var admin = site_info.administrator
                        var lon = site_info.lon
                        var lat = site_info.lat
                        var url = site_info.url

                        // 创建Marker标注，使用图标
                        var pt = new BMapGL.Point(lon, lat);
                        var marker = new BMapGL.Marker(pt, {
                            icon: myIcon
                        });

                        // 将标注添加到地图
                        map.addOverlay(marker);

                        // 创建信息窗口
                        var opts = {
                            width: 250,
                            height: 350,
                            title: name
                        };
                        // info =
                        // 点标记添加点击事件
                        marker.addEventListener('click', function () {
                            // 获取监控数据
                            $.ajax(
                                {
                                    url: 'http://localhost:8080/api/cur/' + site_id,
                                    type: 'GET',
                                    data: {},
                                    headers: {"token": null},
                                    dataType: "json",
                                    xhrFields: {withCredentials: false},
                                    success: function (data) {
                                        var infoWindow = new BMapGL.InfoWindow(
                                            '站点编号：' + site_id +
                                            '</br>管理员：' + admin +
                                            '</br>站点名称：' + name +
                                            '</br>经度：' + lon +
                                            '</br>维度：' + lat +
                                            '</br>时间：' + data.time +
                                            '</br>温度：' + data.tmp + " ℃" +
                                            '</br>湿度：' + data.hmt + " %" +
                                            '</br>亮度：' + data.lx + " lx" +
                                            '</br>站点监控：' + '<button class="layui-btn layui-btn-sm" onclick="xadmin.open(\'' +
                                            name + '\',\'' + url + '\',650,530)"> 监控视频</button>' +
                                            '</br></br>详细信息：' + '<a href="/site/'+site_id+'"><button class="layui-btn layui-btn-sm">前往站点</button></a>'
                                            , opts);
                                        map.openInfoWindow(infoWindow, pt); // 开启信息窗
                                    }
                                }
                            );

                        });
                    }

                    // 获取站点数据
                    $.ajax(
                        {
                            url: 'http://localhost:8080/system/site/getAllList',
                            type: 'GET',
                            data: {},
                            headers: {"token": null},
                            dataType: "json",
                            xhrFields: {withCredentials: false},
                            success: function (data) {
                                for (let i = 0; i < data.count; i++) {
                                    console.log(data.data[i])
                                    addSite(data.data[i])
                                }
                            }
                        }
                    );

                }
            })


        </script>

        <!-- 组件db023df8-378f-403c-ba2b-0a062a1f6d8b结束-->

        <!-- 组件aae92740-f536-46f5-aff0-e7178773154a开始-->

        <div id="itemaae92740-f536-46f5-aff0-e7178773154a">
            <img
                    src="/static/images/b0bd5d71-8b7d-45a5-adb9-b73a7b4b48fa.png"
                    alt=""
            />
        </div>
        <style>
            #itemaae92740-f536-46f5-aff0-e7178773154a {
                width: 1003.6px;
                height: 671.2px;
            }

            #itemaae92740-f536-46f5-aff0-e7178773154a img {
                width: 100%;
                height: 100%
            }
        </style>
        <!-- 组件aae92740-f536-46f5-aff0-e7178773154a结束-->
    </div>
    <!-- 分组75409e50-7444-11ec-b9a4-a304abb9328e结束-->
</div>
</body>
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
